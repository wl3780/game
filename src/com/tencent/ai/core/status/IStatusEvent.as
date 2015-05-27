// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.IStatusEvent

package com.tencent.ai.core.status
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.StatusEventInfo;

    public interface IStatusEvent extends IEventDispatcher 
    {

        function setStatus(_arg_1:ISpecialStatus):void;
        function getStatus():ISpecialStatus;
        function initialize(_arg_1:StatusEventInfo):void;
        function finalize():void;
        function getType():int;

    }
}//package com.tencent.ai.core.status

