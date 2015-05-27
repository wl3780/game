// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.pet.PetModel

package com.tencent.ai.core.pet
{
    import com.tencent.ai.core.monster.MonsterModel;
    import com.tencent.ai.core.events.PetModelEvent;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.PetShowInfo;
    import com.tencent.ai.core.data.AttributeInfo;
    import  ©init._SafeStr_829;

    public class PetModel extends MonsterModel 
    {

        private var _updateShowInfoEvent:PetModelEvent;
        private var _hpChangeEvent:ActorModelEvent;
        private var _vigourChangeEvent:ActorModelEvent;


        override protected function initThis():void
        {
            super.initThis();
            type = ElementType.MT_PET;
            this._updateShowInfoEvent = new PetModelEvent(PetModelEvent.ON_UPDATE_SHOWINFO);
            this._hpChangeEvent = new ActorModelEvent(ActorModelEvent.ON_HP_CHANGE, this);
            this._vigourChangeEvent = new ActorModelEvent(ActorModelEvent.ON_VIGOUR_CHANGE, this);
        }

        override public function updateHP(_arg_1:int):void
        {
            super.updateHP(_arg_1);
            this._hpChangeEvent.data = _arg_1;
            dispatchEvent(this._hpChangeEvent);
        }

        public function get nickName():String
        {
            return (PetInfo(m_bindInfo).nickname);
        }

        public function set nickName(_arg_1:String):void
        {
            PetInfo(m_bindInfo).nickname = _arg_1;
        }

        public function updateShowInfo(_arg_1:PetShowInfo):void
        {
            this._updateShowInfoEvent.data = "";
            if (this.level != _arg_1.level){
                this.level = _arg_1.level;
                this._updateShowInfoEvent.data = "level";
            };
            this.nickName = _arg_1.nickname;
            PetInfo(m_bindInfo).level = level;
            dispatchEvent(this._updateShowInfoEvent);
        }

        public function updateHungryValue(_arg_1:int):void
        {
            if (this.vigourValue != _arg_1){
                this.vigourValue = _arg_1;
                dispatchEvent(this._vigourChangeEvent);
            };
        }

        public function updateLevel(_arg_1:int):Boolean
        {
            if (this.level != _arg_1){
                this.level = _arg_1;
                if (m_bindInfo != null){
                    m_bindInfo.level = _arg_1;
                };
                this._updateShowInfoEvent.data = "level";
                dispatchEvent(this._updateShowInfoEvent);
                return (true);
            };
            return (false);
        }

        override public function updateAttribute(_arg_1:AttributeInfo, _arg_2:Boolean=false):void
        {
            super.updateAttribute(_arg_1, _arg_2);
            var _local_3:PetInfo = (m_bindInfo as PetInfo);
            var _local_4:PetInfo = (_arg_1 as PetInfo);
            if (((!((_local_3 == null))) && (!((_local_4 == null))))){
                _local_3.extraState = _local_4.extraState;
            };
        }

        public /*  ©init. */ function _SafeStr_829()
        {
        }


    }
}//package com.tencent.ai.core.pet

// _SafeStr_829 = " PetModel" (String#16796)


