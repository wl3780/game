// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.ScenePrepare

package com.tencent.ai.core.scene
{
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.free.core.filesystem.FileLoader;
    import com.tencent.ai.core.data.SceneConfigInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.SceneNpcInfo;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.ProcedureInfo;
    import flash.utils.ByteArray;
    import deng.fzip.FZipFile;
    import deng.fzip.FZip;
    import com.tencent.free.mff.MFFFile;
    import com.tencent.free.mff.MFF;
    import com.tencent.free.core.filesystem.IFile;
    import com.tencent.free.core.events.TaskEvent;
    import com.tencent.free.utils.XString;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.ai.core.data.SceneLayerInfo;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.core.manager.task.Priority;
    import  ©init._SafeStr_1145;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class ScenePrepare extends EventDispatcher 
    {

        public var totalItem:int;
        public var loadedItem:int;
        public var prepareComplete:Boolean;
        public var config:Dictionary;
        private var _sceneBytes:int;
        private var _sceneInfo:SceneInfo;
        private var lockFileList:DictionaryEx;
        private var _cfgFileLoader:FileLoader;
        private var _parseConfigHandler:Dictionary;

        public function ScenePrepare(_arg_1:SceneInfo)
        {
            this._sceneInfo = _arg_1;
            this.lockFileList = ((this.lockFileList) || (new DictionaryEx()));
            this._parseConfigHandler = new Dictionary();
            this._parseConfigHandler["zip"] = this.paseZIPHandler;
            this._parseConfigHandler["mff"] = this.paseMFFHandler;
            this.config = new Dictionary();
            this.prepareComplete = false;
        }

        private function collectConfig(_arg_1:String, _arg_2:ByteArray):void
        {
            var _local_5:XML;
            var _local_6:SceneConfigInfo;
            var _local_7:Vector.<SceneNpcInfo>;
            var _local_8:XMLList;
            var _local_9:XML;
            var _local_10:SceneNpcInfo;
            var _local_11:Vector.<InteractItemInfo>;
            var _local_12:XMLList;
            var _local_13:XML;
            var _local_14:InteractItemInfo;
            var _local_15:int;
            var _local_16:InteractItemStaticInfo;
            var _local_17:String;
            var _local_18:XML;
            var _local_19:TingeInfo;
            var _local_20:XML;
            var _local_21:AdjustColorInfo;
            var _local_22:Vector.<PropertyArg>;
            var _local_23:XMLList;
            var _local_24:XML;
            var _local_25:PropertyArg;
            var _local_26:XML;
            var _local_3:Array = _arg_1.split(".");
            _arg_1 = _local_3[0];
            var _local_4:String = _local_3[1];
            if (_local_4 == "xml"){
                _local_5 = new XML(_arg_2.readUTFBytes(_arg_2.bytesAvailable));
                switch (_arg_1){
                    case "scene":
                        _local_6 = new SceneConfigInfo();
                        _local_6.decode(_local_5);
                        this.config[_arg_1] = _local_6;
                        return;
                    case "npc":
                        _local_7 = new Vector.<SceneNpcInfo>();
                        _local_8 = _local_5.Npc;
                        for each (_local_9 in _local_8) {
                            _local_10 = new SceneNpcInfo();
                            _local_10.decode(_local_9);
                            _local_7.push(_local_10);
                        };
                        _local_7.fixed = true;
                        this.config[_arg_1] = _local_7;
                        return;
                    case "interact":
                        _local_11 = new Vector.<InteractItemInfo>();
                        _local_12 = _local_5.Item;
                        for each (_local_13 in _local_12) {
                            _local_14 = new InteractItemInfo();
                            _local_14.renderLevel = ((_local_13.hasOwnProperty("@renderLevel")) ? Number(_local_13.@renderLevel) : -1);
                            _local_14.id = int(_local_13.@id);
                            _local_15 = int(_local_13.@interactID);
                            _local_16 = AICore.data.getInteractItemStaticInfo(_local_15);
                            if (!_local_16){
                                _local_17 = (("ID 为 " + _local_15) + " 的交互物件不存在！");
                                error((("ID 为 " + _local_15) + " 的交互物件不存在！"));
                            };
                            _local_14.setStaticInfo(_local_16);
                            _local_14.groupID = _local_16.groupID;
                            _local_14.amityGroupID = _local_16.groupID;
                            _local_14.direction = Direction.RIGHT;
                            _local_14.location = MapPosition.DecodeXML(_local_13);
                            _local_14.dropPackageID = int(_local_13.@dropID);
                            if (_local_13.hasOwnProperty("@direction")){
                                _local_14.direction = int(_local_13.@direction);
                            };
                            if (_local_13.hasOwnProperty("Tinge")){
                                _local_18 = _local_13.Tinge[0];
                                _local_19 = new TingeInfo();
                                _local_19.decode(_local_18);
                                _local_14.tingeInfo = _local_19;
                            };
                            if (_local_13.hasOwnProperty("AdjustColor")){
                                _local_20 = _local_13.AdjustColor[0];
                                _local_21 = new AdjustColorInfo();
                                _local_21.decode(_local_20);
                                _local_14.adjustColorInfo = _local_21;
                            };
                            if (_local_13.hasOwnProperty("property")){
                                _local_22 = new Vector.<PropertyArg>();
                                _local_23 = _local_13.property;
                                for each (_local_24 in _local_23) {
                                    _local_25 = PropertyArg.newArg(_local_24.@type);
                                    _local_25.decode(_local_24);
                                    _local_22.push(_local_25);
                                };
                                _local_14.propertyArgList = _local_22;
                            };
                            if (_local_13.hasOwnProperty("ProcedureInfo")){
                                _local_26 = _local_13.ProcedureInfo[0];
                                _local_14.procedureInfo = new ProcedureInfo();
                                _local_14.procedureInfo.decode(_local_26);
                            };
                            _local_11.push(_local_14);
                        };
                        _local_11.fixed = true;
                        this.config[_arg_1] = _local_11;
                        return;
                    default:
                        this.config[_arg_1] = _local_5;
                };
            };
        }

        private function paseZIPHandler(_arg_1:ByteArray):void
        {
            var _local_4:FZipFile;
            var _local_6:ByteArray;
            var _local_2:FZip = new FZip();
            _local_2.loadBytes(_arg_1);
            var _local_3:uint = _local_2.getFileCount();
            var _local_5:int;
            while (_local_5 < _local_3) {
                _local_4 = _local_2.getFileAt(_local_5);
                _local_6 = _local_4.content;
                this.collectConfig(_local_4.filename, _local_6);
                _local_6.clear();
                _local_5++;
            };
        }

        private function paseMFFHandler(_arg_1:ByteArray):void
        {
            var _local_5:MFFFile;
            var _local_2:MFF = new MFF(false);
            _local_2.decode(_arg_1);
            var _local_3:Vector.<MFFFile> = _local_2.getMMFFiles();
            var _local_4:int;
            while (_local_4 < _local_3.length) {
                _local_5 = _local_3[_local_4];
                this.collectConfig(_local_5.mffName, _local_5.mffBytes);
                _local_4++;
            };
            _local_2.dispose();
        }

        private function onCfgFileLoad(_arg_1:TaskEvent):void
        {
            var _local_2:IFile;
            var _local_3:ByteArray;
            var _local_4:String;
            var _local_5:Function;
            var _local_6:SceneConfigInfo;
            var _local_7:ScenePrepareEvent;
            if (_arg_1.type == TaskEvent.COMPLETE){
                _local_2 = (this._cfgFileLoader.content as IFile);
                _local_3 = _local_2.bytes;
                _local_3.position = 0;
                _local_4 = XString.getURLExtension(Redirect.redirect(_local_2.url));
                _local_5 = this._parseConfigHandler[_local_4];
                (_local_5(_local_3));
                _local_6 = this.config["scene"];
                if (_local_6 != null){
                    this.loadSceneConfig(_local_6);
                };
            } else {
                _local_7 = new ScenePrepareEvent(ScenePrepareEvent.ERROR);
                _local_7.sceneID = this._sceneInfo.sceneID;
                _local_7.totalItem = this.totalItem;
                _local_7.loadedItem = this.loadedItem;
                this.dispatchEvent(_local_7);
            };
        }

        private function loadSceneConfig(_arg_1:SceneConfigInfo):void
        {
            var _local_3:SceneLayerInfo;
            var _local_4:Vector.<SceneItemInfo>;
            var _local_5:SceneItemInfo;
            var _local_6:String;
            var _local_7:FileLoader;
            this.totalItem = 0;
            this.loadedItem = 0;
            var _local_2:Vector.<SceneLayerInfo> = _arg_1.layerList;
            for each (_local_3 in _local_2) {
                _local_4 = _local_3.itemList;
                for each (_local_5 in _local_4) {
                    if (!_local_5.resPath) break;
                    _local_6 = (DEFINE.G_SCENE_RES_SRC + _local_5.resPath);
                    if (!this.lockFileList[_local_6]){
                        _local_7 = new FileLoader(_local_6);
                        _local_7.priority = Priority.PERIORITY_HIGH;
                        _local_7.content.addEventListener(TaskEvent.COMPLETE, this.onResourceLoaded);
                        _local_7.content.addEventListener(TaskEvent.PROGRESS, this.onResourceLoaded);
                        _local_7.content.addEventListener(TaskEvent.IO_ERROR, this.onResourceLoaded);
                        _local_7.content.addEventListener(TaskEvent.CHECK_ERROR, this.onResourceLoaded);
                        _local_7.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onResourceLoaded);
                        this.lockFileList[_local_6] = _local_7;
                        this.totalItem++;
                        _local_7.load();
                    };
                };
            };
            if (this.totalItem == this.loadedItem){
                this.sendLoaderOK();
            };
        }

        private function sendLoaderOK():void
        {
            var _local_1:ScenePrepareEvent;
            this.prepareComplete = true;
            _local_1 = new ScenePrepareEvent(ScenePrepareEvent.COMPLETE);
            _local_1.sceneID = -1;
            _local_1.totalItem = this.totalItem;
            _local_1.loadedItem = this.loadedItem;
            this.dispatchEvent(_local_1);
        }

        private function onResourceLoaded(_arg_1:TaskEvent):void
        {
            var _local_2:FileLoader;
            var _local_3:ScenePrepareEvent;
            if (_arg_1.type == TaskEvent.COMPLETE){
                _local_2 = this.lockFileList[_arg_1.key];
                if (((_local_2) && (_local_2.content.isLoaded()))){
                    this.loadedItem++;
                    _local_3 = new ScenePrepareEvent(ScenePrepareEvent.LOAD_PROESS);
                    _local_3.sceneID = this._sceneInfo.sceneID;
                    _local_3.totalItem = this.totalItem;
                    _local_3.loadedItem = this.loadedItem;
                    _local_3.bytesTotal = this._sceneBytes;
                    _local_3.key = String(_arg_1.key);
                    this.dispatchEvent(_local_3);
                    if (((!((this.totalItem == 0))) && ((this.totalItem == this.loadedItem)))){
                        this.sendLoaderOK();
                    };
                };
            } else {
                if (_arg_1.type == TaskEvent.PROGRESS){
                    this._sceneBytes = _arg_1.bytesTotal;
                } else {
                    _local_3 = new ScenePrepareEvent(ScenePrepareEvent.ERROR);
                    _local_3.sceneID = this._sceneInfo.sceneID;
                    _local_3.totalItem = this.totalItem;
                    _local_3.loadedItem = this.loadedItem;
                    this.dispatchEvent(_local_3);
                };
            };
        }

        public function get sceneInfo():SceneInfo
        {
            return (this._sceneInfo);
        }

        public function load():void
        {
            this._cfgFileLoader = new FileLoader(this._sceneInfo.sceneConfig);
            this._cfgFileLoader.priority = Priority.PERIORITY_HIGH;
            this._cfgFileLoader.content.addEventListener(TaskEvent.COMPLETE, this.onCfgFileLoad);
            this._cfgFileLoader.content.addEventListener(TaskEvent.IO_ERROR, this.onCfgFileLoad);
            this._cfgFileLoader.content.addEventListener(TaskEvent.CHECK_ERROR, this.onCfgFileLoad);
            this._cfgFileLoader.content.addEventListener(TaskEvent.SECURITY_ERROR, this.onCfgFileLoad);
            this._cfgFileLoader.load();
        }

        public function unload():void
        {
            var _local_1:FileLoader;
            if (this._cfgFileLoader){
                this._cfgFileLoader.content.removeEventListener(TaskEvent.COMPLETE, this.onCfgFileLoad);
                this._cfgFileLoader.content.removeEventListener(TaskEvent.IO_ERROR, this.onCfgFileLoad);
                this._cfgFileLoader.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onCfgFileLoad);
                this._cfgFileLoader.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onCfgFileLoad);
                this._cfgFileLoader.unload();
                this._cfgFileLoader = null;
            };
            if (this.lockFileList){
                for each (_local_1 in this.lockFileList) {
                    _local_1.content.removeEventListener(TaskEvent.COMPLETE, this.onResourceLoaded);
                    _local_1.content.removeEventListener(TaskEvent.PROGRESS, this.onResourceLoaded);
                    _local_1.content.removeEventListener(TaskEvent.IO_ERROR, this.onResourceLoaded);
                    _local_1.content.removeEventListener(TaskEvent.CHECK_ERROR, this.onResourceLoaded);
                    _local_1.content.removeEventListener(TaskEvent.SECURITY_ERROR, this.onResourceLoaded);
                    _local_1.unload();
                };
                this.lockFileList = null;
            };
            this._sceneInfo = null;
            this.config = null;
        }

        public function onLoadProgress(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
        }

        public /*  ©init. */ function _SafeStr_1145()
        {
        }


    }
}//package com.tencent.ai.core.scene

// _namespace_2 = "com.tencent.free.core.manager.content:IContent"
// _namespace_3 = "com.tencent.free.core.filesystem:IFile"


// _SafeStr_1145 = " ScenePrepare" (String#17306)


