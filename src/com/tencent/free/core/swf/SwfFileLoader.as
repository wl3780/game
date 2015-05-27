// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.swf.SwfFileLoader

package com.tencent.free.core.swf
{
    import com.tencent.free.core.manager.loader.BaseLoader;
    import com.tencent.free.core.swf.impl.SwfManager;
    import com.tencent.free.core.lib.CLASS;
    import flash.system.LoaderContext;
    import flash.utils.ByteArray;
    import  ©init._SafeStr_44;

    public class SwfFileLoader extends BaseLoader 
    {

        public function SwfFileLoader(_arg_1:String)
        {
            super(_arg_1, SwfManager.getInstance());
            _loadInfo = {};
            this.setDecodeFunc(CLASS.DEFAULT_DECODE_FUNC);
        }

        public function setLoaderContext(_arg_1:LoaderContext):LoaderContext
        {
            var _local_2:LoaderContext = (_content["getLoaderContext"]() as LoaderContext);
            if (_local_2 == null){
                _local_2 = _arg_1;
            };
            _loadInfo.lc = _local_2;
            return (_local_2);
        }

        public function getLoaderContext():LoaderContext
        {
            return ((_loadInfo.lc as LoaderContext));
        }

        public function setSwfBytes(_arg_1:ByteArray):void
        {
            _loadInfo.bytes = _arg_1;
        }

        public function getSwfBytes():ByteArray
        {
            return (_loadInfo.bytes);
        }

        public function setDecodeFunc(_arg_1:Function):void
        {
            _loadInfo.decodeFunc = _arg_1;
        }

        public function getDecodeFunc():Function
        {
            return (_loadInfo.decodeFunc);
        }

        public /*  ©init. */ function _SafeStr_44()
        {
        }


    }
}//package com.tencent.free.core.swf

// _SafeStr_44 = " SwfFileLoader" (String#1352)


