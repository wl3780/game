package com.tencent.ai.core.condition
{
    import com.tencent.ai.core.data.ConditionInfo;

    public interface ICondition 
    {

        function initialize(info:ConditionInfo, arg:Object=null):Boolean;
        function check(info:ConditionInfo=null, arg:Object=null):Boolean;
        function finalize():void;

    }
}
