// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.BaseOperation

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.timeline.IOperation;
    import  ©init._SafeStr_1301;

    public class BaseOperation implements IOperation 
    {

        protected var m_syncID:int = -1;
        protected var m_executeFrame:int = 0;
        protected var m_dealFunc:Function = null;
        protected var m_target:Object = null;
        protected var m_args:Array = null;

        public function BaseOperation(_arg_1:int, _arg_2:int, _arg_3:Function=null, _arg_4:Object=null, _arg_5:Array=null)
        {
            this.m_dealFunc = _arg_3;
            this.m_executeFrame = _arg_2;
            this.m_syncID = _arg_1;
            this.m_target = _arg_4;
            this.m_args = _arg_5;
        }

        public function getSyncID():int
        {
            return (this.m_syncID);
        }

        public function getExecuteFrame():int
        {
            return (this.m_executeFrame);
        }

        public function execute():void
        {
            if (this.m_dealFunc != null){
                this.m_dealFunc.apply(this, this.m_args);
            };
        }

        public /*  ©init. */ function _SafeStr_1301()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1301 = " BaseOperation" (String#14576)


