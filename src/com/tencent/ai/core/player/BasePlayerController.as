// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.BasePlayerController

package com.tencent.ai.core.player
{
    import com.tencent.ai.core.actor.BaseActorController;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.enum.ActionType;
    import  ©init._SafeStr_853;

    public class BasePlayerController extends BaseActorController 
    {

        public static var KEY_TIMES:int = 0;

        protected var m_cacheKeys:Dictionary;
        protected var m_cacheKeysDefine:Dictionary;
        protected var m_findKeys:Array;
        protected var m_lastArrowKey:int;
        protected var m_player:BasePlayer;
        protected var m_model:PlayerModel;
        protected var m_defaultActionID:int;
        private var _shakeArg:ShakeScriptArg;

        public function BasePlayerController(_arg_1:BasePlayer)
        {
            super(_arg_1);
            this.m_player = _arg_1;
            this.m_model = _arg_1.getPlayerModel();
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_cacheKeys = new Dictionary();
            this.m_defaultActionID = BaseActionIDDef.IDLE;
            this.m_findKeys = [[VKeyDef.GO_RIGHT, true, 0], [VKeyDef.GO_LEFT, true, 0], [VKeyDef.GO_DOWN, true, 0], [VKeyDef.GO_UP, true, 0]];
            this.m_cacheKeysDefine = new Dictionary();
            this.m_cacheKeysDefine[VKeyDef.GO_RIGHT] = this.m_findKeys[0];
            this.m_cacheKeysDefine[VKeyDef.GO_LEFT] = this.m_findKeys[1];
            this.m_cacheKeysDefine[VKeyDef.GO_DOWN] = this.m_findKeys[2];
            this.m_cacheKeysDefine[VKeyDef.RUN_DOWN] = this.m_findKeys[2];
            this.m_cacheKeysDefine[VKeyDef.GO_UP] = this.m_findKeys[3];
            this.m_cacheKeysDefine[VKeyDef.RUN_UP] = this.m_findKeys[3];
            this.m_cacheKeysDefine[VKeyDef.RUN_LEFT] = [VKeyDef.GO_LEFT, true, 0];
            this.m_cacheKeysDefine[VKeyDef.RUN_RIGHT] = [VKeyDef.GO_RIGHT, true, 0];
            this.m_cacheKeysDefine[VKeyDef.STOP_DOWN] = [VKeyDef.GO_DOWN, false, 0];
            this.m_cacheKeysDefine[VKeyDef.STOP_UP] = [VKeyDef.GO_UP, false, 0];
            this.m_cacheKeysDefine[VKeyDef.STOP_LEFT] = [VKeyDef.GO_LEFT, false, 0];
            this.m_cacheKeysDefine[VKeyDef.STOP_RIGHT] = [VKeyDef.GO_RIGHT, false, 0];
            this.m_cacheKeysDefine[VKeyDef.FIGHT] = [VKeyDef.FIGHT, true, 0];
            this.m_cacheKeysDefine[VKeyDef.JUMP] = [VKeyDef.JUMP, true, 0];
            this.m_cacheKeysDefine[VKeyDef.Z_DOWN] = [VKeyDef.Z_DOWN, true, 0];
            this.m_cacheKeysDefine[VKeyDef.SPACE_DOWN] = [VKeyDef.SPACE_DOWN, true, 0];
            this.m_cacheKeysDefine[VKeyDef.FIGHT_UP] = [VKeyDef.FIGHT, false, 0];
            this.m_cacheKeysDefine[VKeyDef.JUMP_UP] = [VKeyDef.JUMP, false, 0];
            this.m_cacheKeysDefine[VKeyDef.Z_UP] = [VKeyDef.Z_DOWN, false, 0];
            this.m_cacheKeysDefine[VKeyDef.SPACE_UP] = [VKeyDef.SPACE_DOWN, false, 0];
            this._shakeArg = new ShakeScriptArg();
            this._shakeArg.shakeDir = 1;
            this._shakeArg.shakeR = 2;
            this._shakeArg.shakeTimes = 13;
        }

        protected function cacheVKey(_arg_1:int):void
        {
            _arg_1 = VKeyDef.TO_SIMPLE_VKEY(_arg_1, true, this.m_model.getVKeyByHotKey);
            var _local_2:Array = this.m_cacheKeysDefine[_arg_1];
            if (_local_2 != null){
                var _local_4 = (KEY_TIMES + 1);
                KEY_TIMES = _local_4;
                this.m_cacheKeys[_local_2[0]] = _local_2[1];
                _local_2[2] = KEY_TIMES;
            };
        }

        protected function findAction():void
        {
            var _local_4:Array;
            var _local_5:int;
            var _local_6:int;
            var _local_1:int = -1;
            var _local_2:int = -1;
            var _local_3:int;
            while (_local_3 < 2) {
                _local_4 = this.m_findKeys[_local_3];
                _local_5 = _local_4[0];
                _local_6 = _local_4[2];
                if (((this.isVKeyDown(_local_5)) && ((_local_6 > _local_2)))){
                    _local_1 = _local_5;
                    _local_2 = _local_6;
                };
                _local_3++;
            };
            if (_local_2 != -1){
                this.m_player.act(BaseActionIDDef.WALK, _local_1);
            };
            _local_6 = -1;
            _local_3 = 2;
            while (_local_3 < 4) {
                _local_4 = this.m_findKeys[_local_3];
                _local_5 = _local_4[0];
                _local_6 = _local_4[2];
                if (((this.isVKeyDown(_local_5)) && ((_local_6 > _local_2)))){
                    _local_1 = _local_5;
                    _local_2 = _local_6;
                };
                _local_3++;
            };
            if (_local_2 != -1){
                this.m_player.act(BaseActionIDDef.WALK, _local_1);
            };
            if (_local_1 == -1){
                this.m_defaultActionID = this.m_player.getDefaultActionID();
                this.m_player.act(this.m_defaultActionID, VKeyDef.EMPTY);
            };
        }

        protected function shakePlayer(_arg_1:int):void
        {
            this.m_player.onScript(ScriptCmdDef.SC_TARGET_SHAKE, this._shakeArg);
            var _local_2:int = SoundDef.PLAYER_SHAKE_SOUND_ID;
            if (_local_2 != 0){
                AICore.sound.play(_local_2, -1, 0, 100, 0, this.m_player);
            };
        }

        override public function vKeyAct(_arg_1:int, _arg_2:Object=null):void
        {
            var _local_3:ActionInfo;
            var _local_4:int;
            switch (_arg_1){
                case VKeyDef.EMPTY:
                case VKeyDef.STOP_LEFT:
                case VKeyDef.STOP_RIGHT:
                case VKeyDef.STOP_UP:
                case VKeyDef.STOP_DOWN:
                    this.findAction();
                    break;
                case VKeyDef.DEAD:
                    this.m_player.act(BaseActionIDDef.DEAD, VKeyDef.DEAD);
                    break;
                default:
                    _local_3 = this.m_model.getActionInfoByVKey(_arg_1);
                    if (_local_3 != null){
                        _local_4 = _local_3.id;
                        if (_local_3.actionType == ActionType.ATTACK){
                            if (this.m_model.act(_local_4, 0, _arg_1)){
                                this.m_player.act(_local_4, this.m_model.getVKeyByHotKey(_arg_1), (((_arg_2)!=null) ? _arg_2 : _arg_1));
                            } else {
                                this.shakePlayer(_arg_1);
                                _local_3 = null;
                            };
                        } else {
                            this.m_player.act(_local_4, _arg_1, _arg_2);
                        };
                    };
                    if (_local_3 == null){
                        this.m_player.execCancelFrameAct();
                    };
            };
            m_currentAction = this.m_player.getCurrentAction();
        }

        override public function inputVKey(_arg_1:int):void
        {
            this.cacheVKey(_arg_1);
            super.inputVKey(_arg_1);
        }

        override public function isVKeyDown(_arg_1:int):Boolean
        {
            return ((this.m_cacheKeys[_arg_1] == true));
        }

        override public function convertVkey(_arg_1:int):int
        {
            return (this.m_model.getVKeyByHotKey(_arg_1));
        }

        override public function reset():void
        {
            this.m_cacheKeys = new Dictionary();
            super.reset();
        }

        override public function inputActionID(_arg_1:int):void
        {
            var _local_2:ActionInfo = this.m_model.getActionInfo(_arg_1);
            if (((((_local_2) && (_local_2.vKeyInfos))) && ((_local_2.vKeyInfos.length > 0)))){
                this.inputVKey(_local_2.vKeyInfos[0].value);
            };
        }

        public /*  ©init. */ function _SafeStr_853()
        {
        }


    }
}//package com.tencent.ai.core.player

// _SafeStr_853 = " BasePlayerController" (String#16820)


