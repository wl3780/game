package com.tencent.ai.core.manager.data
{
    import com.tencent.ai.core.data.AssetRefIDInfo;

    public interface IAssetRefTable 
    {

        function getMonsterAssetRefIDInfo(_arg_1:int):AssetRefIDInfo;
        function getEffectAssetRefIDInfo(_arg_1:int):AssetRefIDInfo;
        function getInteractAssetRefIDInfo(_arg_1:int):AssetRefIDInfo;
        function getSkillAssetRefIDInfo(_arg_1:int, _arg_2:int=0, _arg_3:int=0):AssetRefIDInfo;
        function getActivityMonsterRefIDInfo(_arg_1:int):AssetRefIDInfo;
        function getItemAssetRefIDInfo(_arg_1:int):AssetRefIDInfo;

    }
}
