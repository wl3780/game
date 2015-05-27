// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.INpcAssetManager

package com.tencent.ai.core.npc
{
    import com.tencent.ai.core.npc.res.NpcAsset;

    public interface INpcAssetManager 
    {

        function getNpcAsset(_arg_1:int, _arg_2:String):NpcAsset;
        function disposeNpcAsset(_arg_1:NpcAsset):void;

    }
}//package com.tencent.ai.core.npc

