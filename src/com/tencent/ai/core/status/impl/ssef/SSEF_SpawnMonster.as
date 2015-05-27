// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_SpawnMonster

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.monster.IMonsterSystem;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.enum.SpawnType;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1269;

    public class SSEF_SpawnMonster extends SSEF_Base 
    {

        private static var _MONSTER_SYS:IMonsterSystem;


        override public function execute():void
        {
            var _local_3:String;
            var _local_1:SpawnInfo = new SpawnInfo();
            var _local_2:InteractElement = InteractElement(m_target);
            _local_1.local = (m_info.data_4 == 1);
            _local_1.packID = m_info.data_1;
            _local_1.spawnType = SpawnType.SPAWN_REASON_SKILL;
            if (m_info.data_2 == 1){
                _local_3 = _local_2.getType();
                if (_local_3 == ElementType.ET_PLAYER){
                    _local_1.spawnData2 = _local_2.id;
                } else {
                    _local_1.spawnData3 = _local_2.id;
                };
            };
            _local_1.localMapPos = _local_2.getMapPosition();
            if (_MONSTER_SYS == null){
                _MONSTER_SYS = AICore.monsterSystem;
            };
            _MONSTER_SYS.spawnMonsters(_local_1);
        }

        public /*  ©init. */ function _SafeStr_1269()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1269 = " SSEF_SpawnMonster" (String#16649)


