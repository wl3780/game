// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.actions.BaseInteractDynamicAction

package com.tencent.ai.core.interact.actions
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
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.components.GravityComponent;
    import com.tencent.ai.core.element.MovementElement;
    import com.tencent.ai.core.actor.model.Variable;
    import  ©init._SafeStr_570;

    public class BaseInteractDynamicAction extends InteractIDAction implements IFrameListener, ITarget 
    {

        protected var events:Dictionary;
        protected var __controlFunction:CFunction;
        protected var __controlScriptArg:ControlScriptArg;
        protected var __variables:Array;
        private var __controlfunc:CFunction;
        private var __x_move:Boolean;
        private var __z_move:Boolean;
        private var __playingSounds:Array;

        public function BaseInteractDynamicAction(_arg_1:int)
        {
            super(_arg_1);
            this.initThis();
        }

        protected function initThis():void
        {
            build_scripts(0, this);
            this.events = new Dictionary();
            this.events[MotionDef.L_FRAME_END] = new CFunction(nextAction, this);
            this.__controlfunc = new CFunction(this.inputControlVKey, this);
            this.__variables = [];
            this.__playingSounds = [];
            this.__x_move = false;
            this.__z_move = false;
        }

        protected function controlMove(_arg_1:int, _arg_2:int, _arg_3:int=0):void
        {
            var _local_4:int = ((_arg_2 * ((this.__controlScriptArg.useRun) ? model.runV : model.walkV)) * this.__controlScriptArg.speedRate);
            if (_arg_1 == PosArg.DIR_Z){
                _local_4 = (_local_4 * this.__controlScriptArg.zRate);
            };
            target.move(_arg_1, _local_4);
            if (((!((_arg_3 == 0))) && (this.__controlScriptArg.useDirection))){
                target.setDirection(_arg_3);
            };
        }

        protected function inputControlVKey(_arg_1:int, _arg_2:Object=null):Boolean
        {
            switch (_arg_1){
                case VKeyDef.GO_UP:
                case VKeyDef.RUN_UP:
                    this.controlMove(PosArg.DIR_Z, -1);
                    this.__z_move = true;
                    return (true);
                case VKeyDef.GO_DOWN:
                case VKeyDef.RUN_DOWN:
                    this.controlMove(PosArg.DIR_Z, 1);
                    this.__z_move = true;
                    return (true);
                case VKeyDef.GO_RIGHT:
                case VKeyDef.RUN_RIGHT:
                    this.controlMove(PosArg.DIR_X, 1, Direction.RIGHT);
                    this.__x_move = true;
                    return (true);
                case VKeyDef.GO_LEFT:
                case VKeyDef.RUN_LEFT:
                    this.controlMove(PosArg.DIR_X, -1, Direction.LEFT);
                    this.__x_move = true;
                    return (true);
                case VKeyDef.STOP_LEFT:
                case VKeyDef.STOP_RIGHT:
                    target.stopMove(PosArg.DIR_X);
                    this.__x_move = false;
                    return (((this.__x_move) || (this.__z_move)));
                case VKeyDef.STOP_DOWN:
                case VKeyDef.STOP_UP:
                    target.stopMove(PosArg.DIR_Z);
                    this.__z_move = false;
                    return (((this.__x_move) || (this.__z_move)));
            };
            return (false);
        }

        protected function activeAction():void
        {
            __actionInfo = __model.getActionInfo(actionID);
            this.setCurrentState(0);
            if (__view){
                __view.addFrameListener(MotionDef.L_FRAME_END, this);
                __view.addScriptListener(this);
            };
        }

        protected function inactiveAction():void
        {
            clearLastScripts();
            this.__variables.length = 0;
            if (__view){
                __view.removeFrameListener(MotionDef.L_FRAME_END, this);
                __view.removeScriptListener(this);
            };
            __actionInfo = null;
            __currentActionState = null;
            __acceptVKeyFunction = null;
            if (this.__controlScriptArg != null){
                this.control(null);
            };
            this.landFunction = null;
            this.__x_move = false;
            this.__z_move = false;
            target.stopAllSounds();
        }

        public function clearVirgations():void
        {
            __acceptVKeyFunction = null;
            this.landFunction = null;
        }

        public function control(_arg_1:ScriptArg):void
        {
            this.__controlScriptArg = (_arg_1 as ControlScriptArg);
            if ((((this.__controlScriptArg == null)) || (this.__controlScriptArg.release))){
                this.__controlFunction = null;
                this.__controlScriptArg = null;
                target.stopMove();
            } else {
                this.__controlFunction = this.__controlfunc;
            };
        }

        public function onFrameEvent(_arg_1:String):void
        {
            var _local_2:CFunction = this.events[_arg_1];
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
            if (!((!((this.__controlFunction == null))) && (this.__controlFunction.call(_arg_1, _arg_2)))){
                if (((!((__acceptVKeyFunction == null))) && (__acceptVKeyFunction.call(_arg_1, _arg_2)))){
                    __acceptVKeyFunction = null;
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
            __acceptVKeyFunction = null;
            __currentActionArgs = null;
            __currentActionState = __actionInfo.actionStates[_arg_1];
            if (!__currentActionState){
                __currentActionState = new ActionState();
                __currentActionState.index = _arg_1;
                __currentActionState.frameIndex = 0;
                __currentActionState.motionID = __target.getMotionID();
                __actionInfo.actionStates[_arg_1] = __currentActionState;
            };
            if (__target.getMotionID() != __currentActionState.motionID){
                __target.setMotionID(__currentActionState.motionID);
            };
            var _local_2:int = __currentActionState.frameIndex;
            if (_local_2 != 0){
                if (__view){
                    __view.gotoAndPlay(_local_2);
                };
            };
        }

        public function get landFunction():CFunction
        {
            return (__landFunction);
        }

        public function set landFunction(_arg_1:CFunction):void
        {
            var _local_3:GravityComponent;
            __landFunction = _arg_1;
            var _local_2:MovementElement = (target as MovementElement);
            if (_local_2 != null){
                _local_3 = _local_2.getGravityComponent();
                if (_local_3 != null){
                    _local_3.setEndFunction(__landFunction);
                };
            };
        }

        public function getVariable(_arg_1:int, _arg_2:Boolean=false):Variable
        {
            var _local_3:Variable = this.__variables[_arg_1];
            if ((((_local_3 == null)) && (_arg_2))){
                _local_3 = new Variable(_arg_1);
                this.__variables[_arg_1] = _local_3;
            };
            return (_local_3);
        }

        public function get currentActionState():ActionState
        {
            return (__currentActionState);
        }

        public function get currentActionArgs():Array
        {
            return (__currentActionArgs);
        }

        public function set acceptVKeyFunction(_arg_1:CFunction):void
        {
            __acceptVKeyFunction = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_570()
        {
        }


    }
}//package com.tencent.ai.core.interact.actions

// _SafeStr_570 = " BaseInteractDynamicAction" (String#16721)


