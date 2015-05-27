// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.ITriggerEvent

package com.tencent.ai.core.triggerEvent
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.TriggerEventInfo;

    public interface ITriggerEvent extends IEventDispatcher 
    {

        function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void;
        function finalize():void;
        function activate():void;
        function inactivate():void;
        function isActive():Boolean;

    }
}//package com.tencent.ai.core.triggerEvent

