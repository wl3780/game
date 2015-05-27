// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.AIFactory

package com.tencent.ai.core.monster
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.components.BaseAIComponent;
    import  ©init._SafeStr_786;

    public class AIFactory 
    {

        private static var _AI_CLS:Dictionary = new Dictionary();


        public static function registAICls(_arg_1:int, _arg_2:Class):void
        {
            _AI_CLS[_arg_1] = _arg_2;
        }

        public static function createInstance(_arg_1:int):BaseAIComponent
        {
            var _local_2:Class = _AI_CLS[_arg_1];
            return ((new (_local_2)() as BaseAIComponent));
        }


        public /*  ©init. */ function _SafeStr_786()
        {
        }


    }
}//package com.tencent.ai.core.monster

// _SafeStr_786 = " AIFactory" (String#14426)


