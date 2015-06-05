package com.tencent.ai.core.action.hurt
{
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.actor.IElementController;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.ActionType;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.script.BaseScriptsContainer;
    import com.tencent.ai.core.script.build_scripts;
    import com.tencent.free.utils.CFunction;

    public class BaseHurtAction extends BaseScriptsContainer implements IAcceptHurtAction 
    {

        protected var m_actionID:int;
        protected var m_actionType:int;
        protected var m_view:IElementView;
        protected var m_target:BaseActor;
        protected var m_model:ActorModel;
        protected var m_scene:IScene;
        protected var m_environmentInfo:EnvironmentInfo;
        protected var m_state:HurtState;
        protected var m_states:Array;
        protected var m_acceptVKeyFunction:CFunction;
        protected var m_waitNextAction:Boolean;

        public function BaseHurtAction(actionID:int)
        {
            this.m_actionID = actionID;
            this.initThis();
        }

        protected function initThis():void
        {
            build_scripts(-1, this, [ScriptCmdDef.SC_TARGET_SHAKE, ScriptCmdDef.SC_TARGET_CCOLOR, ScriptCmdDef.SC_CREATE_EFFECT, ScriptCmdDef.SC_CREATE_INTERACT, ScriptCmdDef.SC_MULTI, ScriptCmdDef.SC_ACCEPT_VKEY]);
            this.m_actionType = ActionType.HURT;
            m_flag = false;
            this.m_waitNextAction = false;
            this.m_states = [];
        }

        protected function activeAction(_arg_1:int, _arg_2:Object):void
        {
            this.m_target.setActorLocked(true);
            this.m_target.clearNextFrameFuncs(true);
            this.m_waitNextAction = false;
            this.m_view.addScriptListener(this);
        }

        protected function inactvieAction():void
        {
            clearLastScripts();
            this.m_view.removeScriptListener(this);
            if (this.m_state != null){
                this.m_state.end();
            };
            this.m_state = this.m_states[HurtState.NORMAL];
            this.m_target.setActorLocked(false);
            this.m_acceptVKeyFunction = null;
        }

        public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            if (!m_flag){
                this.activeAction(_arg_1, _arg_2);
                m_flag = true;
            } else {
                if (this.m_waitNextAction){
                    this.m_target.cancelNextFrameAct();
                    this.m_waitNextAction = false;
                };
            };
            if (this.m_acceptVKeyFunction != null){
                if (VKeyDef.IS_HOT_KEY(_arg_1)){
                    _arg_1 = this.m_target.getController().convertVkey(_arg_1);
                };
                if (this.m_acceptVKeyFunction.call(_arg_1, _arg_2)){
                    this.m_model.clearFloatFlag();
                    this.m_acceptVKeyFunction = null;
                };
            };
        }

        public function stop():void
        {
            if (m_flag){
                this.inactvieAction();
                m_flag = false;
            };
            this.m_waitNextAction = false;
        }

        public function nextAction(_arg_1:int=-1, _arg_2:Object=null):void
        {
            this.m_target.nextFrameAct(_arg_1, _arg_2);
            this.m_waitNextAction = true;
        }

        public function onNextState(_arg_1:int, _arg_2:AttackInfo):void
        {
            if (_arg_1 != HurtState.NULL){
                this.m_state.end();
                this.m_state = this.m_states[_arg_1];
                _arg_1 = this.m_state.accept(_arg_2);
            };
        }

        public function get target():HasActionElement
        {
            return (this.m_target);
        }

        public function get view():IElementView
        {
            return (this.m_view);
        }

        public function get model():ActorModel
        {
            return (this.m_model);
        }

        public function get scene():IScene
        {
            return (this.m_scene);
        }

        public function get environmentInfo():EnvironmentInfo
        {
            return (this.m_environmentInfo);
        }

        public function get actionInfo():ActionInfo
        {
            return (null);
        }

        public function switchToDead():Boolean
        {
            return (true);
        }

        public function beHurt(_arg_1:AttackInfo):Boolean
        {
            return (true);
        }

        public function getActionID():int
        {
            return (this.m_actionID);
        }

        public function getActionType():int
        {
            return (this.m_actionType);
        }

        public function isRuning():Boolean
        {
            return (m_flag);
        }

        public function handleHurt(_arg_1:IElementController, _arg_2:AttackInfo):Boolean
        {
            return (false);
        }

        public function setScene(_arg_1:IScene):void
        {
            if (_arg_1 != null){
                this.m_scene = _arg_1;
                this.m_environmentInfo = _arg_1.getInfo();
            } else {
                this.m_scene = null;
                this.m_environmentInfo = null;
            };
        }

        public function attach(_arg_1:Object):void
        {
            this.m_target = (_arg_1 as BaseActor);
            this.m_view = this.m_target.getActorView();
            this.m_model = this.m_target.getModel();
        }

        public function set acceptVKeyFunction(_arg_1:CFunction):void
        {
            this.m_acceptVKeyFunction = _arg_1;
            var _local_2:IElementController = this.m_target.getController();
            _local_2.isLock = (this.m_acceptVKeyFunction == null);
        }

        public function dispose():void
        {
            m_flag = false;
            this.m_target = null;
            this.m_view = null;
            this.m_scene = null;
            this.m_environmentInfo = null;
        }

        public function clearVirgations():void
        {
        }

        public function control(_arg_1:ScriptArg):void
        {
        }

        public function getVariable(_arg_1:int, _arg_2:Boolean=false):Variable
        {
            return (null);
        }

        public function setCurrentState(_arg_1:int):void
        {
        }

        public function get currentActionArgs():Array
        {
            return (null);
        }

        public function get currentActionState():ActionState
        {
            return (null);
        }

        public function get latestVKey():int
        {
            return (-1);
        }

        public function get landFunction():CFunction
        {
            return (null);
        }

        public function set landFunction(_arg_1:CFunction):void
        {
        }

    }
}
