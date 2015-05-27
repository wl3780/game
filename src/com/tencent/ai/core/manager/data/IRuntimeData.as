// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.IRuntimeData

package com.tencent.ai.core.manager.data
{
    import com.tencent.ai.core.data.DetailPlayerInfo;
    import com.tencent.ai.core.data.ServerInfo;
    import com.tencent.ai.core.data.PlayerID;

    public interface IRuntimeData 
    {

        function get mainPlayerInfo():DetailPlayerInfo;
        function set mainPlayerInfo(_arg_1:DetailPlayerInfo):void;
        function set remoteDataProvider(_arg_1:IDataProvider):void;
        function get remoteDataProvider():IDataProvider;
        function get to_scene_id():int;
        function set to_scene_id(_arg_1:int):void;
        function get latest_scene_id():int;
        function set latest_scene_id(_arg_1:int):void;
        function get main_role_id():int;
        function set main_role_id(_arg_1:int):void;
        function get clientUin():uint;
        function get clientName():String;
        function get isIntroduceLogin():Boolean;
        function set isIntroduceLogin(_arg_1:Boolean):void;
        function get currentTime():int;
        function get onlineTime():int;
        function get serverInfo():ServerInfo;
        function getData(_arg_1:String):Object;
        function setData(_arg_1:String, _arg_2:Object):void;
        function convertToRTString(_arg_1:String, _arg_2:Object=null):String;
        function filterRTString(_arg_1:String):String;
        function updateTime(_arg_1:int, _arg_2:int):void;
        function bindPlot(_arg_1:int, _arg_2:int, _arg_3:Array):void;
        function unbindPlot(_arg_1:int, _arg_2:int):void;
        function getbindPlot(_arg_1:int):Object;
        function prepareResource(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void;
        function unprepareResource(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void;
        function needPrepareResource(_arg_1:int, _arg_2:int, _arg_3:int):Array;
        function get loginRunScriptID():int;
        function set loginRunScriptID(_arg_1:int):void;
        function get lastPlayer():PlayerID;
        function set lastPlayer(_arg_1:PlayerID):void;

    }
}//package com.tencent.ai.core.manager.data

