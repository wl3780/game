// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.IElementFactory

package com.tencent.ai.core.scene
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.element.BaseElement;

    public interface IElementFactory extends IEventDispatcher 
    {

        function initialize(_arg_1:Object=null):void;
        function getElementType():String;
        function createElement(_arg_1:Object=null):BaseElement;
        function destoryElement(_arg_1:BaseElement):void;
        function getDefaultLayerID():int;

    }
}//package com.tencent.ai.core.scene

