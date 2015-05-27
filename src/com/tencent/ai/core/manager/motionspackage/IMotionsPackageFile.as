// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.motionspackage.IMotionsPackageFile

package com.tencent.ai.core.manager.motionspackage
{
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.ai.core.asset.config.MotionsPackage;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.manager.framespackage.IFramesPackageFile;

    public interface IMotionsPackageFile extends IContent 
    {

        function get motionsPackage():MotionsPackage;
        function get motionAssets():Dictionary;
        function get framesPackageFile():IFramesPackageFile;
        function findFile(_arg_1:String, ... _args):Object;

    }
}//package com.tencent.ai.core.manager.motionspackage

