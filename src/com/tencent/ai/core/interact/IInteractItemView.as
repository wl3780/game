// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.IInteractItemView

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.data.InteractItemStaticInfo;

    public interface IInteractItemView extends IElementContainer 
    {

        function setResManager(_arg_1:IInteractItemAssetManager):void;
        function loadAsset(_arg_1:InteractItemStaticInfo):void;

    }
}//package com.tencent.ai.core.interact

