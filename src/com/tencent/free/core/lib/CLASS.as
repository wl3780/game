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

        public function CLASS(pClass:CLASS)
        {
            this.initThis(pClass);
        }

        public static function get current():CLASS
        {
            if (_CURRENT == null) {
                _CURRENT = new CLASS(null);
            }
            return _CURRENT;
        }

        public static function newInstance(cls:Class, params:Array=null):Object
        {
            var content:Object;
            var count:int = params == null ? 0 : params.length;
            switch (count) {
                case 0:
                    content = new cls();
                    break;
                case 1:
                    content = new cls(params[0]);
                    break;
                case 2:
                    content = new cls(params[0], params[1]);
                    break;
                case 3:
                    content = new cls(params[0], params[1], params[2]);
                    break;
                case 4:
                    content = new cls(params[0], params[1], params[2], params[3]);
                    break;
                case 5:
                    content = new cls(params[0], params[1], params[2], params[3], params[4]);
                    break;
                case 6:
                    content = new cls(params[0], params[1], params[2], params[3], params[4], params[5]);
                    break;
                case 7:
                    content = new cls(params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
                    break;
                case 8:
                    content = new cls(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
                    break;
                case 9:
                    content = new cls(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
                    break;
                case 10:
                    content = new cls(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9]);
                    break;
                default:
                    throw new Error("[CLASS error]不支持参数超过10的类实例化!");
            }
            return content;
        }


        protected function initThis(pClass:CLASS):void
        {
            if (pClass == null) {
                if (_CURRENT != null) {
                    throw new Error("[CLASS error] CLASS必需有一个父级");
                }
                this.m_domain = ApplicationDomain.currentDomain;
            } else {
                this.m_domain = new ApplicationDomain(pClass.m_domain);
            }
            this.m_parent = pClass;
            this.m_libLoaders = new Vector.<SwfFileLoader>();
            this.m_loaderContext = new LoaderContext(false, this.m_domain);
            if (USE_IN_AIR) {
                this.m_loaderContext.allowLoadBytesCodeExecution = true;
            }
        }

        public function getLoaderContext():LoaderContext
        {
            return this.m_loaderContext;
        }

        public function getLibLoader(key:String):SwfFileLoader
        {
            var len:int = this.m_libLoaders.length;
            var idx:int;
            while (idx < len) {
	            var loader:SwfFileLoader = this.m_libLoaders[idx];
                if (loader.key == key) {
                    return loader;
                }
                idx++;
            }
            return null;
        }

        public function getlibLoaders():Vector.<SwfFileLoader>
        {
            return this.m_libLoaders;
        }

        public function forName(name:String):Class
        {
            if (this.m_domain == null) {
                return getDefinitionByName(name) as Class;
            }
            return this.m_domain.getDefinition(name) as Class;
        }

        public function tryForName(name:String):Class
        {
            var cls:Class = this.forName(name);
            if (cls == null && this.m_parent != null) {
                cls = this.m_parent.tryForName(name);
            }
            return cls;
        }

        public function addLoader(key:String, url:String="", hash:String="", func:Function=null, start:Boolean=false):SwfFileLoader
        {
            var loader:SwfFileLoader = this.getLibLoader(key);
            if (loader != null) {
                return loader;
            }
            if (key == "") {
                key = url;
            }
            loader = new SwfFileLoader(key);
            loader.url = url;
            loader.hash = hash;
            this.m_loaderContext = loader.setLoaderContext(this.m_loaderContext);
            this.m_domain = this.m_loaderContext.applicationDomain;
            loader.setDecodeFunc(func == null ? DEFAULT_DECODE_FUNC : func);
            this.m_libLoaders.push(loader);
            if (start) {
                loader.load();
            }
            return loader;
        }

        public function removeLoader(key:String):SwfFileLoader
        {
            var len:int = this.m_libLoaders.length;
            var idx:int;
            while (idx < len) {
	            var loader:SwfFileLoader = this.m_libLoaders[idx];
                if (loader.key == key) {
                    this.m_libLoaders.splice(idx, 1);
                    loader.unload();
                    break;
                }
                idx++;
            }
            return loader;
        }

        public function newInstance(name:String, params:Array=null):Object
        {
            var cls:Class = this.forName(name);
            return CLASS.newInstance(cls, params);
        }

        public function tryNewInstance(name:String, params:Array=null):Object
        {
            var cls:Class = this.tryForName(name);
            if (cls != null) {
                return CLASS.newInstance(cls, params);
            }
            return null;
        }

        public function dispose():void
        {
            var len:int = this.m_libLoaders.length;
            var idx:int;
            while (idx < len) {
                this.m_libLoaders[idx].unload();
                idx++;
            }
            this.m_libLoaders.length = 0;
            this.m_libLoaders = null;
            this.m_domain = null;
            this.m_loaderContext = null;
            this.m_parent = null;
        }


    }
}
