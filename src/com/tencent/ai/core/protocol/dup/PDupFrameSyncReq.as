// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupFrameSyncReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_937;

    public class PDupFrameSyncReq extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = 589857;
        public static const IN_CMD:int = 589858;

        public var oFrame_no:int;
        public var oDup_key:uint;
        public var oDelayTime:uint;
        public var iResult:int;
        public var iFrame_no:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.iResult = _arg_1.readInt();
            this.iFrame_no = _arg_1.readUnsignedInt();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeInt(this.oDup_key);
            _arg_1.writeInt(this.oFrame_no);
            _arg_1.writeUnsignedInt(this.oDelayTime);
        }

        public /*  ©init. */ function _SafeStr_937()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_937 = " PDupFrameSyncReq" (String#13754)


