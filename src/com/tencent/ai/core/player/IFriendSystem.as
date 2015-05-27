// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IFriendSystem

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_GameFriendInfo;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.protocol.PFriendChat;

    public interface IFriendSystem extends IEventDispatcher 
    {

        function get friendAddRequestList():Vector.<P_GameFriendInfo>;
        function killFriendAddRequest(_arg_1:PlayerID):void;
        function getChatPlayers():Vector.<PlayerID>;
        function readChatMessage(_arg_1:PlayerID):Vector.<PFriendChat>;
        function readBecomeFriendList():Vector.<P_GameFriendInfo>;
        function addFriend(_arg_1:PlayerID):void;
        function sayTo(_arg_1:PlayerID, _arg_2:String):void;
        function hasBecomeFriendMessage():Boolean;
        function hasFriendAddRequest():Boolean;
        function hasChat():Boolean;

    }
}//package com.tencent.ai.core.player

