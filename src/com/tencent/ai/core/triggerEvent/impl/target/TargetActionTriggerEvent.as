// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.target.TargetActionTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.target
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.ActionInfo;
    import  ©init._SafeStr_1356;

    public class TargetActionTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_target:BaseActor;
        protected var m_targetType:int;
        protected var m_targetID:int;
        protected var m_actionIDs:String;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 3)))){
                this.m_targetType = int(_arg_1.args[0]);
                this.m_targetID = int(_arg_1.args[1]);
                this.m_actionIDs = (("," + String(_arg_1.args[2])) + ",");
            };
        }

        override public function activate():void
        {
            super.activate();
            this.m_target = AICore.Runtime.currentContext.getPlayerManager().getMainPlayer();
            this.m_target.getModel().addEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onActionChange);
        }

        override public function inactivate():void
        {
            super.inactivate();
            if (this.m_target != null){
                this.m_target.getModel().removeEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onActionChange);
            };
        }

        private function onActionChange(_arg_1:ActorModelEvent):void
        {
            var _local_2:ActionInfo = (_arg_1.data as ActionInfo);
            var _local_3:int = (((_local_2 == null)) ? 0 : (_local_2.id));
            if (this.m_actionIDs.indexOf((("," + _local_3) + ",")) != -1){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1356()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.target

// _SafeStr_1356 = " TargetActionTriggerEvent" (String#15614)


