// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.condition.impl.ProcedureActiveCondition

package com.tencent.ai.core.condition.impl
{
    import com.tencent.ai.core.procedure.IProcedure;
    import com.tencent.ai.core.data.ConditionInfo;
    import com.tencent.ai.core.plot.IPlot;
    import  ©init._SafeStr_93;

    public class ProcedureActiveCondition extends Condition 
    {

        private var _owner:IProcedure;


        override public function initialize(_arg_1:ConditionInfo, _arg_2:Object=null):Boolean
        {
            super.initialize(_arg_1, _arg_2);
            this._owner = (_arg_2.owner as IProcedure);
            return (true);
        }

        override public function check(_arg_1:ConditionInfo=null, _arg_2:Object=null):Boolean
        {
            var _local_4:IPlot;
            var _local_5:Array;
            var _local_6:Boolean;
            var _local_7:int;
            var _local_3:IProcedure = (this._owner as IProcedure);
            if (_local_3){
                _local_4 = (_local_3.owner as IPlot);
            };
            if (((_local_4) && ((m_info.args.length == 2)))){
                m_flag = true;
                _local_5 = String(m_info.args[0]).split(",");
                _local_6 = (m_info.args[1] == "1");
                if (((_local_5) && ((_local_5.length > 0)))){
                    for each (_local_7 in _local_5) {
                        if (_local_6 != _local_4.isProcedureActive(_local_7)){
                            m_flag = false;
                            break;
                        };
                    };
                } else {
                    m_flag = true;
                };
            } else {
                m_flag = false;
            };
            return (m_flag);
        }

        public /*  ©init. */ function _SafeStr_93()
        {
        }


    }
}//package com.tencent.ai.core.condition.impl

// _SafeStr_93 = " ProcedureActiveCondition" (String#15506)


