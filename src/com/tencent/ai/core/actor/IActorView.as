// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.IActorView

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.render.BodyViewMultiLayer;

    public interface IActorView extends IElementView, IElementContainer 
    {

        function set height(_arg_1:int):void;
        function get height():int;
        function setHeadText(_arg_1:String, _arg_2:Boolean=true):void;
        function setHeadVisible(_arg_1:Boolean):void;
        function getHeadVisible():Boolean;
        function setHeadBarVisible(_arg_1:Boolean):void;
        function getHeadBarVisible():Boolean;
        function setHeadBarHp(_arg_1:Number):void;
        function setHeadBarMp(_arg_1:Number):void;
        function getBody():BodyViewMultiLayer;
        function getStiffViewType():int;

    }
}//package com.tencent.ai.core.actor

