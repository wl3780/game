// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.SSModel

package com.tencent.ai.core.status
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.data.SpecialStatusInfo;
    import com.tencent.ai.core.events.SSModelEvent;
    import  ©init._SafeStr_1292;

    public class SSModel extends EventDispatcher2 
    {

        public var index:int = 0;
        public var ssID:int = 0;
        public var currDuration:int = 0;
        public var duration:int = 0;
        public var currentTimes:int = 0;
        public var statusInfo:SpecialStatusInfo;
        public var isBorn:Boolean = false;
        public var durSecond:int = 0;
        private var _ssEvent:SSModelEvent;
        private var _fireEvent:Boolean;


        public function setStatusInfo(_arg_1:SpecialStatusInfo):void
        {
            this.statusInfo = _arg_1;
            this.ssID = _arg_1.id;
            this.duration = _arg_1.duration;
            this.currDuration = this.duration;
            this.durSecond = int((this.currDuration * 0.1));
            this._fireEvent = (this.durSecond > 3);
        }

        public function updateCurrentDuration(_arg_1:int):void
        {
            var _local_2:int;
            this.currDuration = _arg_1;
            if (this._fireEvent){
                _local_2 = (int((this.currDuration * 0.1)) + 1);
                if (_local_2 < this.durSecond){
                    this.durSecond = _local_2;
                    if (this._ssEvent == null){
                        this._ssEvent = new SSModelEvent(SSModelEvent.ON_DURATION_CHANGE, this);
                    };
                    dispatchEvent(this._ssEvent);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1292()
        {
        }


    }
}//package com.tencent.ai.core.status

// _SafeStr_1292 = " SSModel" (String#17738)


