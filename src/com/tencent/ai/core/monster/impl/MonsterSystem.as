// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.impl.MonsterSystem

package com.tencent.ai.core.monster.impl
{
    import com.tencent.ai.core.monster.IMonsterSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.monster.res.MonsterAssetManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.monster.ISpawnManager;
    import com.tencent.ai.core.data.FactoryInfo;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.monster.AIFactory;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.monster.ai.SimpleMonsterAI;
    import com.tencent.ai.core.monster.ai.SimpleAPCAI;
    import com.tencent.ai.core.monster.ai.SimpleAidCityAI;
    import com.tencent.ai.core.monster.ai.SimpleAidDupAI;
    import com.tencent.ai.core.monster.ai.SimpleAidHomeAI;
    import com.tencent.ai.core.monster.ai.SimpleNPCAI;
    import com.tencent.ai.core.monster.ai.SimplePetMonsterAI;
    import com.tencent.ai.core.enum.ElementType;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.protocol.PDupCatchPet;
    import com.tencent.ai.core.data.AIInitClasses;
    import com.tencent.ai.core.monster.IMonsterAssetManager;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.monster.IMonsterFactory;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.func.ISpecialFuncManager;
    import com.tencent.ai.core.net.DupSend;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.monster.BaseMonster;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.net.ADF;
    import  ©init._SafeStr_780;

    public class MonsterSystem implements IMonsterSystem 
    {

        protected var m_data:IDataManager;
        protected var m_effect:IEffectManager;
        protected var m_resManager:MonsterAssetManager;
        protected var m_monsterFactorys:Dictionary;
        protected var m_spawnManager:ISpawnManager;

        public function MonsterSystem(_arg_1:IDataManager, _arg_2:IEffectManager)
        {
            this.m_data = _arg_1;
            this.m_effect = _arg_2;
        }

        public function initialize(_arg_1:AIInitClasses):void
        {
            var _local_6:FactoryInfo;
            var _local_7:int;
            var _local_2:CLASS = CLASS.current;
            this.m_monsterFactorys = new Dictionary();
            this.m_resManager = new MonsterAssetManager(this, this.m_effect, this.m_data);
            this.m_resManager.initialize();
            this.m_spawnManager = (_arg_1.create(_arg_1.CLASS_SpawnMonsterManager) as ISpawnManager);
            this.m_spawnManager.initialize();
            AIFactory.registAICls(MonsterEnum.AI_TYPE_SIMPLE, SimpleMonsterAI);
            AIFactory.registAICls(MonsterEnum.AI_TYPE_APC, SimpleAPCAI);
            AIFactory.registAICls(MonsterEnum.AI_CITY_PET, SimpleAidCityAI);
            AIFactory.registAICls(MonsterEnum.AI_DUP_PET, SimpleAidDupAI);
            AIFactory.registAICls(MonsterEnum.AI_HOME_PET, SimpleAidHomeAI);
            AIFactory.registAICls(MonsterEnum.AI_TYPE_NPC, SimpleNPCAI);
            AIFactory.registAICls(MonsterEnum.AI_MONSTER_PET, SimplePetMonsterAI);
            var _local_3:Vector.<FactoryInfo> = this.m_data.getFactoryInfos(ElementType.ET_MONSTER);
            var _local_4:int = _local_3.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = _local_6.itemType;
                this.m_monsterFactorys[_local_7] = _local_2.tryNewInstance(_local_6.className, [_local_7]);
                _local_5++;
            };
            AICore.net.registerProtocolClass(PDupCatchPet.IN_CMD, PDupCatchPet);
        }

        public function getResource():IMonsterAssetManager
        {
            return (this.m_resManager);
        }

        public function newManager(_arg_1:Class=null):IMonsterManager
        {
            if (_arg_1 == null){
                _arg_1 = MonsterManager;
            };
            return (new (_arg_1)(this));
        }

        public function newFactory(_arg_1:MonsterStaticInfo, _arg_2:CLASS):void
        {
            var _local_3:int = _arg_1.type;
            if (this.m_monsterFactorys[_local_3] != null){
                return;
            };
            if (_arg_2 == null){
                _arg_2 = CLASS.current;
            };
            this.m_monsterFactorys[_local_3] = _arg_2.newInstance(_arg_1.factory, [_local_3]);
        }

        public function getFactory(_arg_1:int):IMonsterFactory
        {
            return (this.m_monsterFactorys[_arg_1]);
        }

        public function disposeFactory(_arg_1:int):void
        {
        }

        public function getSpawnManager():ISpawnManager
        {
            return (this.m_spawnManager);
        }

        public function spawnMonsters(_arg_1:SpawnInfo):void
        {
            this.m_spawnManager.spawnMonsters(_arg_1);
        }

        public function catchMonster(_arg_1:BasePlayer, _arg_2:BaseMonster):void
        {
            var _local_3:ISpecialFuncManager = AICore.combatSystem.getSpecialFuncManager();
            _local_3.applyFunc(_arg_2, 15);
            var _local_4:PDupCatchPet = new PDupCatchPet();
            _local_4.player_id = _arg_1.getPlayerInfo().playerID;
            _local_4.index = _arg_2.getMonsterInfo().id;
            _local_4.monster_type = _arg_2.getMonsterInfo().monsterID;
            DupSend(PDupCatchPet.OUT_CMD, _local_4);
        }

        private function onCatchMonster(_arg_1:ADF, _arg_2:int):void
        {
            var _local_4:AIEvent;
            var _local_3:PDupCatchPet = (_arg_1.body as PDupCatchPet);
            if (_local_3.ret == 0){
                _local_4 = new AIEvent(AIEvent.ON_CATCH_PET);
                _local_4.data = _local_3;
                AICore.dispatchAIEvent(_local_4);
            };
        }

        public /*  ©init. */ function _SafeStr_780()
        {
        }


    }
}//package com.tencent.ai.core.monster.impl

// _SafeStr_780 = " MonsterSystem" (String#16163)


