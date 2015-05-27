// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupPetInfoCallBackRsp

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_940;

    public class PDupPetInfoCallBackRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589974;

        public var playerid:PlayerID;
        public var take_effect_frame:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.playerid = new PlayerID();
            this.playerid.read(_arg_1);
            this.take_effect_frame = _arg_1.readUnsignedInt();
        }

        public /*  ©init. */ function _SafeStr_940()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_940 = " PDupPetInfoCallBackRsp" (String#14552)


