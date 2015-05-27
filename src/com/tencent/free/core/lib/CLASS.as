package com.tencent.free.core.lib
{
    import com.tencent.free.core.swf.SwfFileLoader;
    
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;
    import flash.utils.getDefinitionByName;

    public class CLASS 
    {
        public static var DEFAULT_DECODE_FUNC:Function;
        public static var USE_IN_AIR:Boolean = false;

        private static var _CURRENT:CLASS;

        protected var m_domain:ApplicationDomain;
        protected var m_loaderContext:LoaderContext;
        protected var m_libLoaders:Vector.<SwfFileLoader>;
        protected var m_parent:CLASS;

        public function CLASS(_arg_1:CLASS)
        {
            this.initThis(_arg_1);
        }

        public static function get current():CLASS
        {
            if (_CURRENT == null) {
                _CURRENT = new CLASS(null);
            }
            return _CURRENT;
        }

        public static function newInstance(_arg_1:Class, _arg_2:Array=null):Object
        {
            var _local_3:Object;
            var _local_4:int = (((_arg_2 == null)) ? 0 : _arg_2.length);
            switch (_local_4){
                case 0:
                    _local_3 = new (_arg_1)();
                    break;
                case 1:
                    _local_3 = new (_arg_1)(_arg_2[0]);
                    break;
                case 2:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1]);
                    break;
                case 3:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2]);
                    break;
                case 4:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3]);
                    break;
                case 5:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3], _arg_2[4]);
                    break;
                case 6:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3], _arg_2[4], _arg_2[5]);
                    break;
                case 7:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3], _arg_2[4], _arg_2[5], _arg_2[6]);
                    break;
                case 8:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3], _arg_2[4], _arg_2[5], _arg_2[6], _arg_2[7]);
                    break;
                case 9:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3], _arg_2[4], _arg_2[5], _arg_2[6], _arg_2[7], _arg_2[8]);
                    break;
                case 10:
                    _local_3 = new (_arg_1)(_arg_2[0], _arg_2[1], _arg_2[2], _arg_2[3], _arg_2[4], _arg_2[5], _arg_2[6], _arg_2[7], _arg_2[8], _arg_2[9]);
                    break;
                default:
                    throw (new Error("[CLASS error]不支持参数超过10的类实例化!"));
            };
            return (_local_3);
        }


        protected function initThis(_arg_1:CLASS):void
        {
            if (_arg_1 == null){
                if (_CURRENT != null){
                    throw new Error("[CLASS error] CLASS必需有一个父级");
                };
                this.m_domain = ApplicationDomain.currentDomain;
            } else {
                this.m_domain = new ApplicationDomain(_arg_1.m_domain);
            };
            this.m_parent = _arg_1;
            this.m_libLoaders = new Vector.<SwfFileLoader>();
            this.m_loaderContext = new LoaderContext(false, this.m_domain);
            if (USE_IN_AIR){
                this.m_loaderContext["allowLoadBytesCodeExecution"] = true;
            };
        }

        public function getLoaderContext():LoaderContext
        {
            return (this.m_loaderContext);
        }

        public function getLibLoader(_arg_1:String):SwfFileLoader
        {
            var _local_4:SwfFileLoader;
            var _local_2:int = this.m_libLoaders.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.m_libLoaders[_local_3];
                if (_local_4.key == _arg_1){
                    return (_local_4);
                };
                _local_3++;
            };
            return (null);
        }

        public function getlibLoaders():Vector.<SwfFileLoader>
        {
            return (this.m_libLoaders);
        }

        public function forName(_arg_1:String):Class
        {
            if (this.m_domain == null){
                return ((getDefinitionByName(_arg_1) as Class));
            };
            return ((this.m_domain.getDefinition(_arg_1) as Class));
        }

        public function tryForName(name:String):Class
        {
            var cls:Class;
            cls = this.forName(name);
            if ((((cls == null)) && (!((this.m_parent == null))))){
                cls = this.m_parent.tryForName(name);
            };
            return (cls);

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        public function addLoader(_arg_1:String="", _arg_2:String="", _arg_3:String="", _arg_4:Function=null, _arg_5:Boolean=false):SwfFileLoader
        {
            var _local_6:SwfFileLoader = this.getLibLoader(_arg_1);
            if (_local_6 != null){
                return (_local_6);
            };
            if (_arg_1 == ""){
                _arg_1 = _arg_2;
            };
            _local_6 = new SwfFileLoader(_arg_1);
            _local_6.url = _arg_2;
            _local_6.hash = _arg_3;
            this.m_loaderContext = _local_6.setLoaderContext(this.m_loaderContext);
            this.m_domain = this.m_loaderContext.applicationDomain;
            _local_6.setDecodeFunc((((_arg_4 == null)) ? DEFAULT_DECODE_FUNC : _arg_4));
            this.m_libLoaders.push(_local_6);
            if (_arg_5){
                _local_6.load();
            };
            return (_local_6);
        }

        public function removeLoader(_arg_1:String):SwfFileLoader
        {
            var _local_2:SwfFileLoader;
            var _local_3:int = this.m_libLoaders.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2 = this.m_libLoaders[_local_4];
                if (_local_2.key == _arg_1){
                    this.m_libLoaders.splice(_local_4, 1);
                    _local_2.unload();
                    break;
                };
                _local_4++;
            };
            return (_local_2);
        }

        public function newInstance(_arg_1:String, _arg_2:Array=null):Object
        {
            var _local_3:Class = this.forName(_arg_1);
            return (CLASS.newInstance(_local_3, _arg_2));
        }

        public function tryNewInstance(_arg_1:String, _arg_2:Array=null):Object
        {
            var _local_3:Class = this.tryForName(_arg_1);
            if (_local_3 != null){
                return (CLASS.newInstance(_local_3, _arg_2));
            };
            return (null);
        }

        public function dispose():void
        {
            var _local_1:int = this.m_libLoaders.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                this.m_libLoaders[_local_2].unload();
                _local_2++;
            };
            this.m_libLoaders.length = 0;
            this.m_libLoaders = null;
            this.m_domain = null;
            this.m_loaderContext = null;
            this.m_parent = null;
        }


    }
}
