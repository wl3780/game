// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.IMonsterAssetManager

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.monster.res.MonsterAsset;

    public interface IMonsterAssetManager extends ISegmentAssetManager 
    {

        function getMonsterAssets(_arg_1:int):Array;
        function getMonsterAsset(_arg_1:MonsterStaticInfo, _arg_2:Object):MonsterAsset;
        function returnMonsterAsset(_arg_1:MonsterAsset, _arg_2:Object):void;

    }
}//package com.tencent.ai.core.monster

