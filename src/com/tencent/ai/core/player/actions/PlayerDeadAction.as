// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.actions.PlayerDeadAction

package com.tencent.ai.core.player.actions
{
    import com.tencent.ai.core.action.DeadAction;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.VKeyDef;
    import  ©init._SafeStr_830;

    public class PlayerDeadAction extends DeadAction 
    {


        override protected function gotoHell():void
        {
            m_view.setMotionID(MotionDef.MT_LIE_GOT_UP);
            m_view.gotoAndStop(0);
            var _local_1:ActorModel = m_target.getModel();
            var _local_2:AIEvent = new AIEvent(AIEvent.PLAYER_DEAD_LAY_DOWN);
            _local_2.arg = _local_1.isMain;
            _local_2.data = _local_1.id;
            AICore.dispatchAIEvent(_local_2);
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            super.exec(_arg_1, _arg_2);
            if (_arg_1 == VKeyDef.EMPTY){
                if (!m_model.isDead){
                    nextAction(_arg_1);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_830()
        {
        }


    }
}//package com.tencent.ai.core.player.actions

// _SafeStr_830 = " PlayerDeadAction" (String#15674)


