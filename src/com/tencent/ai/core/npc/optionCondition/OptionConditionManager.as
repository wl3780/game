// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.optionCondition.OptionConditionManager

package com.tencent.ai.core.npc.optionCondition
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.NPCOptionConditionType;
    import  ©init._SafeStr_813;

    public class OptionConditionManager 
    {

        private static var classHash:Dictionary;
        private static var instanceHash:Dictionary;


        public static function check(_arg_1:String, _arg_2:String):Boolean
        {
            var _local_4:Class;
            if (!instanceHash){
                instanceHash = new Dictionary();
                classHash = new Dictionary();
                classHash[NPCOptionConditionType.CHECK_CAREER] = CheckCareer;
            };
            var _local_3:IOptionCondition = instanceHash[_arg_1];
            if (!_local_3){
                _local_4 = classHash[_arg_1];
                if (_local_4){
                    _local_3 = new (_local_4)();
                    instanceHash[_arg_1] = _local_3;
                } else {
                    return (true);
                };
            };
            return (_local_3.check(_arg_2));
        }


        public /*  ©init. */ function _SafeStr_813()
        {
        }


    }
}//package com.tencent.ai.core.npc.optionCondition

// _SafeStr_813 = " OptionConditionManager" (String#14102)


