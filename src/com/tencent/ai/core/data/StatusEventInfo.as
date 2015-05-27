// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.StatusEventInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.SStatusEventType;
    import com.tencent.ai.core.status.SStatus;
    import  ©init._SafeStr_340;
    import __AS3__.vec.*;

    public class StatusEventInfo implements IXMLSerialize 
    {

        public var statusEventType:int;
        public var eventTimes:int;
        public var cFlag:int;
        public var triggerEventInfo:TriggerEventInfo;
        public var conditionInfos:Vector.<ConditionInfo>;
        public var statusEffects:Vector.<StatusEffectInfo>;


        public function decode(_arg_1:XML):void
        {
            var _local_4:int;
            var _local_5:ConditionInfo;
            var _local_6:StatusEffectInfo;
            this.statusEventType = int(_arg_1.@type);
            this.eventTimes = int(_arg_1.@times);
            this.cFlag = int(_arg_1.@cFlag);
            if (this.statusEventType > SStatusEventType.TRIGGER_EVENT){
                this.triggerEventInfo = new TriggerEventInfo();
                this.triggerEventInfo.decode(_arg_1);
                if (this.statusEventType < SStatusEventType.MAX_MAP_EVENT){
                    this.triggerEventInfo.type = SStatus.TRIGGER_EVENT_MAP[this.statusEventType];
                    this.statusEventType = SStatusEventType.TRIGGER_EVENT;
                };
            };
            var _local_2:XMLList = _arg_1.ConditionInfo;
            var _local_3:int = _local_2.length();
            if (_local_3 > 0){
                this.conditionInfos = new Vector.<ConditionInfo>();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = new ConditionInfo();
                    _local_5.decode(_local_2[_local_4]);
                    this.conditionInfos.push(_local_5);
                    _local_4++;
                };
            };
            _local_2 = _arg_1.StatusEffectInfo;
            _local_3 = _local_2.length();
            if (_local_3 > 0){
                this.statusEffects = new Vector.<StatusEffectInfo>();
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_6 = new StatusEffectInfo();
                    _local_6.decode(_local_2[_local_4]);
                    this.statusEffects.push(_local_6);
                    _local_4++;
                };
            };
        }

        public function encode()
        {
            return (<StatusEventInfo/>
            );
        }

        public /*  ©init. */ function _SafeStr_340()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_340 = " StatusEventInfo" (String#14177)


