// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.movie.IMoviePlayer

package com.tencent.ai.core.movie
{
    import flash.events.IEventDispatcher;
    import flash.display.Sprite;

    public interface IMoviePlayer extends IEventDispatcher 
    {

        function setMovieAsset(_arg_1:MovieAsset):void;
        function show():void;
        function hide():void;
        function play():void;
        function pause():void;
        function skip():void;
        function isPlaying():Boolean;
        function getMCContainer():Sprite;

    }
}//package com.tencent.ai.core.movie

