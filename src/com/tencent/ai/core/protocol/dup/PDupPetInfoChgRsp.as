// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupPetInfoChgRsp

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.protocol.data.ReadIn;
    import com.tencent.ai.core.protocol.data.P_CombatPetInfo;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_941;

    public class PDupPetInfoChgRsp extends PBaseDupProtocol 
    {

        public static const IN_FOLLOW_CMD:int = 589972;
        public static const IN_UPDATE_CMD:int = 589976;

        public var playerid:PlayerID;
        public var take_effect_frame:uint;
        public var petInfo:PetInfo;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.playerid = new PlayerID();
            this.playerid.read(_arg_1);
            this.take_effect_frame = _arg_1.readUnsignedInt();
            this.petInfo = new PetInfo();
            ReadIn(_arg_1, this.petInfo, P_CombatPetInfo);
        }

        public /*  ©init. */ function _SafeStr_941()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_941 = " PDupPetInfoChgRsp" (String#14318)


