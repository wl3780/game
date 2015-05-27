// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_AddStatus

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.actor.BaseActor;
    import  ©init._SafeStr_1263;

    public class SSEF_AddStatus extends SSEF_Base 
    {

        private static var _SSM:ISpecialStatusManager;


        public static function get SSM():ISpecialStatusManager
        {
            if (_SSM == null){
                _SSM = AICore.combatSystem.getSpecialStatusManager();
            };
            return (_SSM);
        }


        override public function execute():void
        {
            var _local_3:Object;
            var _local_1:BaseActor = m_target;
            var _local_2:int = m_info.data_1;
            if (m_info.data_2 == 1){
                _local_3 = m_sstatus.getRTParams();
                _local_1 = (((_local_3 == null)) ? null : _local_3.aimActor);
            };
            if (_local_1 != null){
                SSM.applyStatus(_local_1, _local_2, null, true, m_sstatus.getRTParams());
            };
        }

        public /*  ©init. */ function _SafeStr_1263()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1263 = " SSEF_AddStatus" (String#15716)


