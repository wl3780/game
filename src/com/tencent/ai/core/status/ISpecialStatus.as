// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.ISpecialStatus

package com.tencent.ai.core.status
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.SSTypeInfo;

    public interface ISpecialStatus extends IEventDispatcher 
    {

        function setRTParams(_arg_1:Object):void;
        function getRTParams():Object;
        function setTarget(_arg_1:Object):void;
        function getTarget():Object;
        function setModel(_arg_1:SSModel):void;
        function getModel():SSModel;
        function execute():void;
        function compare(_arg_1:ISpecialStatus):int;
        function getTypeInfo():SSTypeInfo;
        function isBorn():Boolean;
        function dispose():void;

    }
}//package com.tencent.ai.core.status

