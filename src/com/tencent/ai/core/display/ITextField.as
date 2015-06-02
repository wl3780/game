package com.tencent.ai.core.display
{
    import flash.text.TextFormat;

    public interface ITextField extends IDisplay 
    {

        function set embedFonts(enabled:Boolean):void;
        function get embedFonts():Boolean;
        function setTextFormat(format:TextFormat, _arg_2:int=-1, _arg_3:int=-1):void;
        function set autoSize(size:String):void;
        function get autoSize():String;
        function set selectable(value:Boolean):void;
        function get selectable():Boolean;
        function set textColor(color:uint):void;
        function get textColor():uint;
        function set text(_arg_1:String):void;
        function get text():String;
        function set htmlText(_arg_1:String):void;
        function get htmlText():String;
        function set defaultTextFormat(format:TextFormat):void;
        function get defaultTextFormat():TextFormat;
        function get textWidth():Number;
        function get textHeight():Number;

    }
}

