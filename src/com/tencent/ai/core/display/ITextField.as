// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.display.ITextField

package com.tencent.ai.core.display
{
    import flash.text.TextFormat;

    public interface ITextField extends IDisplay 
    {

        function set embedFonts(_arg_1:Boolean):void;
        function get embedFonts():Boolean;
        function setTextFormat(_arg_1:TextFormat, _arg_2:int=-1, _arg_3:int=-1):void;
        function set autoSize(_arg_1:String):void;
        function get autoSize():String;
        function set selectable(_arg_1:Boolean):void;
        function get selectable():Boolean;
        function set textColor(_arg_1:uint):void;
        function get textColor():uint;
        function set text(_arg_1:String):void;
        function get text():String;
        function set htmlText(_arg_1:String):void;
        function get htmlText():String;
        function set defaultTextFormat(_arg_1:TextFormat):void;
        function get defaultTextFormat():TextFormat;
        function get textWidth():Number;
        function get textHeight():Number;

    }
}//package com.tencent.ai.core.display

