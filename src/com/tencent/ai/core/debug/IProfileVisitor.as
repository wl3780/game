// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.IProfileVisitor

package com.tencent.ai.core.debug
{
    import com.tencent.ai.core.debug.data.DupResProfileInfo;

    public interface IProfileVisitor 
    {

        function memorySceneAssets(_arg_1:Object):void;
        function memoryEffectAssets(_arg_1:Object):void;
        function memoryInteractAssets(_arg_1:Object):void;
        function memoryMonsterAssets(_arg_1:Object):void;
        function memoryPlayerAssets(_arg_1:Object):void;
        function memorySoundAssets(_arg_1:Object):void;
        function memoryNpcAssets(_arg_1:Object):void;
        function memoryFramesPackage(_arg_1:Object):void;
        function memoryFiles(_arg_1:Object):void;
        function sceneINAssets(_arg_1:Object):void;
        function sceneOUTAssets(_arg_1:Object):void;
        function sceneElements(_arg_1:Object):void;
        function profileSceneInfo(_arg_1:SceneProfileInfo):void;
        function profileDupResInfo(_arg_1:DupResProfileInfo):void;

    }
}//package com.tencent.ai.core.debug

