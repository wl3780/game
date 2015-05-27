// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetFortressConnInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_295;

    public class PetFortressConnInfo 
    {

        public static const ENTER_PETFORTRESS:uint = 1;
        public static const LEAVE_PETFORTRESS:uint = 2;
        public static const FRESH_FRIENDS:uint = 3;
        public static const START_BUILD:uint = 4;
        public static const START_UPGRADE:uint = 5;
        public static const SET_DEFEND_PETS:uint = 6;
        public static const CHECK_ATTACK_RECORD:uint = 7;
        public static const AFTER_GAIN_EXP_BUILD_END:uint = 8;
        public static const END_BUILD:uint = 32;
        public static const CHECK_DRAG_DROP:uint = 33;
        public static const ADD_DEFEND_PET:uint = 9;
        public static const DEL_DEFEND_PET:uint = 10;
        public static const WANNA_DATA:uint = 11;
        public static const SPEED_BUILD:uint = 12;
        public static const SPEED_UPGRADE:uint = 13;
        public static const FIGHT____:uint = 14;
        public static const SHOW_BRICK_BOY:uint = 15;
        public static const AS_CLICKED_BUTTON:uint = 16;
        public static const OPEN_LIB_DIRECT:uint = 17;
        public static const RANDOM_GO:uint = 18;

        public var type:uint;
        public var param:Object;

        public function PetFortressConnInfo(_arg_1:uint=0, _arg_2:Object=null)
        {
            this.type = _arg_1;
            this.param = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_295()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_295 = " PetFortressConnInfo" (String#15800)


