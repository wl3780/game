// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.InteractItemController

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.actor.IElementController;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.interact.impl.InteractItemModel;
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.ActionInfo;
    import  ©init._SafeStr_582;

    public class InteractItemController implements IElementController 
    {

        protected var cacheKeys:Dictionary;
        protected var cacheKeysDefine:Dictionary;
        protected var findKeys:Array;
        protected var lastArrowKey:int;
        protected var item:BaseInteractItem;
        protected var model:InteractItemModel;
        protected var currentAction:IElementAction;
        protected var defaultActionID:int;
        private var __locked:Boolean;

        public function InteractItemController(_arg_1:BaseInteractItem)
        {
            this.item = _arg_1;
            this.model = (_arg_1.getModel() as InteractItemModel);
            this.initThis();
        }

        protected function initThis():void
        {
            this.cacheKeys = new Dictionary();
            this.defaultActionID = BaseActionIDDef.IDLE;
            this.findKeys = [VKeyDef.GO_RIGHT, VKeyDef.GO_LEFT, VKeyDef.GO_DOWN, VKeyDef.GO_UP];
            this.cacheKeysDefine = new Dictionary();
            this.cacheKeysDefine[VKeyDef.GO_DOWN] = [VKeyDef.GO_DOWN, true];
            this.cacheKeysDefine[VKeyDef.GO_UP] = [VKeyDef.GO_UP, true];
            this.cacheKeysDefine[VKeyDef.GO_LEFT] = [VKeyDef.GO_LEFT, true];
            this.cacheKeysDefine[VKeyDef.GO_RIGHT] = [VKeyDef.GO_RIGHT, true];
            this.cacheKeysDefine[VKeyDef.RUN_LEFT] = [VKeyDef.GO_LEFT, true];
            this.cacheKeysDefine[VKeyDef.RUN_RIGHT] = [VKeyDef.GO_RIGHT, true];
            this.cacheKeysDefine[VKeyDef.STOP_DOWN] = [VKeyDef.GO_DOWN, false];
            this.cacheKeysDefine[VKeyDef.STOP_UP] = [VKeyDef.GO_UP, false];
            this.cacheKeysDefine[VKeyDef.STOP_LEFT] = [VKeyDef.GO_LEFT, false];
            this.cacheKeysDefine[VKeyDef.STOP_RIGHT] = [VKeyDef.GO_RIGHT, false];
            this.cacheKeysDefine[VKeyDef.FIGHT] = [VKeyDef.FIGHT, true];
            this.cacheKeysDefine[VKeyDef.JUMP] = [VKeyDef.JUMP, true];
            this.cacheKeysDefine[VKeyDef.Z_DOWN] = [VKeyDef.Z_DOWN, true];
            this.cacheKeysDefine[VKeyDef.SPACE_DOWN] = [VKeyDef.SPACE_DOWN, true];
            this.cacheKeysDefine[VKeyDef.FIGHT_UP] = [VKeyDef.FIGHT, false];
            this.cacheKeysDefine[VKeyDef.JUMP_UP] = [VKeyDef.JUMP, false];
            this.cacheKeysDefine[VKeyDef.Z_UP] = [VKeyDef.Z_DOWN, false];
            this.cacheKeysDefine[VKeyDef.SPACE_UP] = [VKeyDef.SPACE_DOWN, false];
            this.__locked = false;
        }

        protected function cacheVKey(_arg_1:int):void
        {
            var _local_2:Array = this.cacheKeysDefine[_arg_1];
            if (_local_2 != null){
                this.cacheKeys[_local_2[0]] = _local_2[1];
            };
        }

        protected function findAction():void
        {
            var _local_2:int;
            var _local_1:int;
            while (_local_1 < this.findKeys.length) {
                _local_2 = this.findKeys[_local_1];
                if (this.isVKeyDown(_local_2)){
                    this.item.act(BaseActionIDDef.WALK, _local_2);
                    return;
                };
                _local_1++;
            };
            this.defaultActionID = this.item.getDefaultActionID();
            this.item.act(this.defaultActionID, VKeyDef.EMPTY);
        }

        protected function shakePlayer(_arg_1:int):void
        {
            var _local_2:int = this.model.actionID;
            if ((((((_local_2 == BaseActionIDDef.IDLE)) || ((_local_2 == BaseActionIDDef.WALK)))) || ((_local_2 == BaseActionIDDef.RUN)))){
                this.item.act(BaseActionIDDef.SHAKE, _arg_1);
            };
        }

        public function actDeadAction(... _args):void
        {
            if ((((this.currentAction == null)) || (this.currentAction.switchToDead()))){
                this.item.act(BaseActionIDDef.DEAD, VKeyDef.DEAD);
                this.currentAction = this.item.getCurrentAction();
            };
        }

        public function setCanAct(_arg_1:Boolean):void
        {
        }

        public function actHurtAction(_arg_1:int, _arg_2:int, _arg_3:AttackInfo):void
        {
            this.item.act(_arg_1, _arg_2, _arg_3);
            this.currentAction = this.item.getCurrentAction();
        }

        public function convertVkey(_arg_1:int):int
        {
            return (_arg_1);
        }

        public function vKeyAct(_arg_1:int, _arg_2:Object=null):void
        {
            var _local_3:ActionInfo;
            var _local_4:int;
            switch (_arg_1){
                case VKeyDef.EMPTY:
                case VKeyDef.STOP_LEFT:
                case VKeyDef.STOP_RIGHT:
                case VKeyDef.DEAD:
                case VKeyDef.STOP_UP:
                case VKeyDef.STOP_DOWN:
                    this.findAction();
                    break;
                default:
                    _local_3 = this.model.switchToAction(_arg_1);
                    if (_local_3 != null){
                        _local_4 = _local_3.id;
                        this.item.act(_local_4, _arg_1, _arg_2);
                    };
            };
            this.currentAction = this.item.getCurrentAction();
        }

        public function inputVKey(_arg_1:int):void
        {
            this.cacheVKey(_arg_1);
            if (this.__locked){
                return;
            };
            if (this.currentAction != null){
                this.currentAction.exec(_arg_1);
            } else {
                this.vKeyAct(_arg_1);
            };
        }

        public function inputActionID(_arg_1:int):void
        {
            throw (new Error("[BasePlayerController] 角色控制器不支持ActionID的输入!"));
        }

        public function accept(_arg_1:int):Boolean
        {
            return (false);
        }

        public function set isLock(_arg_1:Boolean):void
        {
            this.__locked = _arg_1;
        }

        public function get isLock():Boolean
        {
            return (this.__locked);
        }

        public function isVKeyDown(_arg_1:int):Boolean
        {
            return ((this.cacheKeys[_arg_1] == true));
        }

        public function reset():void
        {
            this.__locked = false;
            this.cacheKeys = new Dictionary();
            if (this.currentAction != null){
                this.currentAction.stop();
            };
            this.currentAction = null;
        }

        public /*  ©init. */ function _SafeStr_582()
        {
        }


    }
}//package com.tencent.ai.core.interact

// _SafeStr_582 = " InteractItemController" (String#16220)


