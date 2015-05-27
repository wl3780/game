// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.ICondition

package com.tencent.ai.core.mission
{
    import com.tencent.ai.core.data.ConditionStaticInfo;

    public interface ICondition 
    {

        function get data():Object;
        function set data(_arg_1:Object):void;
        function get flag():Boolean;
        function set flag(_arg_1:Boolean):void;
        function get staticInfo():ConditionStaticInfo;
        function set staticInfo(_arg_1:ConditionStaticInfo):void;
        function check():void;

    }
}//package com.tencent.ai.core.mission

