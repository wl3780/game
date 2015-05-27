// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.bubble.IBubbleManager

package com.tencent.ai.core.bubble
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.element.MovementElement;

    public interface IBubbleManager extends IEventDispatcher 
    {

        function initialize(_arg_1:Object=null):void;
        function bindScene(_arg_1:IScene):void;
        function getBindScene():IScene;
        function unbind():void;
        function popUp(_arg_1:MovementElement, _arg_2:int, _arg_3:Object, _arg_4:int=1000):IBubble;
        function removePopUp(_arg_1:IBubble):Boolean;
        function getPopupBubble(_arg_1:MovementElement):IBubble;

    }
}//package com.tencent.ai.core.bubble

