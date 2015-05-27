// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.actions.InteractIDAction

package com.tencent.ai.core.interact.actions
{
    import com.tencent.ai.core.script.BaseScriptsContainer;
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_571;

    public class InteractIDAction extends BaseScriptsContainer implements IElementAction 
    {

        protected var __landFunction:CFunction;
        protected var __acceptVKeyFunction:CFunction;
        protected var __target:BaseInteractItem;
        protected var __view:IElementView;
        protected var __model:ActorModel;
        protected var __currentActionState:ActionState;
        protected var __currentActionArgs:Array;
        protected var __actionInfo:ActionInfo;
        protected var __environmentInfo:EnvironmentInfo;
        protected var __scene:IScene;
        protected var __latestVKey:int;
        protected var actionID:int;
        protected var actionType:int = 0;

        public function InteractIDAction(_arg_1:int)
        {
            this.actionID = _arg_1;
        }

        public function get scene():IScene
        {
            return (this.__scene);
        }

        public function get target():HasActionElement
        {
            return (this.__target);
        }

        public function get view():IElementView
        {
            return (this.__view);
        }

        public function get model():ActorModel
        {
            return (this.__model);
        }

        public function get actionInfo():ActionInfo
        {
            return (this.__actionInfo);
        }

        public function get environmentInfo():EnvironmentInfo
        {
            return (this.__environmentInfo);
        }

        public function get latestVKey():int
        {
            return (this.__latestVKey);
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
            return (this.actionID);
        }

        public function getActionType():int
        {
            return (this.actionType);
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
            this.__latestVKey = -1;
        }

        public function nextAction(_arg_1:int=-1, _arg_2:Object=null):void
        {
            this.__target.vKeyAct(_arg_1, _arg_2);
            this.__latestVKey = _arg_1;
        }

        public function setScene(_arg_1:IScene):void
        {
            if (_arg_1 != null){
                this.__scene = _arg_1;
                this.__environmentInfo = _arg_1.getInfo();
            } else {
                this.__scene = null;
                this.__environmentInfo = null;
            };
        }

        public function attach(_arg_1:Object):void
        {
            this.__target = (_arg_1 as BaseInteractItem);
            this.__view = this.__target.getView();
            this.__model = this.__target.getModel();
        }

        public function dispose():void
        {
            m_flag = false;
            this.__target = null;
            this.__view = null;
            this.__scene = null;
            this.__environmentInfo = null;
        }

        public /*  ©init. */ function _SafeStr_571()
        {
        }


    }
}//package com.tencent.ai.core.interact.actions

// _SafeStr_571 = " InteractIDAction" (String#16214)


