package com.tencent.ai.core.condition
{
    import com.tencent.ai.core.data.ConditionInfo;
    
    import flash.utils.Dictionary;

    public class ConditionBuilder 
    {
        static var CONDITION_TYPES:Dictionary;

        private static var _INSTANCE:ConditionBuilder;
        private static var _STATIC_CONDITIONS:Dictionary;

        public static function getInstance():ConditionBuilder
        {
            if (_INSTANCE == null){
                _STATIC_CONDITIONS = new Dictionary();
                _INSTANCE = new ConditionBuilder();
            }
            return _INSTANCE;
        }

        public static function BUILD(info:ConditionInfo, arg:Object=null):ICondition
        {
            return _INSTANCE.buildCondition(info, arg);
        }

        public static function STATIC_CHECK(info:ConditionInfo, arg:Object=null):Boolean
        {
            var condition:ICondition = _STATIC_CONDITIONS[info.type];
            if (condition == null) {
                condition = BUILD(info, arg);
                _STATIC_CONDITIONS[info.type] = condition;
            }
            return condition.check(info, arg);
        }


        public function buildCondition(info:ConditionInfo, arg:Object=null):ICondition
        {
            var condition:ICondition;
            var cls:Class = CONDITION_TYPES[info.type];
            if (cls) {
                condition = new cls();
                condition.initialize(info, arg);
            }
            return condition;
        }

        public function breakCondition(condition:ICondition):void
        {
            if (condition) {
                condition.finalize();
                condition = null;
            }
        }

    }
}
