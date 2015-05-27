// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.actions.PlayerWalkAction

package com.tencent.ai.core.player.actions
{
    import com.tencent.ai.core.action.DynamicAction;
    import com.tencent.ai.core.data.arg.script.CancelActionArg;
    import com.tencent.ai.core.data.arg.script.ControlScriptArg;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.ActionType;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_837;

    public class PlayerWalkAction extends DynamicAction 
    {

        protected var nextVKey:int = -1;
        protected var cancelArg:CancelActionArg;
        protected var controlArg:ControlScriptArg;

        public function PlayerWalkAction()
        {
            super(BaseActionIDDef.WALK);
            m_actionType = ActionType.MOVE;
            this.cancelArg = new CancelActionArg();
            this.cancelArg.cancelVKeys = "-1";
            this.controlArg = new ControlScriptArg();
            this.controlArg.zRate = DEFINE.PLAYER_WALK_Z_V_RATE;
        }

        override protected function activeAction():void
        {
            super.activeAction();
            onScript(ScriptCmdDef.SC_CANCEL_ACTION, this.cancelArg);
            onScript(ScriptCmdDef.SC_CONTROL, this.controlArg);
        }

        override protected function inactiveAction():void
        {
            this.nextVKey = -1;
            super.inactiveAction();
        }

        override protected function inputControlVKey(_arg_1:int, _arg_2:Object=null):Boolean
        {
            if (m_acceptVKeyFunction == null){
                onScript(ScriptCmdDef.SC_CANCEL_ACTION, this.cancelArg);
            };
            return (super.inputControlVKey(_arg_1, _arg_2));
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            this.nextVKey = _arg_1;
            super.exec(_arg_1, _arg_2);
        }

        public /*  ©init. */ function _SafeStr_837()
        {
        }


    }
}//package com.tencent.ai.core.player.actions

// _SafeStr_837 = " PlayerWalkAction" (String#16778)


