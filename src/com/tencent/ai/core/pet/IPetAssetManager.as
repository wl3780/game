// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.IPetAssetManager

package com.tencent.ai.core.pet
{
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.monster.res.MonsterAsset;

    public interface IPetAssetManager 
    {

        function getPetAsset(_arg_1:MonsterStaticInfo, _arg_2:Object):MonsterAsset;
        function returnPetAsset(_arg_1:MonsterAsset, _arg_2:Object):void;

    }
}//package com.tencent.ai.core.pet

