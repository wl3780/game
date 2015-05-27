// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.MainPlayerDeadTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.player.IMainPlayerModel;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.MainModelEvent;
    import  ©init._SafeStr_1340;

    public class MainPlayerDeadTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_mainPlayerModel:IMainPlayerModel;


        override public function activate():void
        {
            super.activate();
            this.m_mainPlayerModel = AICore.data.mainModel;
            this.m_mainPlayerModel.addEventListener(MainModelEvent.ON_MAINPLAYER_DEAD, this.onMainPlayerDead);
        }

        override public function inactivate():void
        {
            super.inactivate();
            if (this.m_mainPlayerModel){
                this.m_mainPlayerModel.removeEventListener(MainModelEvent.ON_MAINPLAYER_DEAD, this.onMainPlayerDead);
                this.m_mainPlayerModel = null;
            };
        }

        private function onMainPlayerDead(_arg_1:MainModelEvent):void
        {
            fireEvent();
        }

        public /*  ©init. */ function _SafeStr_1340()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1340 = " MainPlayerDeadTriggerEvent" (String#16760)


