// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationEquipChange

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.protocol.PDupEquipChangeResult;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_1305;

    public class OperationEquipChange extends BaseOperation 
    {

        protected var m_playerm:IPlayerManager;
        protected var m_equipChangeRes:PDupEquipChangeResult;

        public function OperationEquipChange(_arg_1:PDupEquipChangeResult, _arg_2:IPlayerManager)
        {
            super(_arg_1.sync_no, _arg_1.takeEffectFrame);
            this.m_equipChangeRes = _arg_1;
            this.m_playerm = _arg_2;
        }

        override public function execute():void
        {
            var _local_1:BasePlayer = this.m_playerm.getPlayerByID(this.m_equipChangeRes.playerID.uin);
            if (_local_1 != null){
                _local_1.getPlayerModel().updateAvatar(this.m_equipChangeRes.equipPos, this.m_equipChangeRes.epuipItem);
            } else {
                error("[OperationEquipChange] 找不到换装角色的数据模型", this.m_equipChangeRes.playerID.uin);
            };
        }

        public /*  ©init. */ function _SafeStr_1305()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1305 = " OperationEquipChange" (String#16091)


