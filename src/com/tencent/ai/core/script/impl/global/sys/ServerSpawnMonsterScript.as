// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.ServerSpawnMonsterScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ServerSpawnArg;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1179;

    public class ServerSpawnMonsterScript extends GlobalScript 
    {

        public function ServerSpawnMonsterScript()
        {
            m_cmds = ScriptCmdDef.SC_SERVER_SPAWN_MONSTER;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ServerSpawnArg = (_arg_2 as ServerSpawnArg);
            var _local_4:SpawnInfo = new SpawnInfo(_local_3.spawnType, _local_3.packID, _local_3.data1);
            _local_4.pkID = _local_3.pkID;
            _local_4.spawnData2 = _local_3.data2;
            _local_4.spawnData3 = _local_3.data3;
            _local_4.localMapPos = _local_3.localMapPos;
            AICore.monsterSystem.getSpawnManager().spawnMonsters(_local_4);
        }

        public /*  ©init. */ function _SafeStr_1179()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1179 = " ServerSpawnMonsterScript" (String#16103)


