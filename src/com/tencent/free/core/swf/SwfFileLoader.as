package com.tencent.free.core.swf
{
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.core.manager.loader.BaseLoader;
    import com.tencent.free.core.swf.impl.SwfManager;
    
    import flash.system.LoaderContext;
    import flash.utils.ByteArray;

    public class SwfFileLoader extends BaseLoader 
    {

        public function SwfFileLoader(loadKey:String)
        {
            super(loadKey, SwfManager.getInstance());
            _loadInfo = {};
            this.setDecodeFunc(CLASS.DEFAULT_DECODE_FUNC);
        }

        public function setLoaderContext(value:LoaderContext):LoaderContext
        {
            var lc:LoaderContext = _content["getLoaderContext"]() as LoaderContext;
            if (lc == null) {
                lc = value;
            }
            _loadInfo.lc = lc;
            return lc;
        }
        public function getLoaderContext():LoaderContext
        {
            return _loadInfo.lc as LoaderContext;
        }

        public function setSwfBytes(value:ByteArray):void
        {
            _loadInfo.bytes = value;
        }
        public function getSwfBytes():ByteArray
        {
            return _loadInfo.bytes;
        }

        public function setDecodeFunc(func:Function):void
        {
            _loadInfo.decodeFunc = func;
        }
        public function getDecodeFunc():Function
        {
            return _loadInfo.decodeFunc;
        }

    }
}
