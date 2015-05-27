// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.display.IDisplay

package com.tencent.ai.core.display
{
    import flash.display.IBitmapDrawable;
    import flash.events.IEventDispatcher;
    import flash.geom.Transform;
    import flash.geom.Rectangle;

    public interface IDisplay extends IBitmapDrawable, IEventDispatcher 
    {

        function set visible(_arg_1:Boolean):void;
        function get visible():Boolean;
        function set blendMode(_arg_1:String):void;
        function get blendMode():String;
        function set scaleX(_arg_1:Number):void;
        function get scaleX():Number;
        function set scaleY(_arg_1:Number):void;
        function get scaleY():Number;
        function set x(_arg_1:Number):void;
        function get x():Number;
        function set y(_arg_1:Number):void;
        function get y():Number;
        function set width(_arg_1:Number):void;
        function get width():Number;
        function set height(_arg_1:Number):void;
        function get height():Number;
        function set filters(_arg_1:Array):void;
        function get filters():Array;
        function set rotation(_arg_1:Number):void;
        function get rotation():Number;
        function set alpha(_arg_1:Number):void;
        function get alpha():Number;
        function get transform():Transform;
        function set transform(_arg_1:Transform):void;
        function getDisplayBounds(_arg_1:IDisplay):Rectangle;
        function set scrollRect(_arg_1:Rectangle):void;
        function get scrollRect():Rectangle;
        function set depth(_arg_1:int):void;
        function get depth():int;

    }
}//package com.tencent.ai.core.display

