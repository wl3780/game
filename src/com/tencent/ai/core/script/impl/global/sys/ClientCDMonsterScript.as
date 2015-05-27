// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.ClientCDMonsterScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.script.ClientCreateMonsterArg;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.Direction;
    import  ©init._SafeStr_1162;

    public class ClientCDMonsterScript extends GlobalScript 
    {

        public function ClientCDMonsterScript()
        {
            m_cmds = [ScriptCmdDef.SC_CREATE_MONSTER, ScriptCmdDef.SC_DELETE_MONSTER];
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:int;
            var _local_5:ClientCreateMonsterArg;
            var _local_6:MonsterInfo;
            var _local_7:MonsterAIInfo;
            var _local_8:MonsterStaticInfo;
            var _local_3:IMonsterManager = AICore.Runtime.currentContext.getMonsterManager();
            if (_arg_1 == ScriptCmdDef.SC_DELETE_MONSTER){
                _local_4 = int(ScriptArg(_arg_2).argStr);
                _local_3.removeMonster(_local_4);
            } else {
                _local_5 = (_arg_2 as ClientCreateMonsterArg);
                _local_6 = new MonsterInfo();
                _local_7 = AICore.data.getMonsterAIInfo(_local_5.aiID);
                _local_6.id = _local_5.index;
                _local_6.groupID = _local_5.groupID;
                _local_6.activateAI = _local_5.activateAI;
                _local_6.diretion = (((_local_5.dir)!=Direction.LEFT) ? Direction.RIGHT : Direction.LEFT);
                _local_6.aiID = _local_7.aiID;
                _local_6.aiInfo = _local_7;
                _local_6.level = 20;
                _local_6.walkV = 600;
                _local_6.jumpV = 200;
                _local_6.p_defend = 0;
                _local_6.pDmgReduce = 0;
                _local_6.hit_rate = 1;
                _local_6.maxhp = 100;
                _local_6.hp = 100;
                _local_6.stiff = 10;
                _local_6.firm = 5;
                _local_6.mapPosition = _local_5.mapPosition;
                _local_8 = AICore.data.getMonsterStaticInfo(_local_5.id);
                _local_6.monsterID = _local_8.monsterID;
                _local_6.staticInfo = _local_8;
                _local_6.name = _local_8.name;
                _local_6.type = _local_8.type;
                _local_6.rank = _local_8.rank;
                _local_3.addMonster(_local_6);
            };
        }

        public /*  ©init. */ function _SafeStr_1162()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1162 = " ClientCDMonsterScript" (String#15584)


