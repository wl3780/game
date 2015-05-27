// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.KillMonstersTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.MonsterEvent;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import  ©init._SafeStr_1334;

    public class KillMonstersTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_monsterm:IMonsterManager;


        override public function activate():void
        {
            super.activate();
            this.m_monsterm = AICore.Runtime.currentContext.getMonsterManager();
            this.m_monsterm.addEventListener(MonsterEvent.ON_MONSTER_REMOVED, this.onMonsterRemoved);
            this.onMonsterRemoved(null);
        }

        override public function inactivate():void
        {
            super.inactivate();
            if (this.m_monsterm){
                this.m_monsterm.removeEventListener(MonsterEvent.ON_MONSTER_REMOVED, this.onMonsterRemoved);
                this.m_monsterm = null;
            };
        }

        private function onMonsterRemoved(_arg_1:MonsterEvent):void
        {
            if (this.m_monsterm.isEmpty(ElementGroupDef.PVE_MONSTER)){
                fireEvent();
            };
        }

        public /*  ©init. */ function _SafeStr_1334()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1334 = " KillMonstersTriggerEvent" (String#14975)


