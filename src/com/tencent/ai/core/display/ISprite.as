package com.tencent.ai.core.display
{
    public interface ISprite extends IDisplay 
    {

        function addDisplay(target:IDisplay):IDisplay;
        function removeDisplay(target:IDisplay):IDisplay;
        function containsDisplay(target:IDisplay):Boolean;
        function addDisplayAt(target:IDisplay, index:int):IDisplay;
        function removeDisplayAt(index:int):IDisplay;
        function setDisplayIndex(target:IDisplay, index:int):void;
        function getDisplayIndex(target:IDisplay):int;
        function getDisplayAt(index:int):IDisplay;
        function set mouseChildren(enabled:Boolean):void;
        function get mouseChildren():Boolean;
        function set mouseEnabled(enabled:Boolean):void;
        function get mouseEnabled():Boolean;

    }
}
