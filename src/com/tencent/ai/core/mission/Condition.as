// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.Condition

package com.tencent.ai.core.mission
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.data.ConditionStaticInfo;
    import com.tencent.ai.core.events.MissionEvent;
    import  ©init._SafeStr_86;

    public class Condition extends EventDispatcher implements ICondition 
    {

        private var _flag:Boolean;
        private var _data:Object;
        private var _staticInfo:ConditionStaticInfo;


        [Bindable("flag")]
        public function get flag():Boolean
        {
            return (this._flag);
        }

        public function set flag(_arg_1:Boolean):void
        {
            if (this._flag == _arg_1){
                return;
            };
            this._flag = _arg_1;
            dispatchEvent(new MissionEvent(MissionEvent.CONDITION_FLAG_CHANGE));
        }

        [Bindable("data")]
        public function get data():Object
        {
            return (this._data);
        }

        public function set data(_arg_1:Object):void
        {
            if (this._data == _arg_1){
                return;
            };
            this._data = _arg_1;
            dispatchEvent(new MissionEvent(MissionEvent.CONDITION_DATA_CHANGE));
        }

        public function get staticInfo():ConditionStaticInfo
        {
            return (this._staticInfo);
        }

        public function set staticInfo(_arg_1:ConditionStaticInfo):void
        {
            this._staticInfo = _arg_1;
        }

        public function check():void
        {
        }

        public /*  ©init. */ function _SafeStr_86()
        {
        }


    }
}//package com.tencent.ai.core.mission

// _SafeStr_86 = " Condition" (String#13790)


