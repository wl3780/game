// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.extension.IControlBar

package com.tencent.ai.core.extension
{
    import flash.events.IEventDispatcher;

    public interface IControlBar extends IEventDispatcher 
    {

        function set enabled(_arg_1:Boolean):void;
        function get enabled():Boolean;
        function propsWithMask(_arg_1:Boolean):void;
        function showPowerLine(_arg_1:Boolean):void;
        function setEvalPanelType(_arg_1:uint):void;
        function autoDupRadis():void;
        function showPetFortressIcon(_arg_1:Boolean, _arg_2:Object=null):void;

    }
}//package com.tencent.ai.core.extension

