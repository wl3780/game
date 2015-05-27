// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.impl.FollowPetModel

package com.tencent.ai.core.pet.impl
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.pet.IFollowPetModel;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.pet.PetModel;
    import  ©init._SafeStr_822;

    public class FollowPetModel extends EventDispatcher2 implements IFollowPetModel 
    {

        private var _petInfo:PetInfo;
        private var _dataUpdateEvent:ActorModelEvent;
        private var _currentPetModel:PetModel;
        private var _dhp:int;

        public function FollowPetModel()
        {
            this._dataUpdateEvent = new ActorModelEvent(ActorModelEvent.ON_BASE_DATA_UPDATE);
        }

        private function onCurrentModelHpChange(_arg_1:ActorModelEvent):void
        {
            this._dhp = int(_arg_1.data);
            this.updateEvent();
        }

        public function bindModel(_arg_1:PetModel):void
        {
            this._currentPetModel = _arg_1;
            this._currentPetModel.addEventListener(ActorModelEvent.ON_HP_CHANGE, this.onCurrentModelHpChange);
        }

        public function unbindModel():void
        {
            if (this._currentPetModel != null){
                this._currentPetModel.removeEventListener(ActorModelEvent.ON_HP_CHANGE, this.onCurrentModelHpChange);
                this._currentPetModel = null;
            };
        }

        public function getBindModel():PetModel
        {
            return (this._currentPetModel);
        }

        public function setPetInfo(_arg_1:PetInfo):void
        {
            if (this._petInfo != _arg_1){
                this._petInfo = _arg_1;
                if (this._petInfo != null){
                    this.updateEvent();
                };
            };
        }

        public function getDHP():int
        {
            return (this._dhp);
        }

        public function setDHP(_arg_1:int):void
        {
            this._dhp = _arg_1;
        }

        public function getPetInfo():PetInfo
        {
            return (this._petInfo);
        }

        public function getIsDead():Boolean
        {
            return (((!((this._petInfo == null))) && ((this._petInfo.hp == 0))));
        }

        public function updateEvent():void
        {
            dispatchEvent(this._dataUpdateEvent);
        }

        public /*  ©init. */ function _SafeStr_822()
        {
        }


    }
}//package com.tencent.ai.core.pet.impl

// _SafeStr_822 = " FollowPetModel" (String#14792)


