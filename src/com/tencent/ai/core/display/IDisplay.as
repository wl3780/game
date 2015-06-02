package com.tencent.ai.core.display
{
    import flash.display.IBitmapDrawable;
    import flash.events.IEventDispatcher;
    import flash.geom.Rectangle;
    import flash.geom.Transform;

    public interface IDisplay extends IBitmapDrawable, IEventDispatcher 
    {

        function set visible(value:Boolean):void;
        function get visible():Boolean;
        function set blendMode(value:String):void;
        function get blendMode():String;
        function set scaleX(value:Number):void;
        function get scaleX():Number;
        function set scaleY(value:Number):void;
        function get scaleY():Number;
        function set x(value:Number):void;
        function get x():Number;
        function set y(value:Number):void;
        function get y():Number;
        function set width(value:Number):void;
        function get width():Number;
        function set height(value:Number):void;
        function get height():Number;
        function set filters(value:Array):void;
        function get filters():Array;
        function set rotation(value:Number):void;
        function get rotation():Number;
        function set alpha(value:Number):void;
        function get alpha():Number;
        function get transform():Transform;
        function set transform(value:Transform):void;
        function getDisplayBounds(target:IDisplay):Rectangle;
        function set scrollRect(value:Rectangle):void;
        function get scrollRect():Rectangle;
        function set depth(value:int):void;
        function get depth():int;

    }
}
