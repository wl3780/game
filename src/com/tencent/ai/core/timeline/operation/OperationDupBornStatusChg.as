// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationDupBornStatusChg

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.protocol.PDupBornStatusChgRsp;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_1302;

    public class OperationDupBornStatusChg extends BaseOperation 
    {

        protected var m_rsp:PDupBornStatusChgRsp;
        protected var m_playerm:IPlayerManager;

        public function OperationDupBornStatusChg(_arg_1:PDupBornStatusChgRsp, _arg_2:IPlayerManager)
        {
            super(_arg_1.sync_no, _arg_1.iTakeEffectFrame);
            this.m_rsp = _arg_1;
            this.m_playerm = _arg_2;
        }

        override public function execute():void
        {
            var _local_1:BasePlayer = this.m_playerm.getPlayerByID(this.m_rsp.iPlayerID.uin);
            if (_local_1 != null){
                _local_1.updateBornStatus(this.m_rsp.iSSModels);
            } else {
                error((("[OperationDupCombatInfoChg] 找不到玩家[" + this.m_rsp.iPlayerID.uin) + "]"));
            };
        }

        public /*  ©init. */ function _SafeStr_1302()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1302 = " OperationDupBornStatusChg" (String#16235)


