// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.PetAttackType

package com.tencent.ai.core.enum
{
    import  ©init._SafeStr_470;

    public class PetAttackType 
    {

        public static const P_ATTACK:int = 0;
        public static const M_ATTACK:int = 1;


        public static function toType(_arg_1:int):String
        {
            switch (_arg_1){
                default:
                    return ("物理型");
                case M_ATTACK:
                    return ("能量型");
            };
            return ("");
        }


        public /*  ©init. */ function _SafeStr_470()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_470 = " PetAttackType" (String#16073)


