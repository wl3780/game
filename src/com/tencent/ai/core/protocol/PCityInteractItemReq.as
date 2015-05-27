// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PCityInteractItemReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_982;

    public class PCityInteractItemReq implements ISerialize 
    {

        public static const REQ_CMD:int = 524429;
        public static const RSP_CMD:int = 524430;

        public var index:uint;
        public var ret:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readUnsignedInt();
            this.index = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.index);
        }

        public /*  ©init. */ function _SafeStr_982()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_982 = " PCityInteractItemReq" (String#15206)


