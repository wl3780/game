package 
{
    import com.adobe.crypto.MD5;
    import com.tencent.ai.setup.AILoaderGlobal;
    import com.tencent.free.core.filesystem.XMLLoader;
    import com.tencent.free.core.filesystem.impl.FileSystem;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.core.manager.task.Priority;
    import com.tencent.free.core.redirect.Redirect;
    import com.tencent.free.core.redirect.RedirectFile;
    import com.tencent.free.setup.GLOBAL_DEF;
    import com.tencent.free.setup.SetupApplication;
    import com.tencent.free.setup.data.SetupInfo;
    import com.tencent.free.setup.events.SetupEvent;
    import com.tencent.free.utils.XString;
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;

    public class Release_AIMain extends Sprite 
    {

        public var backgroudImg:Bitmap;
		
        private var _VERSION:String = "20131023";
        private var _redirectVersion:int = 0;
        private var _redirectLoader:XMLLoader;
        private var _globalLoader:XMLLoader;
        
		private var _setupApp:SetupApplication;
        private var _aiApp:Object;
        private var _startTime:int;
        private var _startBytes:int;
        private var _debug:Boolean = false;

        public function Release_AIMain()
        {
            if (stage) {
                this.onInit(null);
            } else {
                this.addEventListener(Event.ADDED_TO_STAGE, this.onInit);
            }
        }
		
        public static function DEFAULT_DECODE_FUNC(data:ByteArray, url:String):ByteArray
        {
            var ret:ByteArray;
            var index:int;
            var len:int;
            var type:String = XString.getURLExtension(Redirect.redirect(url));
            if (type == "asset") {
                ret = new ByteArray();
                len = data.length;
                index = 0;
                while (index < len) {
                    ret[index] = 0xFF - data[(len - 1) - index];
                    index++;
                }
                return ret;
            }
            if (type == "asset3"){
                ret = new ByteArray();
                index = 0;
                len = data.length / 1.5;
                while (index < len) {
                    ret[index] = 0xFF - data[index];
                    index++;
                }
                index = len;
                len = data.length;
                while (index < len) {
                    ret[index] = data[index];
                    index++;
                }
                return ret;
            }
            if (type == "swc") {
                return null;
            }
            return data;
        }

        private function onInit(e:Event):void
        {
            _startTime = getTimer();
            _startBytes = FileSystem.getInstance().totalBytes;
            CLASS.DEFAULT_DECODE_FUNC = Release_AIMain.DEFAULT_DECODE_FUNC;
            
            this.loadGlobal();
        }
		
        private function loadGlobal():void
        {
            Redirect.redirectMap = Redirect.redirectMap || new Dictionary();
            var url:String = "Global.xml";
            if (!_debug && Redirect.redirectMap[url] == null) {
	            var dir:RedirectFile = new RedirectFile();
                dir.url = url;
                dir.redirctPath = "" + "/Global.mff" + "?" + new Date().time.toString();
                Redirect.redirectMap[dir.url] = dir;
            }
            _globalLoader = new XMLLoader(Priority.PERIORITY_HIGH, false, 600000);
            _globalLoader.addEventListener(Event.COMPLETE, this.onGlobalComplete);
            _globalLoader.addEventListener(ErrorEvent.ERROR, this.onGlobalError);
            _globalLoader.load(url);
        }
		
        private function onGlobalComplete(evt:Event):void
        {
            _globalLoader.removeEventListener(Event.COMPLETE, this.onGlobalComplete);
            _globalLoader.removeEventListener(ErrorEvent.ERROR, this.onGlobalError);
            var xml:XML = new XML(_globalLoader.data);
            _redirectVersion = int(xml.@redirect);
            _VERSION = xml.@date + "[" + _redirectVersion + "]";
            
			this.loadRedirctMap();
        }
        private function onGlobalError(_arg_1:ErrorEvent):void
        {
            throw new Error("Global加载错误");
        }
		
        private function loadRedirctMap():void
        {
            if (Redirect.hasData()) {
                this.initialize();
            } else {
                Redirect.redirectMap = Redirect.redirectMap || new Dictionary();
	            var url:String = "RedirectMap.xml";
                if (!_debug && Redirect.redirectMap[url] == null) {
		            var dir:RedirectFile = new RedirectFile();
                    dir.url = url;
                    dir.redirctPath = "" + "/RedirectMap_v" + _redirectVersion + ".mff";
                    Redirect.redirectMap[dir.url] = dir;
                }
                _redirectLoader = new XMLLoader(Priority.PERIORITY_HIGH, true);
                _redirectLoader.addEventListener(Event.COMPLETE, this.onRedirectMapComplete);
                _redirectLoader.addEventListener(ErrorEvent.ERROR, this.onRedirectMapError);
                _redirectLoader.load(url);
            }
        }
		
        private function onRedirectMapComplete(evt:Event):void
        {
            _redirectLoader.removeEventListener(Event.COMPLETE, this.onRedirectMapComplete);
            _redirectLoader.removeEventListener(ErrorEvent.ERROR, this.onRedirectMapError);
            Redirect.MD5 = MD5.hashBytes(_redirectLoader.bytes);
            Redirect.setData(new XML(_redirectLoader.data));
            this.initialize();
        }
        private function onRedirectMapError(_arg_1:ErrorEvent):void
        {
            throw new Error("RedirectMap加载错误");
        }
		
        private function initialize(_arg_1:Boolean=false):void
        {
            var label:String = "MAIN_VER(release." + _VERSION + ")";
            var info:SetupInfo = new SetupInfo("Global.xml", this);
            info.configValueType = GLOBAL_DEF.VALUE_TYPE_FLASHVARS;
            info.stageWidth = 940;
            info.stageHeight = 560;
            info.classGlobalLoader = AILoaderGlobal;
            info.contextMenuItems = [{"label":label}];
            
			var var1:Object = {
                "key":"GAME_ROOT",
                "value":"",
                "valueType":GLOBAL_DEF.VALUE_TYPE_FLASHVARS
            }
            var var2:Object = {
                "key":"COMMLIBS_SRC",
                "value":"",
                "valueType":GLOBAL_DEF.VALUE_TYPE_FLASHVARS
            }
            var var3:Object = {
                "key":"AILIBS_SRC",
                "value":"",
                "valueType":GLOBAL_DEF.VALUE_TYPE_FLASHVARS
            }
            info.globalDefs = [var1, var2, var3];
            
			_setupApp = new SetupApplication(info);
            _setupApp.addEventListener(SetupEvent.SUCCESS, this.onSetupSuccess);
            Redirect.preUrl = GLOBAL_DEF.GET("GAME_ROOT");
            _setupApp.setupDefaultUI();
            _setupApp.run();
        }
		
        private function onSetupSuccess(evt:SetupEvent):void
        {
			var totalBytes:int = FileSystem.getInstance().totalBytes - _startBytes;
            var clz:String = _setupApp.getGlobalAppClass();
            if (clz == ""){
                clz = "com.tencent.ai.AIApplication";
            }
            _aiApp = CLASS.current.newInstance(clz);
            _aiApp.addEventListener(Event.INIT, this.onAppInit);
            _aiApp.initialize(this, evt.data);
        }
		
        private function onAppInit(evt:Event):void
        {
            _aiApp.removeEventListener(Event.INIT, this.onAppInit);
        }

    }
}
