// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationPlayerQuit

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.data.PlayerID;
    import  ©init._SafeStr_1308;

    public class OperationPlayerQuit extends BaseOperation 
    {

        private var _playerMgr:IPlayerManager;
        private var _playerID:PlayerID;

        public function OperationPlayerQuit(_arg_1:int, _arg_2:int, _arg_3:PlayerID, _arg_4:IPlayerManager)
        {
            super(_arg_1, _arg_2);
            this._playerID = _arg_3;
            this._playerMgr = _arg_4;
        }

        override public function execute():void
        {
            this._playerMgr.removePlayer(this._playerID.uin);
            this._playerMgr.removeCachePlayerInfo(this._playerID.uin);
        }

        public /*  ©init. */ function _SafeStr_1308()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1308 = " OperationPlayerQuit" (String#15110)


