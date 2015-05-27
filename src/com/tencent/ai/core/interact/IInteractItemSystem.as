// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.IInteractItemSystem

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.free.core.lib.CLASS;

    public interface IInteractItemSystem 
    {

        function newFactory(_arg_1:InteractItemStaticInfo, _arg_2:CLASS):void;
        function getFactory(_arg_1:int):IInteractItemFactory;
        function disposeFactory(_arg_1:int):void;
        function getResource():IInteractItemAssetManager;
        function newManager(_arg_1:Class=null):IInteractItemManager;

    }
}//package com.tencent.ai.core.interact

