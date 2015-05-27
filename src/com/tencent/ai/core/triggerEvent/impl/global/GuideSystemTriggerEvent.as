// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.GuideSystemTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.events.AIGuideSystemEvent;
    import  ©init._SafeStr_1330;

    public class GuideSystemTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_ID:int;
        protected var m_eventStr:String;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length >= 2)))){
                this.m_ID = int(_arg_1.args[0]);
                this.m_eventStr = String(_arg_1.args[1]);
            };
        }

        override public function activate():void
        {
            super.activate();
            var _local_1:IGuideSystemManager = AICore.guideSystem;
            if (_local_1 != null){
                _local_1.addEventListener(AIGuideSystemEvent.ON_CLOSE_SYSTEM_ALERT, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_CLOSE_SYSTEM_DIALOG, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_A_ARROW, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_A_GO_ARROW, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_A_KEY_SHOW_BAR, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_A_MASK, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_A_SCENE_ARROW, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_THE_COPYMOVIE, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DARKSCREEN_DARK, this.onAutoActEvent);
                _local_1.addEventListener(AIGuideSystemEvent.ON_DELETE_THE_DARKSCREEN, this.onAutoActEvent);
            };
        }

        override public function inactivate():void
        {
            super.inactivate();
            var _local_1:IGuideSystemManager = AICore.guideSystem;
            if (_local_1 != null){
                _local_1.removeEventListener(AIGuideSystemEvent.ON_CLOSE_SYSTEM_ALERT, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_CLOSE_SYSTEM_DIALOG, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_A_ARROW, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_A_GO_ARROW, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_A_KEY_SHOW_BAR, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_A_MASK, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_A_SCENE_ARROW, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_THE_COPYMOVIE, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DARKSCREEN_DARK, this.onAutoActEvent);
                _local_1.removeEventListener(AIGuideSystemEvent.ON_DELETE_THE_DARKSCREEN, this.onAutoActEvent);
            };
        }

        private function onAutoActEvent(_arg_1:AIGuideSystemEvent):void
        {
            if (_arg_1.data == this.m_ID){
                if (this.m_eventStr.indexOf(_arg_1.type) != -1){
                    fireEvent();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1330()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1330 = " GuideSystemTriggerEvent" (String#17144)


