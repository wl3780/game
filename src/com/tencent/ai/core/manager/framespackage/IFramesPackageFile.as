// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.framespackage.IFramesPackageFile

package com.tencent.ai.core.manager.framespackage
{
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.ai.core.asset.config.FramesPackage;
    import flash.utils.Dictionary;
    import flash.display.BitmapData;

    public interface IFramesPackageFile extends IContent 
    {

        function get framesPackage():FramesPackage;
        function get bdFiles():Dictionary;
        function get framesAssetFiles():Dictionary;
        function findBitmapData(_arg_1:String, ... _args):BitmapData;
        function findFramesAssetFile(_arg_1:int):FramesAssetFile;
        function findFrameFile(_arg_1:int, _arg_2:int):FrameFile;
        function findFile(_arg_1:String, ... _args):Object;

    }
}//package com.tencent.ai.core.manager.framespackage

