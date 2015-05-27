// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationDupDropItem

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.protocol.PDupMonsterDeadReq;
    import  ©init._SafeStr_1304;

    public class OperationDupDropItem extends BaseOperation 
    {

        protected var m_pDupItem:PDupMonsterDeadReq;

        public function OperationDupDropItem(_arg_1:PDupMonsterDeadReq, _arg_2:Function)
        {
            super(_arg_1.sync_no, _arg_1.take_effect_frame, _arg_2);
            this.m_pDupItem = _arg_1;
        }

        override public function execute():void
        {
            if (m_dealFunc != null){
                m_dealFunc(this.m_pDupItem.drops);
            };
        }

        public /*  ©init. */ function _SafeStr_1304()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1304 = " OperationDupDropItem" (String#17393)


