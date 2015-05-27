// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.ITeamManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.TeamInfo;
    import flash.display.DisplayObjectContainer;
    import com.tencent.ai.core.data.PlayerID;

    public interface ITeamManager extends IEventDispatcher 
    {

        function get teamInfo():TeamInfo;
        function get isMainPlayerLeader():Boolean;
        function get inTeam():Boolean;
        function showAvatarBar(_arg_1:DisplayObjectContainer=null, _arg_2:int=6, _arg_3:int=60, _arg_4:Boolean=false):void;
        function quitTeam():void;
        function invite(_arg_1:PlayerID):void;
        function get isFull():Boolean;
        function setAvatarBarVisiable(_arg_1:Boolean):void;

    }
}//package com.tencent.ai.core.player

