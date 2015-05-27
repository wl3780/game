// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.ADF

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.ByteArray;
    import com.tencent.free.utils.BytesUtil;
    import  ©init._SafeStr_804;

    public class ADF 
    {

        public var head:ADFHead;
        public var body:ISerialize;
        public var buf:ByteArray;

        public function ADF(_arg_1:ADFHead=null)
        {
            if (_arg_1 == null){
                this.head = new ADFHead();
            } else {
                this.head = _arg_1;
            };
        }

        public function write(_arg_1:ByteArray):void
        {
            var _local_2:int = _arg_1.position;
            this.head.write(_arg_1);
            var _local_3:int = _arg_1.position;
            if (this.buf != null){
                _arg_1.writeBytes(this.buf);
            } else {
                if (this.body != null){
                    this.body.write(_arg_1);
                };
            };
            var _local_4:int = (_arg_1.position - _local_3);
            BytesUtil.directWriteSmallint(_arg_1, (_local_2 + 2), _local_4);
        }

        public /*  ©init. */ function _SafeStr_804()
        {
        }


    }
}//package com.tencent.ai.core.net

// _SafeStr_804 = " ADF" (String#15752)


