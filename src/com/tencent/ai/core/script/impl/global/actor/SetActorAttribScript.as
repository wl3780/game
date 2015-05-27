// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.actor.SetActorAttribScript

package com.tencent.ai.core.script.impl.global.actor
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.arg.script.SetActorAttribArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.free.logging.warning;
    import com.tencent.ai.core.enum.Direction;
    import  ©init._SafeStr_1148;

    public class SetActorAttribScript extends GlobalScript 
    {

        public function SetActorAttribScript()
        {
            m_cmds = ScriptCmdDef.SC_SET_ACTOR_ATTRIB;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:BaseInteractItem;
            var _local_6:uint;
            var _local_7:IPlayerManager;
            var _local_8:uint;
            var _local_9:AN;
            var _local_3:BaseActor = (m_target as BaseActor);
            var _local_5:SetActorAttribArg = (_arg_2 as SetActorAttribArg);
            if (_local_3 == null){
                if (_local_5.targetType == 0){
                    _local_6 = _local_5.targetID;
                    _local_7 = AICore.Runtime.currentContext.getPlayerManager();
                    if (_local_6 == 0){
                        _local_3 = _local_7.getMainPlayer();
                    } else {
                        _local_3 = _local_7.getPlayerByID(_local_6);
                    };
                } else {
                    if (_local_5.targetType == 1){
                        _local_3 = AICore.Runtime.currentContext.getMonsterManager().getMonsterByID(_local_5.targetID);
                    } else {
                        if (_local_5.targetType == 2){
                            _local_8 = _local_5.targetID;
                            _local_4 = AICore.Runtime.currentContext.getInteractItemManager().getInteractItemByID(_local_8);
                        };
                    };
                };
            };
            if ((((_local_3 == null)) && ((_local_4 == null)))){
                warning("[MakeActorActScript] 找不到相应的ACTOR!!");
                return;
            };
            if (_local_5.attribType == SetActorAttribArg.ATTRIB_SET_POS){
                if (_local_5.targetType != 2){
                    _local_3.setMapPosition(_local_5.attribPos);
                    _local_3.setDirection((((_local_5.attribDir == Direction.LEFT)) ? Direction.LEFT : Direction.RIGHT));
                } else {
                    _local_4.setMapPosition(_local_5.attribPos);
                };
            } else {
                if (_local_5.attribType == SetActorAttribArg.ATTRIB_SPEAK_BUBBLE){
                    if (_local_5.targetType != 2){
                        _local_3.speakBubble(_local_5.attribStr, 1, _local_5.attribValue);
                    };
                } else {
                    if (_local_5.targetType != 2){
                        _local_9 = AN.ATTRIB[_local_5.attribType];
                        _local_3.getModel().setValueByName(_local_9.attribName, _local_5.attribValue);
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1148()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.actor

// _SafeStr_1148 = " SetActorAttribScript" (String#16463)


