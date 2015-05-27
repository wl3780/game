// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.moviepackage.IMoviePackageFile

package com.tencent.ai.core.manager.moviepackage
{
    import com.tencent.free.core.manager.content.IContent;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.asset.config.MoviePackage;
    import com.tencent.ai.core.manager.framespackage.IFramesPackageFile;

    public interface IMoviePackageFile extends IContent 
    {

        function get motionAssets():Dictionary;
        function get moviePackage():MoviePackage;
        function get layerAssets():Dictionary;
        function get framesPackageFile():IFramesPackageFile;
        function findFile(_arg_1:String, ... _args):Object;

    }
}//package com.tencent.ai.core.manager.moviepackage

