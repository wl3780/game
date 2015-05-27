// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ItemInfo

package com.tencent.ai.core.data
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.events.ItemEvent;
    import mx.events.PropertyChangeEvent;
    import  ©init._SafeStr_264;

    public class ItemInfo extends EventDispatcher 
    {

        public var serialID:uint;
        private var _id:int;
        public var gettime:uint;
        public var expiryTime:uint;
        private var _num:int;
        private var _slot:uint;
        private var _283826790coolingTime:Number = 0;
        public var startTime:int = 0;
        private var _1959784951invalid:Boolean = false;
        private var _available:Boolean = true;
        private var _useable:Boolean = true;
        private var _615125251isExpiry:Boolean = false;
        private var _100473878isNew:Boolean = false;
        public var staticInfo:ItemStaticInfo;
        private var _1059418815limitByEnvironment:Boolean;


        override public function toString():String
        {
            return ((((((("{id:" + this.id) + ",sid:") + this.serialID) + ",slot:") + this.slot) + "}"));
        }

        public function copy(_arg_1:ItemInfo):void
        {
            if (((!((_arg_1.id == this.id))) || (!((_arg_1.serialID == this.serialID))))){
                throw (Error(((("[ItemInfo][Devin]>>>copy:this" + this) + ", target") + _arg_1)));
            };
            this.gettime = _arg_1.gettime;
            this.expiryTime = _arg_1.expiryTime;
            this.num = _arg_1.num;
            this.slot = _arg_1.slot;
            this.coolingTime = _arg_1.coolingTime;
        }

        public function clone():ItemInfo
        {
            var _local_1:ItemInfo = new (this["constructor"])();
            _local_1.id = this.id;
            _local_1.serialID = this.serialID;
            _local_1.gettime = this.gettime;
            _local_1.expiryTime = this.expiryTime;
            _local_1.num = this.num;
            _local_1.slot = this.slot;
            _local_1.coolingTime = this.coolingTime;
            return (_local_1);
        }

        public function get id():int
        {
            return (this._id);
        }

        public function set id(_arg_1:int):void
        {
            this._id = _arg_1;
        }

        [Bindable("itemUseableChange")]
        public function get useable():Boolean
        {
            return (this._useable);
        }

        public function set useable(_arg_1:Boolean):void
        {
            if (this._useable == _arg_1){
                return;
            };
            this._useable = _arg_1;
            if (hasEventListener(ItemEvent.ITEM_USEABLE_CHANGE)){
                dispatchEvent(new ItemEvent(ItemEvent.ITEM_USEABLE_CHANGE));
            };
        }

        [Bindable("itemNumChange")]
        public function get num():int
        {
            return (this._num);
        }

        public function set num(_arg_1:int):void
        {
            if (this._num == _arg_1){
                return;
            };
            this._num = _arg_1;
            if (hasEventListener(ItemEvent.ITEM_NUM_CHANGE)){
                dispatchEvent(new ItemEvent(ItemEvent.ITEM_NUM_CHANGE));
            };
        }

        [Bindable("itemAvailableChange")]
        public function get available():Boolean
        {
            return (this._available);
        }

        public function set available(_arg_1:Boolean):void
        {
            if (this._available == _arg_1){
                return;
            };
            this._available = _arg_1;
            if (hasEventListener(ItemEvent.ITEM_AVAILABLE_CHANGE)){
                dispatchEvent(new ItemEvent(ItemEvent.ITEM_AVAILABLE_CHANGE));
            };
        }

        [Bindable("itemSlotChange")]
        public function get slot():uint
        {
            return (this._slot);
        }

        public function set slot(_arg_1:uint):void
        {
            if (this._slot == _arg_1){
                return;
            };
            this._slot = _arg_1;
            if (hasEventListener(ItemEvent.ITEM_SLOT_CHANGE)){
                dispatchEvent(new ItemEvent(ItemEvent.ITEM_SLOT_CHANGE));
            };
        }

        [Bindable(event="propertyChange")]
        public function get coolingTime():Number
        {
            return (this._283826790coolingTime);
        }

        public function set coolingTime(_arg_1:Number):void
        {
            var _local_2:Object = this._283826790coolingTime;
            if (_local_2 !== _arg_1){
                this._283826790coolingTime = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "coolingTime", _local_2, _arg_1));
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get invalid():Boolean
        {
            return (this._1959784951invalid);
        }

        public function set invalid(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1959784951invalid;
            if (_local_2 !== _arg_1){
                this._1959784951invalid = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "invalid", _local_2, _arg_1));
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get isExpiry():Boolean
        {
            return (this._615125251isExpiry);
        }

        public function set isExpiry(_arg_1:Boolean):void
        {
            var _local_2:Object = this._615125251isExpiry;
            if (_local_2 !== _arg_1){
                this._615125251isExpiry = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isExpiry", _local_2, _arg_1));
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get isNew():Boolean
        {
            return (this._100473878isNew);
        }

        public function set isNew(_arg_1:Boolean):void
        {
            var _local_2:Object = this._100473878isNew;
            if (_local_2 !== _arg_1){
                this._100473878isNew = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isNew", _local_2, _arg_1));
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get limitByEnvironment():Boolean
        {
            return (this._1059418815limitByEnvironment);
        }

        public function set limitByEnvironment(_arg_1:Boolean):void
        {
            var _local_2:Object = this._1059418815limitByEnvironment;
            if (_local_2 !== _arg_1){
                this._1059418815limitByEnvironment = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "limitByEnvironment", _local_2, _arg_1));
                };
            };
        }

        public /*  ©init. */ function _SafeStr_264()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_264 = " ItemInfo" (String#13907)


