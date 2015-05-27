// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationSpawn

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.data.MonsterPackInfo;
    import com.tencent.ai.core.protocol.PRequestSpawn;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.data.MapPosition;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.context.AIContext;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.free.logging.LoggingDefine;
    import com.tencent.free.logging.info;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.events.MonsterEvent;
    import  ©init._SafeStr_1311;

    public class OperationSpawn extends BaseOperation 
    {

        protected var m_currentScene:ICombatScene;
        protected var m_monsterPackInfo:MonsterPackInfo;
        protected var m_response:PRequestSpawn;
        protected var m_spawnInfo:SpawnInfo;

        public function OperationSpawn(_arg_1:int, _arg_2:MonsterPackInfo, _arg_3:SpawnInfo)
        {
            super(_arg_1, _arg_2.spawnFrame);
            this.m_monsterPackInfo = _arg_2;
            this.m_spawnInfo = _arg_3;
        }

        override public function execute():void
        {
            var _local_5:BaseElement;
            var _local_6:EffectInfo;
            var _local_12:MonsterInfo;
            var _local_13:MapPosition;
            var _local_14:int;
            var _local_15:int;
            var _local_16:int;
            var _local_17:Boolean;
            var _local_1:Vector.<MonsterInfo> = this.m_monsterPackInfo.monsterInfos;
            var _local_2:int = _local_1.length;
            var _local_3:MapPosition = this.m_spawnInfo.localMapPos;
            var _local_4:Boolean = (((_local_3.z == 0)) || ((_local_3.x == 0)));
            var _local_7:AIContext = AICore.Runtime.currentContext;
            var _local_8:IPlayerManager = _local_7.getPlayerManager();
            var _local_9:IMonsterManager = _local_7.getMonsterManager();
            if (this.m_currentScene == null){
                this.m_currentScene = (AICore.Runtime.currentScene as ICombatScene);
            };
            var _local_10:int;
            while (_local_10 < _local_2) {
                _local_12 = _local_1[_local_10];
                if (_local_3 != null){
                    if (_local_12.masterID.uin != 0){
                        _local_5 = _local_8.getPlayerByID(_local_12.masterID.uin);
                        _local_12.masterElement = _local_5;
                    } else {
                        if (_local_12.masterIndex != 0){
                            _local_5 = _local_9.getMonsterByID(_local_12.masterIndex);
                            _local_12.masterElement = _local_5;
                        };
                    };
                    if (((_local_4) && (!((_local_5 == null))))){
                        _local_3.x = _local_5.mapX;
                        _local_3.z = _local_5.mapZ;
                    };
                    _local_13 = _local_12.mapPosition;
                    _local_14 = (_local_13.x + _local_3.x);
                    _local_15 = (_local_13.z + _local_3.z);
                    _local_16 = _local_12.randomRaduis;
                    _local_17 = true;
                    if (_local_16 > 0){
                        _local_14 = (_local_14 + int((_local_16 * DEFINE.RANDOM_FLOAT())));
                        _local_15 = (_local_15 + int((_local_16 * DEFINE.RANDOM_FLOAT())));
                    };
                    if (this.m_currentScene.isWalkable(_local_14, _local_15)){
                        _local_13.x = _local_14;
                        _local_13.z = _local_15;
                    } else {
                        _local_13.x = _local_3.x;
                        _local_13.z = _local_3.z;
                        _local_17 = false;
                    };
                    if (LoggingDefine.value <= LoggingDefine.LEVEL_INFO){
                        info((((((((((((("[OperationSpawn] 刷怪参数{名称:" + _local_12.staticInfo.name) + ",找主人位置:") + _local_4) + ",下发位置：") + _local_12.mapPosition) + ",随机半径:") + _local_16) + ",可行：") + _local_17) + ",刷出位置：") + _local_13) + "}"));
                    };
                };
                this.m_currentScene.createElement(ElementType.ET_MONSTER, _local_12);
                _local_10++;
            };
            var _local_11:MonsterEvent = new MonsterEvent(MonsterEvent.ON_SPAWN_MONSTER_COMPLETE);
            _local_11.data = this.m_spawnInfo;
            AICore.monsterSystem.getSpawnManager().dispatchEvent(_local_11);
        }

        public /*  ©init. */ function _SafeStr_1311()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1311 = " OperationSpawn" (String#14579)


