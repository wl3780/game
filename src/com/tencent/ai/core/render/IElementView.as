// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.IElementView

package com.tencent.ai.core.render
{
    import com.tencent.ai.core.utils.RectArea;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.element.IElementContainer;

    public interface IElementView extends IMotionView 
    {

        function getHurtRects():Array;
        function getAttackRect():RectArea;
        function getBodyDisplay():IDisplay;
        function setBodyBorderStyle(_arg_1:BorderStyle, _arg_2:Boolean=true):void;
        function setBodyBlurStyle(_arg_1:BlurStyle, _arg_2:Boolean=true):void;
        function setBodyAdjustColorStyle(_arg_1:AdjustColorStyle, _arg_2:Boolean=true):void;
        function setBodyColorStyle(_arg_1:ColorStyle, _arg_2:Boolean=true):void;
        function setParentContainer(_arg_1:IElementContainer):void;
        function getParentContainer():IElementContainer;
        function renderChildren(_arg_1:int):void;

    }
}//package com.tencent.ai.core.render

