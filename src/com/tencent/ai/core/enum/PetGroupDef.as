// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.PetGroupDef

package com.tencent.ai.core.enum
{
    import flash.utils.Dictionary;
    import  ©init._SafeStr_472;

    public class PetGroupDef 
    {

        private static var hash:Dictionary;


        public static function getGroupNameBy(_arg_1:int):String
        {
            if (!hash){
                hash = new Dictionary();
                hash[0] = "无";
                hash[1] = "机械系";
                hash[2] = "动物系";
                hash[3] = "人物系";
                hash[4] = "建筑系";
            };
            return (String(hash[_arg_1]));
        }


        public /*  ©init. */ function _SafeStr_472()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_472 = " PetGroupDef" (String#15026)


