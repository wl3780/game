// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.res.PetAssetManager

package com.tencent.ai.core.pet.res
{
    import com.tencent.ai.core.pet.IPetAssetManager;
    import com.tencent.ai.core.pet.IPetSystem;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.monster.IMonsterAssetManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.monster.res.MonsterAsset;
    import  ©init._SafeStr_825;

    public class PetAssetManager implements IPetAssetManager 
    {

        protected var m_petSys:IPetSystem;
        protected var m_effect:IEffectManager;
        protected var m_data:IDataManager;
        protected var m_monsterAM:IMonsterAssetManager;

        public function PetAssetManager(_arg_1:IPetSystem, _arg_2:IEffectManager, _arg_3:IDataManager)
        {
            this.m_petSys = _arg_1;
            this.m_effect = _arg_2;
            this.m_data = _arg_3;
        }

        public function initialize():void
        {
            this.m_monsterAM = AICore.monsterSystem.getResource();
        }

        public function getPetAsset(_arg_1:MonsterStaticInfo, _arg_2:Object):MonsterAsset
        {
            return (this.m_monsterAM.getMonsterAsset(_arg_1, _arg_2));
        }

        public function returnPetAsset(_arg_1:MonsterAsset, _arg_2:Object):void
        {
            this.m_monsterAM.returnMonsterAsset(_arg_1, _arg_2);
        }

        public /*  ©init. */ function _SafeStr_825()
        {
        }


    }
}//package com.tencent.ai.core.pet.res

// _SafeStr_825 = " PetAssetManager" (String#15860)


