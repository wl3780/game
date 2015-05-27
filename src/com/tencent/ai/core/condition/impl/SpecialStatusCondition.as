// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.SpecialStatusCondition

package com.tencent.ai.core.condition.impl
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.ISpecialStatus;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ConditionInfo;
    import  ©init._SafeStr_94;

    public class SpecialStatusCondition extends Condition 
    {


        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_4:Vector.<ISpecialStatus>;
            var _local_5:int;
            var _local_6:int;
            var _local_7:Boolean;
            var _local_8:int;
            if (_arg_1 == null){
                _arg_1 = m_info;
            };
            var _local_3:BaseActor = (_arg_2 as BaseActor);
            if (_local_3 == null){
                _local_3 = AICore.Runtime.currentContext.getPlayerManager().getMainPlayer();
            };
            if (_local_3 != null){
                _local_4 = _local_3.getStatus();
                _local_5 = (((_local_4 == null)) ? 0 : (_local_4.length));
                _local_6 = int(_arg_1.args[0]);
                _local_7 = (int(_arg_1.args[1]) == 1);
                _local_8 = 0;
                while (_local_8 < _local_5) {
                    if (((_local_7) && ((_local_4[_local_8].getTypeInfo().type == _local_6)))){
                        return (true);
                    };
                    _local_8++;
                };
                if (!_local_7){
                    return (true);
                };
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_94()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_94 = " SpecialStatusCondition" (String#16268)


