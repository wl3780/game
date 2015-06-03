package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.ProcedureInfo;
    import com.tencent.ai.core.data.SceneConfigInfo;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.ai.core.data.SceneLayerInfo;
    import com.tencent.ai.core.data.SceneNpcInfo;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.core.filesystem.FileLoader;
    import com.tencent.free.core.filesystem.IFile;
    import com.tencent.free.core.manager.task.Priority;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.logging.error;
    import com.tencent.free.mff.MFF;
    import com.tencent.free.mff.MFFFile;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.free.utils.XString;
    
    import deng.fzip.FZip;
    import deng.fzip.FZipFile;
    
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public class ScenePrepare extends EventDispatcher 
    {

        public var totalItem:int;
        public var loadedItem:int;
        public var prepareComplete:Boolean;
        public var config:Dictionary;
		
        private var lockFileList:DictionaryEx;
        private var _sceneBytes:int;
        private var _sceneInfo:SceneInfo;
        private var _cfgFileLoader:FileLoader;
        private var _parseConfigHandler:Dictionary;

        public function ScenePrepare(info:SceneInfo)
        {
            _sceneInfo = info;
            this.lockFileList = this.lockFileList || new DictionaryEx();
            _parseConfigHandler = new Dictionary();
            _parseConfigHandler["zip"] = this.paseZIPHandler;
            _parseConfigHandler["mff"] = this.paseMFFHandler;
            this.config = new Dictionary();
            this.prepareComplete = false;
        }

        private function collectConfig(fileName:String, data:ByteArray):void
        {
            var fileList:Array = fileName.split(".");
            fileName = fileList[0];
            var fileType:String = fileList[1];
            if (fileType == "xml") {
	            var xml:XML = new XML(data.readUTFBytes(data.bytesAvailable));
                switch (fileName) {
                    case "scene":
			            var sceneConfig:SceneConfigInfo = new SceneConfigInfo();
                        sceneConfig.decode(xml);
                        this.config[fileName] = sceneConfig;
                        return;
                    case "npc":
			            var npcList:Vector.<SceneNpcInfo> = new Vector.<SceneNpcInfo>();
						var npcXMLList:XMLList = xml.Npc;
                        for each (var npcXML:XML in npcXMLList) {
							var npcInfo:SceneNpcInfo = new SceneNpcInfo();
                            npcInfo.decode(npcXML);
                            npcList.push(npcInfo);
                        }
                        npcList.fixed = true;
                        this.config[fileName] = npcList;
                        return;
                    case "interact":
						var itemList:Vector.<InteractItemInfo> = new Vector.<InteractItemInfo>();
						var itemXMLList:XMLList = xml.Item;
                        for each (var itemXML:XML in itemXMLList) {
							var itemInfo:InteractItemInfo = new InteractItemInfo();
                            itemInfo.renderLevel = itemXML.hasOwnProperty("@renderLevel") ? Number(itemXML.@renderLevel) : -1;
                            itemInfo.id = int(itemXML.@id);
							var interactID:int = int(itemXML.@interactID);
							var interactInfo:InteractItemStaticInfo = AICore.data.getInteractItemStaticInfo(interactID);
                            if (!interactInfo) {
								var msg:String = "ID 为 " + interactID + " 的交互物件不存在！";
                                error(msg);
                            }
                            itemInfo.setStaticInfo(interactInfo);
                            itemInfo.groupID = interactInfo.groupID;
                            itemInfo.amityGroupID = interactInfo.groupID;
                            itemInfo.direction = Direction.RIGHT;
                            itemInfo.location = MapPosition.DecodeXML(itemXML);
                            itemInfo.dropPackageID = int(itemXML.@dropID);
                            if (itemXML.hasOwnProperty("@direction")) {
                                itemInfo.direction = int(itemXML.@direction);
                            }
                            if (itemXML.hasOwnProperty("Tinge")) {
								var tingeXML:XML = itemXML.Tinge[0];
								var tingeInfo:TingeInfo = new TingeInfo();
                                tingeInfo.decode(tingeXML);
                                itemInfo.tingeInfo = tingeInfo;
                            }
                            if (itemXML.hasOwnProperty("AdjustColor")) {
								var colorXML:XML = itemXML.AdjustColor[0];
								var colorInfo:AdjustColorInfo = new AdjustColorInfo();
                                colorInfo.decode(colorXML);
                                itemInfo.adjustColorInfo = colorInfo;
                            }
                            if (itemXML.hasOwnProperty("property")) {
								var argList:Vector.<PropertyArg> = new Vector.<PropertyArg>();
								var argXMLList:XMLList = itemXML.property;
                                for each (var argXML:XML in argXMLList) {
									var propArg:PropertyArg = PropertyArg.newArg(argXML.@type);
                                    propArg.decode(argXML);
                                    argList.push(propArg);
                                }
                                itemInfo.propertyArgList = argList;
                            }
                            if (itemXML.hasOwnProperty("ProcedureInfo")) {
								var proXML:XML = itemXML.ProcedureInfo[0];
                                itemInfo.procedureInfo = new ProcedureInfo();
                                itemInfo.procedureInfo.decode(proXML);
                            }
                            itemList.push(itemInfo);
                        }
                        itemList.fixed = true;
                        this.config[fileName] = itemList;
                        return;
                    default:
                        this.config[fileName] = xml;
                }
            }
        }

        private function paseZIPHandler(bytes:ByteArray):void
        {
            var zip:FZip = new FZip();
            zip.loadBytes(bytes);
            var len:uint = zip.getFileCount();
            var idx:int;
            while (idx < len) {
	            var file:FZipFile = zip.getFileAt(idx);
	            var data:ByteArray = file.content;
                this.collectConfig(file.filename, data);
                data.clear();
                idx++;
            }
        }

        private function paseMFFHandler(bytes:ByteArray):void
        {
            var mff:MFF = new MFF(false);
            mff.decode(bytes);
            var list:Vector.<MFFFile> = mff.getMMFFiles();
            var idx:int;
            while (idx < list.length) {
	            var file:MFFFile = list[idx];
                this.collectConfig(file.mffName, file.mffBytes);
                idx++;
            }
            mff.dispose();
        }

        private function onCfgFileLoad(evt:TaskEvent):void
        {
            if (evt.type == TaskEvent.COMPLETE) {
	            var file:IFile = _cfgFileLoader.content as IFile;
	            var bytes:ByteArray = file.bytes;
                bytes.position = 0;
	            var ext:String = XString.getURLExtension(Redirect.redirect(file.url));
            	var handler:Function = _parseConfigHandler[ext];
                handler(bytes);
				
	            var sceneConfig:SceneConfigInfo = this.config["scene"];
                if (sceneConfig != null) {
                    this.loadSceneConfig(sceneConfig);
                }
            } else {
	            var event:ScenePrepareEvent = new ScenePrepareEvent(ScenePrepareEvent.ERROR);
                event.sceneID = _sceneInfo.sceneID;
                event.totalItem = this.totalItem;
                event.loadedItem = this.loadedItem;
                this.dispatchEvent(event);
            }
        }

        private function loadSceneConfig(sceneConfig:SceneConfigInfo):void
        {
            this.totalItem = 0;
            this.loadedItem = 0;
            var list:Vector.<SceneLayerInfo> = sceneConfig.layerList;
            for each (var info:SceneLayerInfo in list) {
	            var items:Vector.<SceneItemInfo> = info.itemList;
                for each (var itm:SceneItemInfo in items) {
                    if (!itm.resPath) {
						break;
					}
		            var path:String = DEFINE.G_SCENE_RES_SRC + itm.resPath;
                    if (!this.lockFileList[path]) {
			            var loader:FileLoader = new FileLoader(path);
                        loader.priority = Priority.PERIORITY_HIGH;
                        loader.content.addEventListener(TaskEvent.COMPLETE, this.onResourceLoaded);
                        loader.content.addEventListener(TaskEvent.PROGRESS, this.onResourceLoaded);
                        loader.content.addEventListener(TaskEvent.IO_ERROR, this.onResourceLoaded);
                        loader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onResourceLoaded);
                        loader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onResourceLoaded);
                        this.lockFileList[path] = loader;
                        this.totalItem++;
                        loader.load();
                    }
                }
            }
            if (this.totalItem == this.loadedItem) {
                this.sendLoaderOK();
            }
        }

        private function sendLoaderOK():void
        {
            this.prepareComplete = true;
            var event:ScenePrepareEvent = new ScenePrepareEvent(ScenePrepareEvent.COMPLETE);
            event.sceneID = -1;
            event.totalItem = this.totalItem;
            event.loadedItem = this.loadedItem;
            this.dispatchEvent(event);
        }

        private function onResourceLoaded(evt:TaskEvent):void
        {
            var event:ScenePrepareEvent;
            if (evt.type == TaskEvent.COMPLETE) {
	            var loader:FileLoader = this.lockFileList[evt.key];
                if (loader && loader.content.isLoaded()) {
                    this.loadedItem++;
                    event = new ScenePrepareEvent(ScenePrepareEvent.LOAD_PROESS);
                    event.sceneID = _sceneInfo.sceneID;
                    event.totalItem = this.totalItem;
                    event.loadedItem = this.loadedItem;
                    event.bytesTotal = _sceneBytes;
                    event.key = String(evt.key);
                    this.dispatchEvent(event);
                    if (this.totalItem != 0 && this.totalItem == this.loadedItem) {
                        this.sendLoaderOK();
                    }
                }
            } else {
                if (evt.type == TaskEvent.PROGRESS) {
                    _sceneBytes = evt.bytesTotal;
                } else {
                    event = new ScenePrepareEvent(ScenePrepareEvent.ERROR);
                    event.sceneID = _sceneInfo.sceneID;
                    event.totalItem = this.totalItem;
                    event.loadedItem = this.loadedItem;
                    this.dispatchEvent(event);
                }
            }
        }

        public function get sceneInfo():SceneInfo
        {
            return _sceneInfo;
        }

        public function load():void
        {
            _cfgFileLoader = new FileLoader(_sceneInfo.sceneConfig);
            _cfgFileLoader.priority = Priority.PERIORITY_HIGH;
            _cfgFileLoader.content.addEventListener(TaskEvent.COMPLETE, this.onCfgFileLoad);
            _cfgFileLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onCfgFileLoad);
            _cfgFileLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onCfgFileLoad);
            _cfgFileLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onCfgFileLoad);
            _cfgFileLoader.load();
        }

        public function unload():void
        {
            if (_cfgFileLoader) {
                _cfgFileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onCfgFileLoad);
                _cfgFileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onCfgFileLoad);
                _cfgFileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onCfgFileLoad);
                _cfgFileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onCfgFileLoad);
                _cfgFileLoader.unload();
                _cfgFileLoader = null;
            }
            if (this.lockFileList) {
                for each (var loader:FileLoader in this.lockFileList) {
                    loader.content.removeEventListener(TaskEvent.COMPLETE, this.onResourceLoaded);
                    loader.content.removeEventListener(TaskEvent.PROGRESS, this.onResourceLoaded);
                    loader.content.removeEventListener(TaskEvent.IO_ERROR, this.onResourceLoaded);
                    loader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onResourceLoaded);
                    loader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onResourceLoaded);
                    loader.unload();
                }
                this.lockFileList = null;
            }
            _sceneInfo = null;
            this.config = null;
        }

        public function onLoadProgress(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
        }

    }
}
