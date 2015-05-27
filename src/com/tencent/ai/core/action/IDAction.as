// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.IDAction

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.script.BaseScriptsContainer;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.actor.IElementController;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_23;

    public class IDAction extends BaseScriptsContainer implements IElementAction 
    {

        protected var m_landFunction:CFunction;
        protected var m_acceptVKeyFunction:CFunction;
        protected var m_target:BaseActor;
        protected var m_controller:IElementController;
        protected var m_model:ActorModel;
        protected var m_view:IActorView;
        protected var m_currentActionState:ActionState;
        protected var m_currentActionArgs:Array;
        protected var m_actionInfo:ActionInfo;
        protected var m_environmentInfo:EnvironmentInfo;
        protected var m_scene:IScene;
        protected var m_latestVKey:int;
        protected var m_actionID:int;
        protected var m_actionType:int = 0;

        public function IDAction(_arg_1:int)
        {
            this.m_actionID = _arg_1;
        }

        public function get scene():IScene
        {
            return (this.m_scene);
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

        public function get actionInfo():ActionInfo
        {
            return (this.m_actionInfo);
        }

        public function get environmentInfo():EnvironmentInfo
        {
            return (this.m_environmentInfo);
        }

        public function get latestVKey():int
        {
            return (this.m_latestVKey);
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

        public function stop():void
        {
            m_flag = false;
        }

        public function isRuning():Boolean
        {
            return (m_flag);
        }

        public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            this.m_latestVKey = -1;
        }

        public function nextAction(_arg_1:int=-1, _arg_2:Object=null):void
        {
            this.m_target.nextFrameAct(_arg_1, _arg_2);
            this.m_latestVKey = _arg_1;
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
            this.m_model = this.m_target.getModel();
            this.m_view = this.m_target.getActorView();
            this.m_controller = this.m_target.getController();
        }

        public function dispose():void
        {
            m_flag = false;
            this.m_target = null;
            this.m_model = null;
            this.m_view = null;
            this.m_controller = null;
            this.m_scene = null;
            this.m_environmentInfo = null;
        }

        public /*  ©init. */ function _SafeStr_23()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_23 = " IDAction" (String#13724)


