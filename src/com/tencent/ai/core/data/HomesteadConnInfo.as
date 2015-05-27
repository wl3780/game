// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.HomesteadConnInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_260;

    public class HomesteadConnInfo 
    {

        public static const HOME_CONN_FUNC_ADD_DISPLAY:uint = 1;
        public static const HOME_CONN_FUNC_FRESH_DATA:uint = 2;
        public static const HOME_CONN_FUNC_CALL_SETTING_BADGE:uint = 3;
        public static const HOME_CONN_FUNC_BADGE_SET:uint = 4;
        public static const HOME_CONN_FUNC_ENTER_OTHER_HOME:uint = 5;
        public static const HOME_CONN_FUNC_LEAVE_HOME:uint = 6;
        public static const HOME_CONN_FUNC_FRESH_FRIENDS_INFO:uint = 7;
        public static const HOME_CONN_FUNC_SET_A_BADGE_TO_WALL:uint = 8;
        public static const HOME_CONN_FUNC_CLEAR_ALL:uint = 9;
        public static const HOME_CONN_FUNC_FRESH_FRIENDS_INFO2:uint = 10;
        public static const HOME_CONN_FUNC_ADD_PET_TO_HOMESTEAD:uint = 11;
        public static const HOME_CONN_FUNC_REMOVE_PET_TO_HOMESTEAD:uint = 12;
        public static const HOME_CONN_FUNC_STRAIGHT_ENTER_BY_ID:uint = 13;
        public static const HOME_CONN_FUNC_REQ_DUP_INFO:uint = 14;
        public static const HOME_CONN_FUNC_REQ_GIFT_INFO:uint = 15;
        public static const HOME_CONN_FUNC_FIND_NAME:uint = 16;
        public static const HOME_CONN_FUNC_FRESH_TREASURE_TREE:uint = 17;
        public static const HOME_CONN_FUNC_FRESH_TREASURE_TREE_MENU:uint = 18;
        public static const HOME_CONN_FUNC_RANDOM_GO:uint = 19;
        public static const HOME_CONN_FUNC_TREE_PLAY_MOVIE:uint = 20;
        public static const HOME_CONN_FUNC_CURRENT_PLAYER_INFO:uint = 21;
        public static const HOME_CONN_FUNC_SET_SIGN:uint = 22;
        public static const HOME_CONN_FUNC_GET_ALL_FRIENDS:uint = 23;
        public static const HOME_CONN_FUNC_START_HANG:uint = 24;
        public static const HOME_CONN_FUNC_REQ_HANG:uint = 25;
        public static const HOME_CONN_FUNC_GAIN_HANG_EXP:uint = 26;
        public static const HOME_CONN_FUNC_GAIN_HANG_EXP2:uint = 27;
        public static const HOME_CONN_FUNC_CANCEL_HANG:uint = 28;
        public static const HOME_CONN_FUNC_LOGIN_GO_ON_HANG:uint = 29;
        public static const HOME_CONN_FUNC_CANCELED:uint = 30;

        public var type:uint;
        public var param:Object;

        public function HomesteadConnInfo(_arg_1:uint=0, _arg_2:Object=null)
        {
            this.type = _arg_1;
            this.param = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_260()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_260 = " HomesteadConnInfo" (String#15722)


