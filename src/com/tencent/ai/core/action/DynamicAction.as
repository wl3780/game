// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.DynamicAction

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.ITarget;
    import flash.utils.Dictionary;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.arg.script.ControlScriptArg;
    import com.tencent.ai.core.script.build_scripts;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.components.GravityComponent;
    import com.tencent.ai.core.element.MovementElement;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.data.ActionState;
    import  ©init._SafeStr_21;

    public class DynamicAction extends IDAction implements IFrameListener, ITarget 
    {

        protected var m_events:Dictionary;
        protected var m_controlFunction:CFunction;
        protected var m_controlScriptArg:ControlScriptArg;
        protected var m_lastestVX:int;
        protected var m_variables:Array;
        protected var m_controlfunc:CFunction;
        protected var m_x_move:Boolean;
        protected var m_z_move:Boolean;

        public function DynamicAction(_arg_1:int)
        {
            super(_arg_1);
            this.initThis();
        }

        protected function initThis():void
        {
            build_scripts(0, this);
            this.m_events = new Dictionary();
            this.m_events[MotionDef.L_FRAME_END] = new CFunction(nextAction, this);
            this.m_controlfunc = new CFunction(this.inputControlVKey, this);
            this.m_lastestVX = 0;
            this.m_variables = [];
            this.m_x_move = false;
            this.m_z_move = false;
        }

        protected function controlMove(_arg_1:int, _arg_2:int, _arg_3:int=0):void
        {
            if (((!((_arg_3 == 0))) && (this.m_controlScriptArg.useDirection))){
                target.setDirection(_arg_3);
            };
            var _local_4:int = ((this.m_controlScriptArg.useLastestVX) ? this.m_lastestVX : 0);
            var _local_5:Number = 1;
            if (_local_4 == 0){
                _local_4 = ((this.m_controlScriptArg.useRun) ? model.runV : model.walkV);
            };
            if (_arg_1 == PosArg.DIR_Z){
                _local_5 = this.m_controlScriptArg.zRate;
                _local_4 = ((_arg_2 * _local_4) * _local_5);
            } else {
                _local_5 = (((target.getDirection())!=_arg_3) ? this.m_controlScriptArg.rSpeedRate : this.m_controlScriptArg.speedRate);
                _local_4 = ((_arg_2 * _local_4) * _local_5);
            };
            if (_local_5 != 0){
                target.move(_arg_1, _local_4);
            };
        }

        protected function inputControlVKey(_arg_1:int, _arg_2:Object=null):Boolean
        {
            switch (_arg_1){
                case VKeyDef.GO_UP:
                case VKeyDef.RUN_UP:
                    this.controlMove(PosArg.DIR_Z, -1);
                    this.m_z_move = true;
                    return (true);
                case VKeyDef.GO_DOWN:
                case VKeyDef.RUN_DOWN:
                    this.controlMove(PosArg.DIR_Z, 1);
                    this.m_z_move = true;
                    return (true);
                case VKeyDef.GO_RIGHT:
                case VKeyDef.RUN_RIGHT:
                    this.controlMove(PosArg.DIR_X, 1, Direction.RIGHT);
                    this.m_x_move = true;
                    return (true);
                case VKeyDef.GO_LEFT:
                case VKeyDef.RUN_LEFT:
                    this.controlMove(PosArg.DIR_X, -1, Direction.LEFT);
                    this.m_x_move = true;
                    return (true);
                case VKeyDef.STOP_LEFT:
                    if (!m_controller.isVKeyDown(VKeyDef.GO_RIGHT)){
                        target.stopMove(PosArg.DIR_X);
                        this.m_x_move = false;
                        return (((this.m_x_move) || (this.m_z_move)));
                    };
                    this.controlMove(PosArg.DIR_X, 1, Direction.RIGHT);
                    return (true);
                case VKeyDef.STOP_RIGHT:
                    if (!m_controller.isVKeyDown(VKeyDef.GO_LEFT)){
                        target.stopMove(PosArg.DIR_X);
                        this.m_x_move = false;
                        return (((this.m_x_move) || (this.m_z_move)));
                    };
                    this.controlMove(PosArg.DIR_X, -1, Direction.LEFT);
                    return (true);
                case VKeyDef.STOP_DOWN:
                    if (!m_controller.isVKeyDown(VKeyDef.GO_UP)){
                        target.stopMove(PosArg.DIR_Z);
                        this.m_z_move = false;
                        return (((this.m_x_move) || (this.m_z_move)));
                    };
                    this.controlMove(PosArg.DIR_Z, -1);
                    return (true);
                case VKeyDef.STOP_UP:
                    if (!m_controller.isVKeyDown(VKeyDef.GO_DOWN)){
                        target.stopMove(PosArg.DIR_Z);
                        this.m_z_move = false;
                        return (((this.m_x_move) || (this.m_z_move)));
                    };
                    this.controlMove(PosArg.DIR_Z, 1);
                    return (true);
            };
            return (false);
        }

        protected function activeAction():void
        {
            m_actionInfo = m_model.getActionInfo(m_actionID);
            this.setCurrentState(0);
            if (m_view){
                m_view.addFrameListener(MotionDef.L_FRAME_END, this);
                m_view.addScriptListener(this);
            };
        }

        protected function inactiveAction():void
        {
            clearLastScripts();
            this.m_variables.length = 0;
            m_view.removeFrameListener(MotionDef.L_FRAME_END, this);
            m_view.removeScriptListener(this);
            m_actionInfo = null;
            m_currentActionState = null;
            m_acceptVKeyFunction = null;
            if (this.m_controlScriptArg != null){
                this.control(null);
            };
            this.landFunction = null;
            this.m_x_move = false;
            this.m_z_move = false;
            m_target.stopAllSounds();
        }

        protected function checkControlKey(... _args):void
        {
            if (m_controller.isVKeyDown(VKeyDef.GO_LEFT)){
                this.inputControlVKey(VKeyDef.GO_LEFT);
            } else {
                if (m_controller.isVKeyDown(VKeyDef.GO_RIGHT)){
                    this.inputControlVKey(VKeyDef.GO_RIGHT);
                };
            };
            if (m_controller.isVKeyDown(VKeyDef.GO_DOWN)){
                this.inputControlVKey(VKeyDef.GO_DOWN);
            } else {
                if (m_controller.isVKeyDown(VKeyDef.GO_UP)){
                    this.inputControlVKey(VKeyDef.GO_UP);
                };
            };
        }

        public function clearVirgations():void
        {
            m_acceptVKeyFunction = null;
            this.landFunction = null;
        }

        public function control(_arg_1:ScriptArg):void
        {
            this.m_controlScriptArg = (_arg_1 as ControlScriptArg);
            if ((((this.m_controlScriptArg == null)) || (this.m_controlScriptArg.release))){
                this.m_controlFunction = null;
                this.m_controlScriptArg = null;
                this.m_lastestVX = 0;
                target.stopMove();
                m_model.removeEventListener(ActorModelEvent.ON_V_CHANGE, this.checkControlKey);
            } else {
                this.m_controlFunction = this.m_controlfunc;
                this.m_lastestVX = target.getLastestVX();
                this.checkControlKey();
                m_model.addEventListener(ActorModelEvent.ON_V_CHANGE, this.checkControlKey);
            };
        }

        public function onFrameEvent(_arg_1:String):void
        {
            var _local_2:CFunction = this.m_events[_arg_1];
            if (_local_2 != null){
                _local_2.invoke();
            };
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            if (!m_flag){
                m_flag = true;
                super.exec(_arg_1, _arg_2);
                this.activeAction();
            };
            var _local_3:Boolean = true;
            if (((!((this.m_controlFunction == null))) && (this.m_controlFunction.call(_arg_1, _arg_2)))){
                _local_3 = this.m_controlScriptArg.checkContinue;
            };
            if (((_local_3) && (!((m_acceptVKeyFunction == null))))){
                if (VKeyDef.IS_HOT_KEY(_arg_1)){
                    _arg_1 = m_controller.convertVkey(_arg_1);
                };
                if (m_acceptVKeyFunction.call(_arg_1, _arg_2)){
                    m_acceptVKeyFunction = null;
                };
            };
        }

        override public function stop():void
        {
            if (m_flag){
                m_flag = false;
                this.inactiveAction();
            };
        }

        public function setCurrentState(_arg_1:int):void
        {
            m_acceptVKeyFunction = null;
            m_currentActionArgs = null;
            m_currentActionState = m_actionInfo.actionStates[_arg_1];
            m_target.setMotionID(m_currentActionState.motionID);
            var _local_2:int = m_currentActionState.frameIndex;
            if (_local_2 != 0){
                m_view.gotoAndPlay(_local_2);
            };
        }

        public function get landFunction():CFunction
        {
            return (m_landFunction);
        }

        public function set landFunction(_arg_1:CFunction):void
        {
            var _local_3:GravityComponent;
            m_landFunction = _arg_1;
            var _local_2:MovementElement = (target as MovementElement);
            if (_local_2 != null){
                _local_3 = _local_2.getGravityComponent();
                if (_local_3 != null){
                    _local_3.setEndFunction(m_landFunction);
                };
            };
        }

        public function getVariable(_arg_1:int, _arg_2:Boolean=false):Variable
        {
            var _local_3:Variable = this.m_variables[_arg_1];
            if ((((_local_3 == null)) && (_arg_2))){
                _local_3 = new Variable(_arg_1);
                this.m_variables[_arg_1] = _local_3;
            };
            return (_local_3);
        }

        public function get currentActionState():ActionState
        {
            return (m_currentActionState);
        }

        public function get currentActionArgs():Array
        {
            return (m_currentActionArgs);
        }

        public function set acceptVKeyFunction(_arg_1:CFunction):void
        {
            m_acceptVKeyFunction = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_21()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_21 = " DynamicAction" (String#13727)


