// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupProgressReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_944;

    public class PDupProgressReq extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = 589945;
        public static const IN_CMD:int = 589946;

        public var ratioReq:int;
        public var playerID:PlayerID;
        public var ratio:int;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.ratio = _arg_1.readUnsignedByte();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeByte(this.ratioReq);
        }

        public /*  ©init. */ function _SafeStr_944()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_944 = " PDupProgressReq" (String#15629)


