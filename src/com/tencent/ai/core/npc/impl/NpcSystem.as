// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.npc.impl.NpcSystem

package com.tencent.ai.core.npc.impl
{
    import com.tencent.ai.core.npc.INpcSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.npc.res.NpcAssetManager;
    import com.tencent.ai.core.npc.NpcModelManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.npc.INpcManager;
    import com.tencent.ai.core.npc.INpcAssetManager;
    import  ©init._SafeStr_811;

    public class NpcSystem implements INpcSystem 
    {

        protected var m_dataManager:IDataManager;
        protected var m_npcManager:NpcManager;
        protected var m_assetManager:NpcAssetManager;
        protected var m_npcModelManager:NpcModelManager;


        public function initialize():void
        {
            this.m_dataManager = AICore.data;
            this.m_assetManager = new NpcAssetManager();
            this.m_npcManager = new NpcManager(this, this.m_dataManager);
            this.m_npcManager.initialize();
            this.m_npcModelManager = new NpcModelManager();
        }

        public function getNpcManager():INpcManager
        {
            return (this.m_npcManager);
        }

        public function getNpcAssetManager():INpcAssetManager
        {
            return (this.m_assetManager);
        }

        public function getNpcModelManager():NpcModelManager
        {
            return (this.m_npcModelManager);
        }

        public /*  ©init. */ function _SafeStr_811()
        {
        }


    }
}//package com.tencent.ai.core.npc.impl

// _SafeStr_811 = " NpcSystem" (String#15542)


