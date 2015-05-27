// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.Attribute

package com.tencent.ai.core.actor.model
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.AttributeInfo;

    public class Attribute extends EventDispatcher2 
    {

        public static var SET_BIND_NAMES:Dictionary;

        private var _baseDataChangeEvent:ActorModelEvent;
        protected var m_hp:int;
        protected var m_maxhp:int;
        protected var m_mp:int;
        protected var m_maxmp:int;
        protected var m_angry_val:int;
        protected var m_maxAngry_val:int;
        protected var m_bindInfo:AttributeInfo;
        public var level:int;
        public var weight:int;
        public var walkV:int;
        public var runV:int;
        public var jumpV:int;
        public var stiff:int;
        public var firm:int;
        public var strength:int;
        public var intelligence:int;
        public var physicalpower:int;
        public var spirit:int;
        public var hit_rate:Number = 100;
        public var miss_rate:Number = 0;
        public var p_attack:int;
        public var p_defend:int;
        public var m_attack:int;
        public var m_defend:int;
        public var cri_rate:Number = 0;
        public var buffFixDmgRate:Number = 0;
        public var pDmgReduce:int;
        public var pFixDmg_rate:Number = 0;
        public var mDmgReduce:int;
        public var mFixDmg_rate:Number = 0;
        public var attack_v:int;
        public var hp_recovery:int;
        public var mp_recovery:int;
        public var vigourValue:int = 100;


        public function isHPFull():Boolean
        {
            return ((this.m_hp == this.m_maxhp));
        }

        public function isMPFull():Boolean
        {
            return ((this.m_mp == this.m_maxmp));
        }

        public function get hp():int
        {
            return (this.m_hp);
        }

        public function set hp(_arg_1:int):void
        {
            this.m_hp = (((_arg_1 >= 0)) ? _arg_1 : 0);
            if (this.m_maxhp != 0){
                this.m_hp = (((this.m_hp >= this.m_maxhp)) ? this.m_maxhp : this.m_hp);
            };
            if (this.m_bindInfo != null){
                this.m_bindInfo.hp = this.m_hp;
            };
        }

        public function get maxhp():int
        {
            return (this.m_maxhp);
        }

        public function set maxhp(_arg_1:int):void
        {
            this.m_maxhp = (((_arg_1 >= 0)) ? _arg_1 : 0);
            this.m_hp = (((this.m_hp >= this.m_maxhp)) ? (this.m_maxhp) : this.m_hp);
            if (this.m_bindInfo != null){
                this.m_bindInfo.maxhp = this.m_maxhp;
                this.m_bindInfo.hp = this.m_hp;
            };
        }

        public function get mp():int
        {
            return (this.m_mp);
        }

        public function set mp(_arg_1:int):void
        {
            this.m_mp = (((_arg_1 >= 0)) ? _arg_1 : 0);
            if (this.m_maxmp != 0){
                this.m_mp = (((this.m_mp > this.m_maxmp)) ? this.m_maxmp : this.m_mp);
            };
            if (this.m_bindInfo != null){
                this.m_bindInfo.mp = this.m_mp;
            };
        }

        public function get maxmp():int
        {
            return (this.m_maxmp);
        }

        public function set maxmp(_arg_1:int):void
        {
            this.m_maxmp = (((_arg_1 >= 0)) ? _arg_1 : 0);
            this.m_mp = (((this.m_mp > this.m_maxmp)) ? (this.m_maxmp) : this.m_mp);
            if (this.m_bindInfo != null){
                this.m_bindInfo.maxmp = this.m_maxmp;
                this.m_bindInfo.mp = this.m_mp;
            };
        }

        public function get angry_val():int
        {
            return (this.m_angry_val);
        }

        public function set angry_val(_arg_1:int):void
        {
            this.m_angry_val = (((_arg_1 >= 0)) ? _arg_1 : 0);
            this.m_angry_val = (((this.m_angry_val > this.m_maxAngry_val)) ? (this.m_maxAngry_val) : this.m_angry_val);
            if (this.m_bindInfo != null){
                this.m_bindInfo.angry_val = this.m_angry_val;
            };
        }

        public function get maxAngry_val():int
        {
            return (this.m_maxAngry_val);
        }

        public function copyValues(_arg_1:AttributeInfo):void
        {
            this.updateAttribute(_arg_1);
            this.angry_val = _arg_1.angry_val;
            this.m_bindInfo = _arg_1;
        }

        public function updateAttribute(_arg_1:AttributeInfo, _arg_2:Boolean=false):void
        {
            this.level = _arg_1.level;
            this.weight = _arg_1.weight;
            this.walkV = _arg_1.walkV;
            this.runV = _arg_1.runV;
            this.jumpV = _arg_1.jumpV;
            this.stiff = _arg_1.stiff;
            this.firm = _arg_1.firm;
            this.strength = _arg_1.strength;
            this.intelligence = _arg_1.intelligence;
            this.physicalpower = _arg_1.physicalpower;
            this.spirit = _arg_1.spirit;
            this.hit_rate = _arg_1.hit_rate;
            this.miss_rate = _arg_1.miss_rate;
            this.p_attack = _arg_1.p_attack;
            this.p_defend = _arg_1.p_defend;
            this.m_attack = _arg_1.m_attack;
            this.m_defend = _arg_1.m_defend;
            this.cri_rate = _arg_1.cri_rate;
            this.pDmgReduce = _arg_1.pDmgReduce;
            this.pFixDmg_rate = _arg_1.pFixDmg_rate;
            this.mDmgReduce = _arg_1.mDmgReduce;
            this.mFixDmg_rate = _arg_1.mFixDmg_rate;
            this.attack_v = _arg_1.attack_v;
            this.m_hp = _arg_1.hp;
            this.hp_recovery = _arg_1.hp_recovery;
            this.m_maxhp = _arg_1.maxhp;
            this.m_mp = _arg_1.mp;
            this.mp_recovery = _arg_1.mp_recovery;
            this.m_maxmp = _arg_1.maxmp;
            this.m_maxAngry_val = _arg_1.maxAngry_val;
            this.vigourValue = _arg_1.hungry;
            if (((_arg_2) && (!((this.m_bindInfo == null))))){
                this.m_bindInfo.updateAttributeInfo(_arg_1);
                if (this._baseDataChangeEvent == null){
                    this._baseDataChangeEvent = new ActorModelEvent(ActorModelEvent.ON_BASE_DATA_UPDATE, this);
                };
                dispatchEvent(this._baseDataChangeEvent);
            };
        }

        public function getBindInfo():AttributeInfo
        {
            return (this.m_bindInfo);
        }

        public function setValueByName(_arg_1:String, _arg_2:Object):void
        {
            this[_arg_1] = _arg_2;
            if (((SET_BIND_NAMES[_arg_1]) && (!((this.m_bindInfo == null))))){
                this.m_bindInfo[_arg_1] = _arg_2;
            };
        }

        public function getValueByName(_arg_1:String):Object
        {
            return (this[_arg_1]);
        }

        public function revert():void
        {
            this.copyValues(this.m_bindInfo);
        }

        public function reset():void
        {
            this.level = 0;
            this.weight = 0;
            this.walkV = 0;
            this.runV = 0;
            this.jumpV = 0;
            this.stiff = 0;
            this.firm = 0;
            this.strength = 0;
            this.intelligence = 0;
            this.physicalpower = 0;
            this.spirit = 0;
            this.hit_rate = 0;
            this.miss_rate = 0;
            this.p_attack = 0;
            this.p_defend = 0;
            this.m_attack = 0;
            this.m_defend = 0;
            this.cri_rate = 0;
            this.buffFixDmgRate = 0;
            this.pDmgReduce = 0;
            this.pFixDmg_rate = 0;
            this.mDmgReduce = 0;
            this.mFixDmg_rate = 0;
            this.attack_v = 0;
            this.m_hp = 0;
            this.hp_recovery = 0;
            this.m_maxhp = 0;
            this.m_mp = 0;
            this.mp_recovery = 0;
            this.m_maxmp = 0;
            this.m_angry_val = 0;
            this.m_maxAngry_val = 0;
            this.vigourValue = 100;
            this.m_bindInfo = null;
        }


    }
}//package com.tencent.ai.core.actor.model

