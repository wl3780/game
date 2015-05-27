// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.DupScoreGrade

package com.tencent.ai.core.enum
{
    import  ©init._SafeStr_429;

    public class DupScoreGrade 
    {

        public static const SSS:uint = 6;
        public static const SS:uint = 5;
        public static const S:uint = 4;
        public static const A:uint = 3;
        public static const B:uint = 2;
        public static const C:uint = 1;
        public static const gradeStr:Array = ["", "C", "B", "A", "S", "SS", "SSS"];


        public static function getGradeStr(_arg_1:int):String
        {
            return (gradeStr[_arg_1]);
        }


        public /*  ©init. */ function _SafeStr_429()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_429 = " DupScoreGrade" (String#17444)


