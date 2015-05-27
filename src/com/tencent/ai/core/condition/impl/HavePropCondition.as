// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.HavePropCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.player.IItemManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ItemConstants;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_88;

    public class HavePropCondition extends Condition 
    {

        private static var _ITEM_MANAGER:IItemManager;


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Object;
            var _local_7:int;
            var _local_8:Boolean;
            var _local_9:int;
            var _local_10:int;
            var _local_11:Object;
            if (_ITEM_MANAGER == null){
                _ITEM_MANAGER = AICore.data.mainModel.itemManager;
            };
            if (m_info.args.length == 3){
                _local_3 = int(m_info.args[0]);
                _local_4 = int(m_info.args[1]);
                _local_5 = int(m_info.args[2]);
                _local_7 = (_local_4 / 100000);
                switch (_local_7){
                    case ItemConstants.PropKind_EQUIP:
                        _local_6 = _ITEM_MANAGER.equipItems;
                        break;
                    case ItemConstants.PropKind_COMBAT:
                        _local_6 = _ITEM_MANAGER.combatItems;
                        break;
                    case ItemConstants.PropKind_COMMON:
                        _local_6 = _ITEM_MANAGER.commonItems;
                        break;
                };
                _local_8 = false;
                _local_10 = _local_6.length;
                _local_9 = 0;
                while (_local_9 < _local_10) {
                    _local_11 = _local_6[_local_9];
                    if (_local_11.id == _local_4){
                        _local_8 = true;
                        break;
                    };
                    _local_9++;
                };
                if (_local_3 == 1){
                    if (((_local_8) && ((_local_6[_local_9].num >= _local_5)))){
                        m_flag = true;
                    } else {
                        m_flag = false;
                    };
                } else {
                    if (!_local_8){
                        m_flag = true;
                    } else {
                        m_flag = false;
                    };
                };
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_88()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_88 = " HavePropCondition" (String#14798)


