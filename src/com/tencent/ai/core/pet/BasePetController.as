// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.BasePetController

package com.tencent.ai.core.pet
{
    import com.tencent.ai.core.actor.BaseActorController;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.MonsterEnum;
    import  ©init._SafeStr_828;

    public class BasePetController extends BaseActorController 
    {

        protected var m_pet:BasePet;
        protected var m_vkeyMapActionIDs:Dictionary;

        public function BasePetController(_arg_1:BasePet)
        {
            super(_arg_1);
            this.m_pet = _arg_1;
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
        }

        protected function findAction():void
        {
            this.m_pet.act(BaseActionIDDef.IDLE, VKeyDef.EMPTY);
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
                        this.m_pet.act(BaseActionIDDef.IDLE, _arg_1);
                    };
                    break;
                default:
                    _local_3 = this.m_vkeyMapActionIDs[_arg_1];
                    if (_local_3 != 0){
                        this.m_pet.act(_local_3, _arg_1, _arg_2);
                    };
            };
            m_currentAction = this.m_pet.getCurrentAction();
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

        public /*  ©init. */ function _SafeStr_828()
        {
        }


    }
}//package com.tencent.ai.core.pet

// _SafeStr_828 = " BasePetController" (String#13823)


