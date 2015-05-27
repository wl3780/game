// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.impl.RuntimeData

package com.tencent.ai.core.manager.data.impl
{
    import com.tencent.ai.core.manager.data.IRuntimeData;
    import com.tencent.ai.core.data.DetailPlayerInfo;
    import com.tencent.ai.core.data.ServerInfo;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.manager.data.IDataProvider;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.setup.data.ServerInfoDef;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.utils.VipUtil;
    import  ©init._SafeStr_589;

    public class RuntimeData implements IRuntimeData 
    {

        private var _playerInfo:DetailPlayerInfo;
        private var _serverInfo:ServerInfo;
        private var _dataDict:Dictionary;
        private var _toSceneID:int = 0;
        private var _latestSceneID:int = 0;
        private var _mainRoleID:int = 0;
        private var _clientUin:uint = 0;
        private var _currentTime:int = 0;
        private var _onlineTime:int = 0;
        private var _isIntroduceLogin:Boolean = false;
        private var _timeUpdateEvent:AIEvent;
        private var _dicDup:Dictionary;
        private var _prepareRes:Dictionary;
        private var _loginRunScriptID:int;
        private var _remoteDataProvider:IDataProvider;
        private var _lastPlayer:PlayerID;


        public function initialize(_arg_1:ServerInfoDef):void
        {
            this._serverInfo = new ServerInfo(_arg_1);
            this._dataDict = new Dictionary();
            this._dicDup = new Dictionary();
            this._prepareRes = new Dictionary();
            this._timeUpdateEvent = new AIEvent(AIEvent.ON_TIME_UPDATE);
            this._timeUpdateEvent.setTarget(this);
        }

        public function get mainPlayerInfo():DetailPlayerInfo
        {
            return (this._playerInfo);
        }

        public function set mainPlayerInfo(_arg_1:DetailPlayerInfo):void
        {
            if (this._playerInfo == null){
                this._playerInfo = _arg_1;
                this._clientUin = _arg_1.id;
                this._serverInfo.uin = this._clientUin;
            };
        }

        public function set remoteDataProvider(_arg_1:IDataProvider):void
        {
            this._remoteDataProvider = _arg_1;
        }

        public function get remoteDataProvider():IDataProvider
        {
            return (this._remoteDataProvider);
        }

        public function get serverInfo():ServerInfo
        {
            return (this._serverInfo);
        }

        public function get clientUin():uint
        {
            return (this._clientUin);
        }

        public function get clientName():String
        {
            if (this._playerInfo == null){
                return ("");
            };
            return (this._playerInfo.name);
        }

        public function get isIntroduceLogin():Boolean
        {
            return (this._isIntroduceLogin);
        }

        public function set isIntroduceLogin(_arg_1:Boolean):void
        {
            this._isIntroduceLogin = _arg_1;
        }

        public function get currentTime():int
        {
            return (this._currentTime);
        }

        public function get onlineTime():int
        {
            return (this._onlineTime);
        }

        public function getData(_arg_1:String):Object
        {
            return (this._dataDict[_arg_1]);
        }

        public function setData(_arg_1:String, _arg_2:Object):void
        {
            this._dataDict[_arg_1] = _arg_2;
        }

        public function get to_scene_id():int
        {
            return (this._toSceneID);
        }

        public function set to_scene_id(_arg_1:int):void
        {
            this._toSceneID = _arg_1;
        }

        public function get latest_scene_id():int
        {
            return (this._latestSceneID);
        }

        public function set latest_scene_id(_arg_1:int):void
        {
            this._latestSceneID = _arg_1;
        }

        public function get main_role_id():int
        {
            return (this._mainRoleID);
        }

        public function set main_role_id(_arg_1:int):void
        {
            this._mainRoleID = _arg_1;
        }

        public function convertToRTString(_arg_1:String, _arg_2:Object=null):String
        {
            var _local_3:VipSimpleInfo;
            var _local_4:uint;
            var _local_5:uint;
            var _local_6:String;
            _arg_1 = _arg_1.replace(/%C/g, "<font color='#afff6f'>");
            _arg_1 = _arg_1.replace(/C%/g, "</font>");
            _arg_1 = _arg_1.replace(/%N/g, "<font color='#afff6f'>");
            _arg_1 = _arg_1.replace(/N%/g, "</font>");
            _arg_1 = _arg_1.replace(/%D/g, "<font color='#ff503e'>");
            _arg_1 = _arg_1.replace(/D%/g, "</font>");
            _arg_1 = _arg_1.replace(/%M/g, "<font color='#ff503e'>");
            _arg_1 = _arg_1.replace(/M%/g, "</font>");
            _arg_1 = _arg_1.replace(/%P/g, "<font color='#ff503e'>");
            _arg_1 = _arg_1.replace(/P%/g, "</font>");
            _arg_1 = _arg_1.replace(/%K/g, "<font color='#00B7EC'>");
            _arg_1 = _arg_1.replace(/K%/g, "</font>");
            while (_arg_1.search("%player_name%") != -1) {
                if (!_arg_2){
                    if (((AICore.data.mainModel) && (AICore.data.mainModel.playerInfo))){
                        _local_3 = AICore.data.mainModel.playerInfo.vipInfo;
                        _local_4 = 16745795;
                        if (((_local_3) && (_local_3.isVip))){
                            _local_4 = VipUtil.getVipColor(_local_3);
                        };
                        _arg_1 = _arg_1.replace("%player_name%", (((("<font color='#" + _local_4.toString(16)) + "'>") + AICore.data.mainModel.playerInfo.name) + "</font>"));
                    } else {
                        _arg_1 = _arg_1.replace("%player_name%", (("<font color='#ff8543'>" + "主人") + "</font>"));
                    };
                } else {
                    _local_5 = _arg_2.flag;
                    _local_6 = _arg_2.nickName;
                    _local_4 = 16745795;
                    if ((_local_5 & 2) != 0){
                        _local_4 = VipUtil.getVipColor(_arg_2.vipInfo);
                    };
                    _arg_1 = _arg_1.replace("%player_name%", (((("<font color='#" + _local_4.toString(16)) + "'>") + _local_6) + "</font>"));
                };
            };
            return (_arg_1);
        }

        public function filterRTString(_arg_1:String):String
        {
            _arg_1 = _arg_1.replace(/%C/g, "");
            _arg_1 = _arg_1.replace(/%N/g, "");
            _arg_1 = _arg_1.replace(/%D/g, "");
            _arg_1 = _arg_1.replace(/%M/g, "");
            _arg_1 = _arg_1.replace(/%P/g, "");
            return (_arg_1.replace(/%K/g, ""));
        }

        public function updateTime(_arg_1:int, _arg_2:int):void
        {
            this._currentTime = _arg_1;
            this._onlineTime = _arg_2;
            this._timeUpdateEvent.data = {
                "currentTime":this._currentTime,
                "onlineTime":this._onlineTime
            };
            AICore.dispatchAIEvent(this._timeUpdateEvent);
        }

        public function bindPlot(_arg_1:int, _arg_2:int, _arg_3:Array):void
        {
            var _local_4:Array = this._dicDup[_arg_1];
            if (!_local_4){
                _local_4 = new Array();
                this._dicDup[_arg_1] = _local_4;
            };
            _local_4.push({
                "plotID":_arg_2,
                "scenes":_arg_3
            });
        }

        public function unbindPlot(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int;
            var _local_5:Object;
            var _local_3:Array = this._dicDup[_arg_1];
            if (_local_3){
                _local_4 = 0;
                while (_local_4 < _local_3.length) {
                    _local_5 = _local_3[_local_4];
                    if (_local_5.plotID == _arg_2){
                        _local_3.splice(_local_4, 1);
                        return;
                    };
                    _local_4++;
                };
            };
        }

        public function getbindPlot(dupID:int):Object
        {
            var arr:Array = this._dicDup[dupID];
            if (((arr) && ((arr.length > 0)))){
                arr.sort(function (_arg_1:Object, _arg_2:Object):int
                {
                    return ((((_arg_1.plotID < _arg_2.plotID)) ? -1 : 1));
                });
                return (arr[0]);
            };
            return (null);
        }

        private function sortBindPlot():void
        {
        }

        public function prepareResource(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_5:Dictionary = this._prepareRes[_arg_1];
            if (!_local_5){
                _local_5 = new Dictionary();
                this._prepareRes[_arg_1] = _local_5;
            };
            var _local_6:Dictionary = _local_5[_arg_2];
            if (!_local_6){
                _local_6 = new Dictionary();
                _local_5[_arg_2] = _local_6;
            };
            var _local_7:Array = _local_6[_arg_3];
            if (!_local_7){
                _local_7 = new Array();
                _local_6[_arg_3] = _local_7;
            };
            _local_7.push(_arg_4);
        }

        public function unprepareResource(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_6:Dictionary;
            var _local_7:Array;
            var _local_8:int;
            var _local_5:Dictionary = this._prepareRes[_arg_1];
            if (_local_5){
                _local_6 = _local_5[_arg_2];
                if (_local_6){
                    _local_7 = _local_6[_arg_3];
                    if (_local_7){
                        _local_8 = _local_7.indexOf(_arg_4);
                        if (-1 != _local_8){
                            _local_7.splice(_local_8, 1);
                        };
                    };
                };
            };
        }

        public function needPrepareResource(_arg_1:int, _arg_2:int, _arg_3:int):Array
        {
            var _local_6:Dictionary;
            var _local_4:Array;
            var _local_5:Dictionary = this._prepareRes[_arg_1];
            if (_local_5){
                _local_6 = _local_5[_arg_2];
                if (_local_6){
                    _local_4 = _local_6[_arg_3];
                };
            };
            return (_local_4);
        }

        public function get loginRunScriptID():int
        {
            return (this._loginRunScriptID);
        }

        public function set loginRunScriptID(_arg_1:int):void
        {
            this._loginRunScriptID = _arg_1;
        }

        public function get lastPlayer():PlayerID
        {
            return (this._lastPlayer);
        }

        public function set lastPlayer(_arg_1:PlayerID):void
        {
            this._lastPlayer = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_589()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.impl

// _SafeStr_589 = " RuntimeData" (String#16751)


