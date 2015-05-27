// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.movie.IMovieManager

package com.tencent.ai.core.movie
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.MovieStaticInfo;

    public interface IMovieManager extends IEventDispatcher 
    {

        function initialize():void;
        function get assetManager():IMovieAssetManager;
        function playMovieByInfo(_arg_1:MovieStaticInfo):void;
        function playMovieByID(_arg_1:int):void;
        function getCurrentMoviePlayer():IMoviePlayer;
        function setMoviePlayerByID(_arg_1:int):IMoviePlayer;
        function playUIMovieByID(_arg_1:int):void;
        function getCurrentAsset():MovieAsset;

    }
}//package com.tencent.ai.core.movie

