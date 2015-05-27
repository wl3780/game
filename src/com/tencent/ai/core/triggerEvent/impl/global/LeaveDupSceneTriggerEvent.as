// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.LeaveDupSceneTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_1336;

    public class LeaveDupSceneTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_dupid:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this.m_dupid = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            super.activate();
            AICore.addAIEventListener(AIEvent.ON_LEAVE_DUP_SCENE, this.onSceneChange);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_LEAVE_DUP_SCENE, this.onSceneChange);
        }

        private function onSceneChange(_arg_1:AIEvent):void
        {
            var _local_3:Object;
            var _local_4:int;
            var _local_2:SceneInfo = (_arg_1.data as SceneInfo);
            if (_local_2){
                _local_3 = (AICore.data.runtime.getData(Constants.RTD_DUP) as Object);
                if (_local_3){
                    _local_4 = _local_3.dup_id;
                    if (uint((((this.m_dupid > 10000)) ? (this.m_dupid / 10) : this.m_dupid)) == uint((_local_4 / 10))){
                        fireEvent();
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1336()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1336 = " LeaveDupSceneTriggerEvent" (String#13697)


