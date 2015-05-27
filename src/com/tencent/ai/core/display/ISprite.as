// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.display.ISprite

package com.tencent.ai.core.display
{
    public interface ISprite extends IDisplay 
    {

        function addDisplay(_arg_1:IDisplay):IDisplay;
        function removeDisplay(_arg_1:IDisplay):IDisplay;
        function containsDisplay(_arg_1:IDisplay):Boolean;
        function addDisplayAt(_arg_1:IDisplay, _arg_2:int):IDisplay;
        function removeDisplayAt(_arg_1:int):IDisplay;
        function setDisplayIndex(_arg_1:IDisplay, _arg_2:int):void;
        function getDisplayIndex(_arg_1:IDisplay):int;
        function getDisplayAt(_arg_1:int):IDisplay;
        function set mouseChildren(_arg_1:Boolean):void;
        function get mouseChildren():Boolean;
        function set mouseEnabled(_arg_1:Boolean):void;
        function get mouseEnabled():Boolean;

    }
}//package com.tencent.ai.core.display

