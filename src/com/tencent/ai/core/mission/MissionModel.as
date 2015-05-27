// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.mission.MissionModel

package com.tencent.ai.core.mission
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import com.tencent.ai.core.enum.MissionConstants;
    import mx.events.PropertyChangeEvent;
    import  ©init._SafeStr_684;
    import __AS3__.vec.*;

    public class MissionModel extends EventDispatcher 
    {

        private static var _instance:MissionModel;

        private var _weekMissions:Vector.<MissionInfo>;
        private var _dayMissions:Vector.<MissionInfo>;
        private var _mainMissions:Vector.<MissionInfo>;
        private var _branchMissions:Vector.<MissionInfo>;
        private var _challengeMissions:Vector.<MissionInfo>;
        private var _completedMainMissions:Vector.<MissionInfo>;
        private var _xOnBoard:Vector.<MissionInfo>;
        private var _xMissions:Vector.<MissionInfo>;
        private var _2023480880xNextFreshTime:int;
        private var _308402969xFreshCount:int;

        public function MissionModel()
        {
            if (_instance){
                throw (Error("MissionModel is a singleton class!"));
            };
            _instance = this;
            this.mainMissions = new Vector.<MissionInfo>();
            this.weekMissions = new Vector.<MissionInfo>();
            this.dayMissions = new Vector.<MissionInfo>();
            this.branchMissions = new Vector.<MissionInfo>();
            this.challengeMissions = new Vector.<MissionInfo>();
            this.completedMainMissions = new Vector.<MissionInfo>();
            this.xOnBoard = new Vector.<MissionInfo>();
            this.xMissions = new Vector.<MissionInfo>();
        }

        public static function getInstance():MissionModel
        {
            if (!_instance){
                _instance = new (MissionModel)();
            };
            return (_instance);
        }


        public function addCompletedMission(_arg_1:MissionInfo):void
        {
            if (!_arg_1){
                return;
            };
            switch (_arg_1.staticInfo.type){
                case MissionConstants.Type_Main:
                    if (this._addMission(this.completedMainMissions, _arg_1)){
                        dispatchEvent(new Event("completedMainMissions"));
                    };
                    return;
            };
        }

        public function addToXOnBoard(_arg_1:MissionInfo):void
        {
            if (!_arg_1){
                return;
            };
            switch (_arg_1.staticInfo.type){
                case MissionConstants.Type_X:
                    if (this._addMission(this.xOnBoard, _arg_1)){
                        dispatchEvent(new Event("xOnBoard"));
                    };
                    return;
            };
        }

        public function addMission(_arg_1:MissionInfo, _arg_2:Boolean=false):void
        {
            if (!_arg_1){
                return;
            };
            switch (_arg_1.staticInfo.type){
                case MissionConstants.Type_Main:
                    if (this._addMission(this.mainMissions, _arg_1, _arg_2)){
                        dispatchEvent(new Event("mainMissions"));
                    };
                    return;
                case MissionConstants.Type_Branch:
                    if (_arg_1.staticInfo.specialType == MissionConstants.SpecialType_Challenge){
                        if (this._addMission(this.challengeMissions, _arg_1, _arg_2)){
                            dispatchEvent(new Event("challengeMissions"));
                        };
                    } else {
                        if (this._addMission(this.branchMissions, _arg_1, _arg_2)){
                            dispatchEvent(new Event("branchMissions"));
                        };
                    };
                    return;
                case MissionConstants.Type_Week:
                    if (this._addMission(this.weekMissions, _arg_1, _arg_2)){
                        dispatchEvent(new Event("weekMissions"));
                    };
                    return;
                case MissionConstants.Type_Day:
                    if (this._addMission(this.dayMissions, _arg_1, _arg_2)){
                        dispatchEvent(new Event("dayMissions"));
                    };
                    return;
                case MissionConstants.Type_X:
                    if (this._addMission(this.xMissions, _arg_1, _arg_2)){
                        dispatchEvent(new Event("xMissions"));
                    };
                    return;
            };
        }

        private function _addMission(_arg_1:Vector.<MissionInfo>, _arg_2:MissionInfo, _arg_3:Boolean=false):Boolean
        {
            var _local_4:int;
            _local_4 = _arg_1.indexOf(_arg_2);
            if (_local_4 == -1){
                if (_arg_3){
                    _arg_1.unshift(_arg_2);
                } else {
                    _arg_1.push(_arg_2);
                };
                return (true);
            };
            return (false);
        }

        public function removeMission(_arg_1:MissionInfo):void
        {
            if (!_arg_1){
                return;
            };
            switch (_arg_1.staticInfo.type){
                case MissionConstants.Type_Main:
                    this._removeMission(this.mainMissions, _arg_1);
                    dispatchEvent(new Event("mainMissions"));
                    return;
                case MissionConstants.Type_Branch:
                    if (this._removeMission(this.branchMissions, _arg_1)){
                        dispatchEvent(new Event("branchMissions"));
                    } else {
                        if (this._removeMission(this.challengeMissions, _arg_1)){
                            dispatchEvent(new Event("challengeMissions"));
                        };
                    };
                    return;
                case MissionConstants.Type_Week:
                    this._removeMission(this.weekMissions, _arg_1);
                    dispatchEvent(new Event("weekMissions"));
                    return;
                case MissionConstants.Type_Day:
                    this._removeMission(this.dayMissions, _arg_1);
                    dispatchEvent(new Event("dayMissions"));
                    return;
                case MissionConstants.Type_X:
                    this._removeMission(this.xMissions, _arg_1);
                    dispatchEvent(new Event("xMissions"));
                    return;
            };
        }

        private function _removeMission(_arg_1:Vector.<MissionInfo>, _arg_2:MissionInfo):void
        {
            var _local_3:int = _arg_1.indexOf(_arg_2);
            if (_local_3 < 0){
                return;
            };
            _arg_1.splice(_local_3, 1);
        }

        [Bindable("mainMissions")]
        public function get mainMissions():Vector.<MissionInfo>
        {
            return (this._mainMissions);
        }

        public function set mainMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._mainMissions == _arg_1){
                return;
            };
            this._mainMissions = _arg_1;
            dispatchEvent(new Event("mainMissions"));
        }

        [Bindable("branchMissions")]
        public function get branchMissions():Vector.<MissionInfo>
        {
            return (this._branchMissions);
        }

        public function set branchMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._branchMissions == _arg_1){
                return;
            };
            this._branchMissions = _arg_1;
            dispatchEvent(new Event("branchMissions"));
        }

        [Bindable("challengeMissions")]
        public function get challengeMissions():Vector.<MissionInfo>
        {
            return (this._challengeMissions);
        }

        public function set challengeMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._challengeMissions == _arg_1){
                return;
            };
            this._challengeMissions = _arg_1;
            dispatchEvent(new Event("challengeMissions"));
        }

        [Bindable("weekMissions")]
        public function get weekMissions():Vector.<MissionInfo>
        {
            return (this._weekMissions);
        }

        public function set weekMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._weekMissions == _arg_1){
                return;
            };
            this._weekMissions = _arg_1;
            dispatchEvent(new Event("weekMissions"));
        }

        [Bindable("dayMissions")]
        public function get dayMissions():Vector.<MissionInfo>
        {
            return (this._dayMissions);
        }

        public function set dayMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._dayMissions == _arg_1){
                return;
            };
            this._dayMissions = _arg_1;
            dispatchEvent(new Event("dayMissions"));
        }

        [Bindable("completedMainMissions")]
        public function get completedMainMissions():Vector.<MissionInfo>
        {
            return (this._completedMainMissions);
        }

        public function set completedMainMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._completedMainMissions == _arg_1){
                return;
            };
            this._completedMainMissions = _arg_1;
            dispatchEvent(new Event("completedMainMissions"));
        }

        [Bindable("xOnBoard")]
        public function get xOnBoard():Vector.<MissionInfo>
        {
            return (this._xOnBoard);
        }

        public function set xOnBoard(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._xOnBoard == _arg_1){
                return;
            };
            this._xOnBoard = _arg_1;
            dispatchEvent(new Event("xOnBoard"));
        }

        [Bindable("xMissions")]
        public function get xMissions():Vector.<MissionInfo>
        {
            return (this._xMissions);
        }

        public function set xMissions(_arg_1:Vector.<MissionInfo>):void
        {
            if (this._xMissions == _arg_1){
                return;
            };
            this._xMissions = _arg_1;
            dispatchEvent(new Event("xMissions"));
        }

        [Bindable(event="propertyChange")]
        public function get xNextFreshTime():int
        {
            return (this._2023480880xNextFreshTime);
        }

        public function set xNextFreshTime(_arg_1:int):void
        {
            var _local_2:Object = this._2023480880xNextFreshTime;
            if (_local_2 !== _arg_1){
                this._2023480880xNextFreshTime = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xNextFreshTime", _local_2, _arg_1));
                };
            };
        }

        [Bindable(event="propertyChange")]
        public function get xFreshCount():int
        {
            return (this._308402969xFreshCount);
        }

        public function set xFreshCount(_arg_1:int):void
        {
            var _local_2:Object = this._308402969xFreshCount;
            if (_local_2 !== _arg_1){
                this._308402969xFreshCount = _arg_1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xFreshCount", _local_2, _arg_1));
                };
            };
        }

        public /*  ©init. */ function _SafeStr_684()
        {
        }


    }
}//package com.tencent.ai.core.mission

// _SafeStr_684 = " MissionModel" (String#14489)


