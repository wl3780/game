// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.MallConstants

package com.tencent.ai.core.enum
{
    import  ©init._SafeStr_455;

    public class MallConstants 
    {

        public static const Kind_HOT:int = 1;
        public static const Kind_AVATAR:int = 2;
        public static const Kind_ITEM:int = 3;
        public static const Kind_PET:int = 4;
        public static const Kind_GIFT:int = 5;
        public static const Kind_ACTIVITY:int = 6;
        private static var _kindNames:Object;
        public static const Type_HOT_0:int = 50;
        public static const Type_AVATAR_0:int = 10;
        public static const Type_AVATAR_1:int = 11;
        public static const Type_AVATAR_2:int = 12;
        public static const Type_ITEM_0:int = 20;
        public static const Type_ITEM_1:int = 21;
        public static const Type_ITEM_2:int = 22;
        public static const Type_ITEM_3:int = 23;
        public static const Type_ITEM_4:int = 24;
        public static const Type_ITEM_5:int = 25;
        public static const Type_PET_0:int = 30;
        public static const Type_PET_1:int = 31;
        public static const Type_GIFT_0:int = 40;
        public static const Type_GIFT_1:int = 41;
        public static const Type_ACTIVITY_0:int = 60;
        private static var _typeNames:Object;


        public static function getKindName(_arg_1:int):String
        {
            if (!_kindNames){
                _kindNames = new Object();
                _kindNames[Kind_HOT] = "热门";
                _kindNames[Kind_AVATAR] = "装扮";
                _kindNames[Kind_ITEM] = "道具";
                _kindNames[Kind_PET] = "宠物/坐骑";
                _kindNames[Kind_GIFT] = "礼包";
                _kindNames[Kind_ACTIVITY] = "活动";
            };
            return (_kindNames[_arg_1]);
        }

        public static function getTypeName(_arg_1:int):String
        {
            if (!_typeNames){
                _typeNames = new Object();
                _typeNames[Type_HOT_0] = "推荐";
                _typeNames[Type_AVATAR_0] = "时装";
                _typeNames[Type_AVATAR_1] = "推进器";
                _typeNames[Type_AVATAR_2] = "浮游炮";
                _typeNames[Type_ITEM_0] = "消耗";
                _typeNames[Type_ITEM_1] = "功能";
                _typeNames[Type_ITEM_2] = "恢复";
                _typeNames[Type_ITEM_3] = "强化";
                _typeNames[Type_ITEM_4] = "服务";
                _typeNames[Type_ITEM_5] = "宝石";
                _typeNames[Type_PET_0] = "宠物";
                _typeNames[Type_PET_1] = "坐骑";
                _typeNames[Type_GIFT_0] = "推荐";
                _typeNames[Type_GIFT_1] = "引导";
                _typeNames[Type_ACTIVITY_0] = "积分";
            };
            return (_typeNames[_arg_1]);
        }


        public /*  ©init. */ function _SafeStr_455()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_455 = " MallConstants" (String#15908)


