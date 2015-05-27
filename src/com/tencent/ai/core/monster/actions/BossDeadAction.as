// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.actions.BossDeadAction

package com.tencent.ai.core.monster.actions
{
    import com.tencent.ai.core.action.DeadAction;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.exec_behind_frame;
    import  ©init._SafeStr_686;

    public class BossDeadAction extends DeadAction 
    {

        protected var vanishHandler:CFunction;
        protected var downEndFunc:CFunction;
        protected var vChange:CFunction;
        protected var seInfo:EffectInfo;

        public function BossDeadAction()
        {
            this.initThis();
        }

        override protected function initThis():void
        {
            super.initThis();
            this.seInfo = new EffectInfo();
            this.seInfo.eid = 5002;
            this.vanishHandler = new CFunction(this.vanishNow, this);
        }

        override protected function gotoHell():void
        {
            m_view.stop();
            var _local_1:MapPosition = m_target.getMapPosition();
            _local_1.z = (_local_1.z + _local_1.y);
            _local_1.y = 0;
            this.seInfo.location = _local_1;
            m_scene.createElement(ElementType.ET_EFFECT, this.seInfo);
            exec_behind_frame(this.vanishHandler);
        }

        protected function vanishNow():void
        {
            m_scene.destoryElement(m_target);
        }

        public /*  ©init. */ function _SafeStr_686()
        {
        }


    }
}//package com.tencent.ai.core.monster.actions

// _SafeStr_686 = " BossDeadAction" (String#15071)


