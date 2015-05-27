// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.ServerSpawnMonsterScript2

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.timeline.LFParam;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.LogicFrameType;
    import com.tencent.ai.core.enum.SpawnType;
    import com.tencent.ai.core.data.MapPosition;
    import  ©init._SafeStr_1180;

    public class ServerSpawnMonsterScript2 extends GlobalScript 
    {

        public function ServerSpawnMonsterScript2()
        {
            m_cmds = ScriptCmdDef.SC_SERVER_SPAWN_MONSTER;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_7:LFParam;
            var _local_8:SpawnInfo;
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:int = int(_local_3.argStr);
            var _local_5:Array = LFParam.DECODE_LFPS(AICore.Runtime.currentScene.getConfig()["timeline"]);
            var _local_6:int;
            while (_local_6 < _local_5.length) {
                _local_7 = _local_5[_local_6];
                if (_local_7.type == LogicFrameType.LFT_DUP_SPAWN){
                    if (--_local_4 <= 0){
                        _local_8 = new SpawnInfo(SpawnType.SPAWN_REASON_WAVE);
                        _local_8.packID = _local_7.value;
                        _local_8.spawnData1 = _local_7.value1;
                        _local_8.localMapPos = new MapPosition();
                        AICore.monsterSystem.getSpawnManager().spawnMonsters(_local_8);
                        return;
                    };
                };
                _local_6++;
            };
        }

        public /*  ©init. */ function _SafeStr_1180()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1180 = " ServerSpawnMonsterScript2" (String#14150)


