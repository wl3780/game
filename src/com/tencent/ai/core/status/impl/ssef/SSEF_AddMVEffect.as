// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_AddMVEffect

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1262;

    public class SSEF_AddMVEffect extends SSEF_Base 
    {

        protected var m_isAdded:Boolean;
        protected var m_effect:BaseElement;
        protected var m_seInfo:EffectInfo;

        public function SSEF_AddMVEffect()
        {
            this.m_isAdded = false;
        }

        override public function finalize():void
        {
            if (this.m_isAdded){
                m_target.getActorView().destoryElement(this.m_effect);
                this.m_effect = null;
                this.m_seInfo = null;
                this.m_isAdded = false;
            };
            super.finalize();
        }

        override public function execute():void
        {
            var _local_1:int;
            var _local_2:int;
            if (!this.m_isAdded){
                if (this.m_seInfo == null){
                    _local_1 = (((m_info == null)) ? 0 : m_info.data_1);
                    _local_2 = (((m_info == null)) ? 0 : m_info.data_2);
                    this.m_seInfo = new EffectInfo();
                    this.m_seInfo.eid = (((_local_1 == 0)) ? (m_sstatus.getTypeInfo().effectID) : _local_1);
                    this.m_seInfo.location = new MapPosition();
                    if (_local_2 != 0){
                        this.m_seInfo.tingeInfo = new TingeInfo(1, 1, 1, 1, m_info.data_3, m_info.data_4, m_info.data_5);
                    };
                };
                this.m_effect = m_target.getActorView().createElement(ElementType.ET_EFFECT, this.m_seInfo);
                this.m_isAdded = true;
            };
        }

        public /*  ©init. */ function _SafeStr_1262()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1262 = " SSEF_AddMVEffect" (String#14288)


