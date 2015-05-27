// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.actions.SimpleWalkAction

package com.tencent.ai.core.monster.actions
{
    import com.tencent.ai.core.action.DynamicAction;
    import com.tencent.ai.core.data.arg.script.CancelActionArg;
    import com.tencent.ai.core.data.arg.script.ControlScriptArg;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.ActionType;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import  ©init._SafeStr_689;

    public class SimpleWalkAction extends DynamicAction 
    {

        protected var m_nextVKey:int = -1;
        protected var m_cancelArg:CancelActionArg;
        protected var m_controlArg:ControlScriptArg;
        protected var m_y_move:Boolean;

        public function SimpleWalkAction()
        {
            super(BaseActionIDDef.WALK);
        }

        override protected function initThis():void
        {
            super.initThis();
            m_actionType = ActionType.MOVE;
            this.m_cancelArg = new CancelActionArg();
            this.m_cancelArg.cancelVKeys = "-1";
            this.m_y_move = false;
            this.m_controlArg = new ControlScriptArg();
            this.m_controlArg.zRate = DEFINE.Z_V_RATE;
        }

        protected function moveY(_arg_1:int=1):void
        {
            var _local_2:int = (model.jumpV * _arg_1);
            target.jump(_local_2, null, null, 0);
        }

        override protected function activeAction():void
        {
            super.activeAction();
            onScript(ScriptCmdDef.SC_CANCEL_ACTION, this.m_cancelArg);
            onScript(ScriptCmdDef.SC_CONTROL, this.m_controlArg);
        }

        override protected function inactiveAction():void
        {
            if (this.m_nextVKey != VKeyDef.JUMP){
                m_target.stopMove();
            };
            this.m_nextVKey = -1;
            this.m_y_move = false;
            super.inactiveAction();
        }

        override protected function inputControlVKey(_arg_1:int, _arg_2:Object=null):Boolean
        {
            if (m_acceptVKeyFunction == null){
                onScript(ScriptCmdDef.SC_CANCEL_ACTION, this.m_cancelArg);
            };
            if (!super.inputControlVKey(_arg_1, _arg_2)){
                switch (_arg_1){
                    case VKeyDef.GO_Y_UP:
                        this.moveY(1);
                        m_z_move = true;
                        return (true);
                    case VKeyDef.GO_Y_DOWN:
                        this.moveY(-1);
                        m_z_move = true;
                        return (true);
                    case VKeyDef.STOP_Y_UP:
                    case VKeyDef.STOP_Y_DOWN:
                        target.stopJump();
                        this.m_y_move = false;
                        return (false);
                };
                return (false);
            };
            return (true);
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            this.m_nextVKey = _arg_1;
            super.exec(_arg_1, _arg_2);
        }

        public /*  ©init. */ function _SafeStr_689()
        {
        }


    }
}//package com.tencent.ai.core.monster.actions

// _SafeStr_689 = " SimpleWalkAction" (String#16574)


