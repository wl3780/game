// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.IElementContainer

package com.tencent.ai.core.element
{
    public interface IElementContainer extends IEnvironment 
    {

        function createElement(_arg_1:String, _arg_2:Object, _arg_3:Boolean=true):BaseElement;
        function destoryElement(_arg_1:BaseElement, _arg_2:Boolean=true):void;
        function addElementAt(_arg_1:int, _arg_2:BaseElement):Boolean;
        function removeElementAt(_arg_1:int, _arg_2:BaseElement):void;

    }
}//package com.tencent.ai.core.element

