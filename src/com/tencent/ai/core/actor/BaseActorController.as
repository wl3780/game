// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.BaseActorController

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_46;

    public class BaseActorController implements IElementController 
    {

        protected var m_actor:BaseActor;
        protected var m_currentAction:IElementAction;
        protected var m_canAct:Boolean;
        protected var m_locked:Boolean;

        public function BaseActorController(_arg_1:BaseActor)
        {
            this.m_actor = _arg_1;
            this.initThis();
        }

        protected function initThis():void
        {
            this.m_locked = false;
            this.m_canAct = true;
            this.m_actor.addEventListener(ElementEvent.ON_ELEMENT_DEAD, this.actDeadAction);
        }

        public function actDeadAction(... _args):void
        {
            var _local_2:ElementEvent;
            if ((((this.m_currentAction == null)) || (this.m_currentAction.switchToDead()))){
                _local_2 = (_args[0] as ElementEvent);
                this.m_actor.act(BaseActionIDDef.DEAD, VKeyDef.DEAD);
                this.m_currentAction = this.m_actor.getCurrentAction();
            };
        }

        public function actHurtAction(_arg_1:int, _arg_2:int, _arg_3:AttackInfo):void
        {
            this.m_actor.act(_arg_1, _arg_2, _arg_3);
            this.m_currentAction = this.m_actor.getCurrentAction();
        }

        public function vKeyAct(_arg_1:int, _arg_2:Object=null):void
        {
        }

        public function inputVKey(_arg_1:int):void
        {
            if (((!(this.m_locked)) && (this.m_canAct))){
                if (this.m_currentAction != null){
                    this.m_currentAction.exec(_arg_1);
                } else {
                    this.vKeyAct(_arg_1);
                };
            };
        }

        public function inputActionID(_arg_1:int):void
        {
        }

        public function accept(_arg_1:int):Boolean
        {
            return (false);
        }

        public function convertVkey(_arg_1:int):int
        {
            return (_arg_1);
        }

        public function setCanAct(_arg_1:Boolean):void
        {
            this.m_canAct = _arg_1;
        }

        public function set isLock(_arg_1:Boolean):void
        {
            this.m_locked = _arg_1;
        }

        public function get isLock():Boolean
        {
            return (this.m_locked);
        }

        public function isVKeyDown(_arg_1:int):Boolean
        {
            return (false);
        }

        public function manualControl(_arg_1:Boolean):void
        {
        }

        public function reset():void
        {
            if (this.m_currentAction != null){
                this.m_currentAction.stop();
                this.m_currentAction = null;
            };
            this.m_canAct = true;
            this.m_locked = false;
        }

        public /*  ©init. */ function _SafeStr_46()
        {
        }


    }
}//package com.tencent.ai.core.actor

// _SafeStr_46 = " BaseActorController" (String#13820)


