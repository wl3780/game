// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.WearAvatarCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.AICore;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_95;

    public class WearAvatarCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_7:int;
            var _local_8:int;
            var _local_9:EquipItemInfo;
            var _local_3 = (int(m_info.args[0]) == 0);
            var _local_4:int = int(m_info.args[1]);
            var _local_5:Vector.<EquipItemInfo> = AICore.data.mainModel.itemManager.equips;
            var _local_6:Boolean;
            _local_8 = _local_5.length;
            _local_7 = 0;
            while (_local_7 < _local_8) {
                _local_9 = _local_5[_local_7];
                if (_local_9.id == _local_4){
                    _local_6 = true;
                    break;
                };
                _local_7++;
            };
            m_flag = (_local_3 == _local_6);
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_95()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_95 = " WearAvatarCondition" (String#15230)


