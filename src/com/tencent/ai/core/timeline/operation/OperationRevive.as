// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationRevive

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.enum.CommonValueDef;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1310;

    public class OperationRevive extends BaseOperation 
    {

        private static var _SSM:ISpecialStatusManager;

        private var _playerMgr:IPlayerManager;
        private var _playerInfo:PlayerInfo;
        private var _result:int;

        public function OperationRevive(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:PlayerInfo, _arg_5:IPlayerManager)
        {
            super(_arg_2, _arg_3);
            this._playerInfo = _arg_4;
            this._playerMgr = _arg_5;
        }

        override public function execute():void
        {
            var _local_1:BasePlayer;
            var _local_2:int;
            if (this._result == 0){
                if (!this._playerInfo){
                    return;
                };
                _local_1 = this._playerMgr.getPlayerByID(this._playerInfo.playerID.uin);
                if (_local_1 != null){
                    _local_1.revive();
                    _local_2 = CommonValueDef.SS_ID_REVIVE_PROTECTED;
                    if (_local_2 != 0){
                        if (_SSM == null){
                            _SSM = AICore.combatSystem.getSpecialStatusManager();
                        };
                        _SSM.applyStatus(_local_1, _local_2);
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1310()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1310 = " OperationRevive" (String#15842)


