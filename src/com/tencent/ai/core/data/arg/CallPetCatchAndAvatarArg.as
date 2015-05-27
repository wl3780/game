// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallPetCatchAndAvatarArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.data.PetInfo;
    import  ©init._SafeStr_187;

    public class CallPetCatchAndAvatarArg 
    {

        public static const SHOW_AVATAR:int = 1;
        public static const SHOW_CATCH_PANEL:int = 2;
        public static const CLOSE_AVATAR:int = 4;
        public static const CLOSE_CATCH_PANEL:int = 8;
        public static const VISIBLE_AVATAR:int = 16;

        public var visible:Boolean;
        public var type:int;
        public var petInfo:PetInfo;


        public /*  ©init. */ function _SafeStr_187()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_187 = " CallPetCatchAndAvatarArg" (String#14453)


