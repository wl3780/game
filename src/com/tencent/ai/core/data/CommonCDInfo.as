// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.CommonCDInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.events.IEventDispatcher;
    import flash.events.EventDispatcher;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import mx.events.PropertyChangeEvent;
    import flash.events.Event;
    import  ©init._SafeStr_226;

    public class CommonCDInfo implements ISerialize, IEventDispatcher 
    {

        public var cdLimit:int;
        public var startTime:int;
        private var _283826790coolingTime:Number = 0;
        public var id:int;
        private var _bindingEventDispatcher:EventDispatcher;

        public function CommonCDInfo()
        {
            this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super();
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.cdLimit = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.cdLimit);
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

        public function addEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            this._bindingEventDispatcher.addEventListener(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function dispatchEvent(_arg_1:Event):Boolean
        {
            return (this._bindingEventDispatcher.dispatchEvent(_arg_1));
        }

        public function hasEventListener(_arg_1:String):Boolean
        {
            return (this._bindingEventDispatcher.hasEventListener(_arg_1));
        }

        public function removeEventListener(_arg_1:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            this._bindingEventDispatcher.removeEventListener(_arg_1, _arg_2, _arg_3);
        }

        public function willTrigger(_arg_1:String):Boolean
        {
            return (this._bindingEventDispatcher.willTrigger(_arg_1));
        }

        public /*  ©init. */ function _SafeStr_226()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_226 = " CommonCDInfo" (String#14615)


