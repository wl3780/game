// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.movie.IMovieAssetManager

package com.tencent.ai.core.movie
{
    import com.tencent.ai.core.data.MovieStaticInfo;

    public interface IMovieAssetManager 
    {

        function getMovieAsset(_arg_1:MovieStaticInfo, _arg_2:Object):MovieAsset;
        function returnMovieAsset(_arg_1:MovieAsset, _arg_2:Object):void;

    }
}//package com.tencent.ai.core.movie

