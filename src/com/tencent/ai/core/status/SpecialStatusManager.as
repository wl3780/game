// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.SpecialStatusManager

package com.tencent.ai.core.status
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.combat.ICombatSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.SpecialStatusInfo;
    import  ©init._SafeStr_1291;

    public class SpecialStatusManager implements ISpecialStatusManager 
    {

        private static var _INSTANCE:SpecialStatusManager;
        static var STATUS_CLS_MAP:Dictionary;

        protected var m_combatsys:ICombatSystem;
        protected var m_data:IDataManager;


        public static function getInstance():SpecialStatusManager
        {
            if (_INSTANCE == null){
                _INSTANCE = new (SpecialStatusManager)();
            };
            return (_INSTANCE);
        }


        public function initialize(_arg_1:ICombatSystem):void
        {
            this.m_combatsys = _arg_1;
            this.m_data = AICore.data;
        }

        public function applyStatus(_arg_1:ISpecialStatusTarget, _arg_2:int, _arg_3:SSModel=null, _arg_4:Boolean=true, _arg_5:Object=null):void
        {
            var _local_6:SpecialStatusInfo;
            var _local_7:Class;
            var _local_8:ISpecialStatus;
            if (_arg_3 == null){
                _arg_3 = new SSModel();
                _local_6 = this.m_data.getSpecialStatusInfo(_arg_2);
                _arg_3.setStatusInfo(_local_6);
            };
            _local_6 = _arg_3.statusInfo;
            if (_local_6 != null){
                _local_7 = STATUS_CLS_MAP[_local_6.classID];
                _local_8 = (new (_local_7)() as ISpecialStatus);
                if (_arg_5 != null){
                    _local_8.setRTParams(_arg_5);
                };
                _local_8.setTarget(_arg_1);
                _local_8.setModel(_arg_3);
                _arg_1.addStatus(_local_8, _arg_4);
            };
        }

        public /*  ©init. */ function _SafeStr_1291()
        {
        }


    }
}//package com.tencent.ai.core.status

// _SafeStr_1291 = " SpecialStatusManager" (String#14894)


