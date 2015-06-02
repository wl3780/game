package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.element.BaseElement;
    
    import flash.events.IEventDispatcher;

    public interface IElementFactory extends IEventDispatcher 
    {

        function initialize(_arg_1:Object=null):void;
        function getElementType():String;
        function createElement(_arg_1:Object=null):BaseElement;
        function destoryElement(element:BaseElement):void;
        function getDefaultLayerID():int;

    }
}
