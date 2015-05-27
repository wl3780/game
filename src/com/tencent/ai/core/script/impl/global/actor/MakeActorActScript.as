// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.actor.MakeActorActScript

package com.tencent.ai.core.script.impl.global.actor
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.data.arg.script.AutoAIActArg;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.AICore;
    import com.tencent.free.logging.warning;
    import  ©init._SafeStr_1147;

    public class MakeActorActScript extends GlobalScript 
    {

        public function MakeActorActScript()
        {
            m_cmds = ScriptCmdDef.SC_MAKE_ACTOR_ACT;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:uint;
            var _local_6:IPlayerManager;
            var _local_3:AutoAIActArg = (_arg_2 as AutoAIActArg);
            var _local_4:BaseActor = (m_target as BaseActor);
            if (_local_4 == null){
                if (_local_3.targetType == 0){
                    _local_5 = _local_3.targetID;
                    _local_6 = AICore.Runtime.currentContext.getPlayerManager();
                    if (_local_5 == 0){
                        _local_4 = _local_6.getMainPlayer();
                    } else {
                        _local_4 = _local_6.getPlayerByID(_local_5);
                    };
                } else {
                    _local_4 = AICore.Runtime.currentContext.getMonsterManager().getMonsterByID(_local_3.targetID);
                };
            };
            if (_local_4 == null){
                warning("[MakeActorActScript] 找不到相应的ACTOR!!");
                return;
            };
            _local_4.autoAIAct(AutoAIActArg.MAKE_ACTOR_ACT, _local_3);
        }

        public /*  ©init. */ function _SafeStr_1147()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.actor

// _SafeStr_1147 = " MakeActorActScript" (String#14825)


