// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.func.impl.NormalSpecialFunc

package com.tencent.ai.core.func.impl
{
    import com.tencent.ai.core.enum.SpecialFuncIDDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ConditionInfo;
    import com.tencent.ai.core.data.StatusEffectInfo;
    import com.tencent.ai.core.status.IStatusEffect;
    import com.tencent.ai.core.data.StatusEventInfo;
    import com.tencent.ai.core.condition.ConditionBuilder;
    import com.tencent.ai.core.status.SStatus;
    import  ©init._SafeStr_568;

    public class NormalSpecialFunc extends BaseSpecialFunc 
    {

        public function NormalSpecialFunc()
        {
            super(SpecialFuncIDDef.NORMAL);
        }

        override public function execute():void
        {
            var _local_2:Vector.<ConditionInfo>;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Vector.<StatusEffectInfo>;
            var _local_6:int;
            var _local_7:StatusEffectInfo;
            var _local_8:IStatusEffect;
            var _local_1:StatusEventInfo = m_info.statusEventInfo;
            if (_local_1 != null){
                _local_2 = _local_1.conditionInfos;
                _local_3 = _local_1.cFlag;
                _local_4 = (((_local_2 == null)) ? 0 : _local_2.length);
                if (_local_3 == 0){
                    _local_6 = 0;
                    while (_local_6 < _local_4) {
                        if (!ConditionBuilder.STATIC_CHECK(_local_2[_local_6], m_target)){
                            return;
                        };
                        _local_6++;
                    };
                } else {
                    _local_6 = 0;
                    while (_local_6 < _local_4) {
                        if (ConditionBuilder.STATIC_CHECK(_local_2[_local_6], m_target)) break;
                        _local_6++;
                    };
                    if (_local_6 == _local_4){
                        return;
                    };
                };
                _local_5 = _local_1.statusEffects;
                _local_6 = 0;
                while (_local_6 < _local_5.length) {
                    _local_7 = _local_5[_local_6];
                    _local_8 = SStatus.BUILD_SSEFFECT(_local_7.type);
                    _local_8.setSStatus(this);
                    _local_8.initialize(_local_7);
                    _local_8.execute();
                    _local_6++;
                };
            };
        }

        public /*  ©init. */ function _SafeStr_568()
        {
        }


    }
}//package com.tencent.ai.core.func.impl

// _SafeStr_568 = " NormalSpecialFunc" (String#17648)


