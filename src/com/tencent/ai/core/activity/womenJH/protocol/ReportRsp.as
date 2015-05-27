// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.protocol.ReportRsp

package com.tencent.ai.core.activity.womenJH.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_33;

    public class ReportRsp implements ISerialize 
    {

        public static const IN_CMD:int = 1511208;

        public var ret:int;
        public var type:uint;
        public var id:uint;
        public var succ:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.type = _arg_1.readUnsignedByte();
            this.id = _arg_1.readUnsignedInt();
            this.succ = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_33()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.protocol

// _SafeStr_33 = " ReportRsp" (String#14915)


