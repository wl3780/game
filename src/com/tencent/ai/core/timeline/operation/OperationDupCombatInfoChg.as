// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationDupCombatInfoChg

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.protocol.PDupCombatInfoChgRsp;
    import com.tencent.ai.core.player.PlayerModel;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_1303;

    public class OperationDupCombatInfoChg extends BaseOperation 
    {

        protected var m_playerm:IPlayerManager;
        protected var m_rsp:PDupCombatInfoChgRsp;

        public function OperationDupCombatInfoChg(_arg_1:PDupCombatInfoChgRsp, _arg_2:IPlayerManager)
        {
            super(_arg_1.sync_no, _arg_1.iTakeEffectFrame);
            this.m_rsp = _arg_1;
            this.m_playerm = _arg_2;
        }

        override public function execute():void
        {
            var _local_3:PlayerModel;
            var _local_4:PlayerInfo;
            var _local_1:uint = this.m_rsp.iPlayerID.uin;
            var _local_2:BasePlayer = this.m_playerm.getPlayerByID(_local_1);
            if (_local_2 != null){
                _local_3 = _local_2.getPlayerModel();
                if (!_local_3.updateLevel(this.m_rsp.iUpgradeLv)){
                    this.m_rsp.iAttr.hp = _local_3.hp;
                    this.m_rsp.iAttr.mp = _local_3.mp;
                };
                _local_3.updateAttribute(this.m_rsp.iAttr, true);
            } else {
                _local_4 = this.m_playerm.getCachePlayerInfoByID(_local_1);
                if (_local_4 != null){
                    _local_4.updateAttributeInfo(this.m_rsp.iAttr);
                } else {
                    error((("[OperationDupCombatInfoChg] 找不到玩家[" + this.m_rsp.iPlayerID.uin) + "]"));
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1303()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1303 = " OperationDupCombatInfoChg" (String#16775)


