// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.IInteractItemAssetManager

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.interact.res.InteractItemAsset;
    import com.tencent.ai.core.data.InteractItemStaticInfo;

    public interface IInteractItemAssetManager 
    {

        function getInteractItemAssetByID(_arg_1:int, _arg_2:Object=null):InteractItemAsset;
        function getInteractItemAsset(_arg_1:InteractItemStaticInfo, _arg_2:Object=null):InteractItemAsset;
        function returnInteractItemAsset(_arg_1:InteractItemAsset, _arg_2:Object=null):void;
        function getInteractItemAssets(_arg_1:int):Array;

    }
}//package com.tencent.ai.core.interact

