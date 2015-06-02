package com.tencent.ai.core.scene
{
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.element.BaseElement;
    
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public interface ICamera 
    {

        function attachScene(scene:IScene):void;
        function shake(_arg_1:int, _arg_2:int=25, _arg_3:int=10):void;
        function setFocus(element:BaseElement):void;
        function getFocus():BaseElement;
        function update():void;
        function getOffset():Point;
        function get offsetX():Number;
        function get offsetY():Number;
        function get isFollowFocus():Boolean;
        function set isFollowFocus(_arg_1:Boolean):void;
        function locateAt(_arg_1:Number, _arg_2:Number):void;
        function locateTo(_arg_1:Number, _arg_2:Number):void;
        function get location():Point;
        function get locationX():Number;
        function get locationY():Number;
        function get viewWidth():int;
        function set viewWidth(_arg_1:int):void;
        function get viewHeight():int;
        function set viewHeight(_arg_1:int):void;
        function offsetLocationY(_arg_1:int):void;
        function catchFocus():void;
        function releaseFocus():void;
        function set zoom(_arg_1:Number):void;
        function get zoom():Number;
        function inCamera(_arg_1:Rectangle):Boolean;
        function localToGlobal(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Point=null):Point;
        function globalToLocal(_arg_1:int, _arg_2:int, _arg_3:MapPosition=null):MapPosition;

    }
}
