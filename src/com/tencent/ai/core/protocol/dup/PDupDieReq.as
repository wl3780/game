// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupDieReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_934;

    public class PDupDieReq extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = 589891;
        public static const IN_CMD:int = 589892;

        public var playerIDReq:PlayerID;
        public var frameNo:int;
        public var playerID:PlayerID;
        public var iResult:int;

        public function PDupDieReq()
        {
            use_event_no = false;
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.iResult = _arg_1.readInt();
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            this.playerIDReq.write(_arg_1);
            _arg_1.writeUnsignedInt(this.frameNo);
        }

        public /*  ©init. */ function _SafeStr_934()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_934 = " PDupDieReq" (String#15593)


