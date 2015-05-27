// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.BaseMonsterController

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.actor.BaseActorController;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.MonsterEnum;
    import  ©init._SafeStr_788;

    public class BaseMonsterController extends BaseActorController 
    {

        public static var KEY_TIMES:int = 0;

        protected var m_monster:BaseMonster;
        protected var m_vkeyMapActionIDs:Dictionary;
        private var _cacheKeysDefine:Dictionary;
        private var _findKeys:Array;
        private var _cacheKeys:Dictionary;
        private var _isManual:Boolean;
        private var _manualKeysMap:Dictionary;

        public function BaseMonsterController(_arg_1:BaseMonster)
        {
            super(_arg_1);
            this.m_monster = _arg_1;
        }

        override protected function initThis():void
        {
            var _local_2:int;
            super.initThis();
            this.m_vkeyMapActionIDs = new Dictionary();
            this.m_vkeyMapActionIDs[VKeyDef.GO_UP] = BaseActionIDDef.WALK;
            this.m_vkeyMapActionIDs[VKeyDef.GO_DOWN] = BaseActionIDDef.WALK;
            this.m_vkeyMapActionIDs[VKeyDef.GO_LEFT] = BaseActionIDDef.WALK;
            this.m_vkeyMapActionIDs[VKeyDef.GO_RIGHT] = BaseActionIDDef.WALK;
            this.m_vkeyMapActionIDs[VKeyDef.GO_Y_UP] = BaseActionIDDef.WALK;
            this.m_vkeyMapActionIDs[VKeyDef.GO_Y_DOWN] = BaseActionIDDef.WALK;
            this.m_vkeyMapActionIDs[VKeyDef.HURT] = BaseActionIDDef.BEHURT;
            this.m_vkeyMapActionIDs[VKeyDef.DEAD] = BaseActionIDDef.DEAD;
            this.m_vkeyMapActionIDs[VKeyDef.FIGHT] = BaseActionIDDef.FIGHT;
            this.m_vkeyMapActionIDs[BaseActionIDDef.APPEAR] = BaseActionIDDef.APPEAR;
            var _local_1:int;
            while (_local_1 < MonsterEnum.ACTION_COUNT) {
                _local_2 = (MonsterEnum.ACTION_ID_START + _local_1);
                this.m_vkeyMapActionIDs[_local_2] = _local_2;
                _local_1++;
            };
            this._manualKeysMap = new Dictionary();
            this._manualKeysMap[VKeyDef.RUN_LEFT] = VKeyDef.GO_LEFT;
            this._manualKeysMap[VKeyDef.RUN_RIGHT] = VKeyDef.GO_RIGHT;
            this._manualKeysMap[VKeyDef.RUN_UP] = VKeyDef.GO_UP;
            this._manualKeysMap[VKeyDef.RUN_DOWN] = VKeyDef.GO_DOWN;
            this._cacheKeys = new Dictionary();
            this._findKeys = [[VKeyDef.GO_RIGHT, true, 0], [VKeyDef.GO_LEFT, true, 0], [VKeyDef.GO_DOWN, true, 0], [VKeyDef.GO_UP, true, 0]];
            this._cacheKeysDefine = new Dictionary();
            this._cacheKeysDefine[VKeyDef.GO_RIGHT] = this._findKeys[0];
            this._cacheKeysDefine[VKeyDef.GO_LEFT] = this._findKeys[1];
            this._cacheKeysDefine[VKeyDef.GO_DOWN] = this._findKeys[2];
            this._cacheKeysDefine[VKeyDef.GO_UP] = this._findKeys[3];
            this._cacheKeysDefine[VKeyDef.STOP_DOWN] = [VKeyDef.GO_DOWN, false, 0];
            this._cacheKeysDefine[VKeyDef.STOP_UP] = [VKeyDef.GO_UP, false, 0];
            this._cacheKeysDefine[VKeyDef.STOP_LEFT] = [VKeyDef.GO_LEFT, false, 0];
            this._cacheKeysDefine[VKeyDef.STOP_RIGHT] = [VKeyDef.GO_RIGHT, false, 0];
            this._isManual = false;
        }

        protected function cacheVKey(_arg_1:int):void
        {
            var _local_2:Array = this._cacheKeysDefine[_arg_1];
            if (_local_2 != null){
                var _local_4 = (KEY_TIMES + 1);
                KEY_TIMES = _local_4;
                this._cacheKeys[_local_2[0]] = _local_2[1];
                _local_2[2] = KEY_TIMES;
            };
        }

        protected function findAction():void
        {
            var _local_3:int;
            var _local_4:Array;
            var _local_5:int;
            var _local_6:int;
            var _local_1:int = -1;
            var _local_2:int = -1;
            if (this._isManual){
                _local_3 = 0;
                while (_local_3 < 2) {
                    _local_4 = this._findKeys[_local_3];
                    _local_5 = _local_4[0];
                    _local_6 = _local_4[2];
                    if (((this.isVKeyDown(_local_5)) && ((_local_6 > _local_2)))){
                        _local_1 = _local_5;
                        _local_2 = _local_6;
                    };
                    _local_3++;
                };
                if (_local_2 != -1){
                    this.m_monster.act(BaseActionIDDef.WALK, _local_1);
                };
                _local_6 = -1;
                _local_3 = 2;
                while (_local_3 < 4) {
                    _local_4 = this._findKeys[_local_3];
                    _local_5 = _local_4[0];
                    _local_6 = _local_4[2];
                    if (((this.isVKeyDown(_local_5)) && ((_local_6 > _local_2)))){
                        _local_1 = _local_5;
                        _local_2 = _local_6;
                    };
                    _local_3++;
                };
                if (_local_2 != -1){
                    this.m_monster.act(BaseActionIDDef.WALK, _local_1);
                };
            };
            if (_local_1 == -1){
                this.m_monster.act(BaseActionIDDef.IDLE, VKeyDef.EMPTY);
            };
        }

        override public function vKeyAct(_arg_1:int, _arg_2:Object=null):void
        {
            var _local_3:int;
            switch (_arg_1){
                case VKeyDef.EMPTY:
                case VKeyDef.STOP_LEFT:
                case VKeyDef.STOP_RIGHT:
                    this.findAction();
                    break;
                case VKeyDef.STOP_UP:
                case VKeyDef.STOP_DOWN:
                case VKeyDef.STOP_Y_UP:
                case VKeyDef.STOP_Y_DOWN:
                    if ((((m_currentAction == null)) || (!((m_currentAction.getActionID() == BaseActionIDDef.IDLE))))){
                        if (this._isManual){
                            this.findAction();
                        } else {
                            this.m_monster.act(BaseActionIDDef.IDLE, _arg_1);
                        };
                    };
                    break;
                default:
                    _local_3 = this.m_vkeyMapActionIDs[_arg_1];
                    if (_local_3 != 0){
                        this.m_monster.act(_local_3, _arg_1, _arg_2);
                    };
            };
            m_currentAction = this.m_monster.getCurrentAction();
        }

        override public function inputActionID(_arg_1:int):void
        {
            if (((m_locked) || (!(m_canAct)))){
                return;
            };
            if (_arg_1 != 0){
                if (m_currentAction != null){
                    m_currentAction.exec(_arg_1, _arg_1);
                } else {
                    this.vKeyAct(_arg_1, _arg_1);
                };
            };
        }

        override public function inputVKey(_arg_1:int):void
        {
            if (this._isManual){
                if (this._manualKeysMap[_arg_1]){
                    _arg_1 = this._manualKeysMap[_arg_1];
                };
                this.cacheVKey(_arg_1);
            };
            super.inputVKey(_arg_1);
        }

        override public function isVKeyDown(_arg_1:int):Boolean
        {
            return ((this._cacheKeys[_arg_1] == true));
        }

        override public function reset():void
        {
            if (this._isManual){
                this._cacheKeys = new Dictionary();
                this._isManual = false;
            };
            super.reset();
        }

        override public function manualControl(_arg_1:Boolean):void
        {
            this._isManual = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_788()
        {
        }


    }
}//package com.tencent.ai.core.monster

// _SafeStr_788 = " BaseMonsterController" (String#16085)


