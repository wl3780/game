package com.tencent.ai.core.element
{
    public interface IElementContainer extends IEnvironment 
    {

        function createElement(type:String, _arg_2:Object, add:Boolean=true):BaseElement;
        function destoryElement(element:BaseElement, remove:Boolean=true):void;
        function addElementAt(layerID:int, element:BaseElement):Boolean;
        function removeElementAt(layerID:int, element:BaseElement):void;

    }
}
