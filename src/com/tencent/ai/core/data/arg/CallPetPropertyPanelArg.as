// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallPetPropertyPanelArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.PetInfo;
    import  ©init._SafeStr_188;

    public class CallPetPropertyPanelArg 
    {

        public static const PET_PROPERTY:int = 1;
        public static const PACK:int = 2;
        public static const CLOSE_MAIN_PET_PROPERTY:int = 16;
        public static const SHOW_ITEM_SELECT_PANEL:int = 64;
        public static const SHOW_PET_EVOLE:int = 0x0100;
        public static const CLOSE_PACK:int = 0x0200;
        public static const GAIN_EXP:int = 0x0400;
        public static const PET_GUARD:int = 0x0800;

        public var type:int;
        public var playerID:PlayerID;
        public var petSID:int;
        public var petInfo:PetInfo;
        public var owerName:String;
        public var x:int;
        public var y:int;
        public var petItemType:String;
        public var handler:Function;
        public var propertyType:int = -1;
        public var skillType:int = -1;
        public var beBanished:Boolean = false;
        public var otherInfo:Object;


        public /*  ©init. */ function _SafeStr_188()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_188 = " CallPetPropertyPanelArg" (String#13847)


