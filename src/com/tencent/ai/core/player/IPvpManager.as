// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPvpManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_PvpPlayerInfo;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.utils.ArrayHash;

    public interface IPvpManager extends IEventDispatcher 
    {

        function get playerList():Vector.<P_PvpPlayerInfo>;
        function get numPlayer():int;
        function get mainPlayerGroupID():int;
        function getPvpPlayerInfoBy(_arg_1:PlayerID):P_PvpPlayerInfo;
        function go(_arg_1:int, _arg_2:int):void;
        function inviteFriendPK(_arg_1:PlayerID):void;
        function requestFriendPK(_arg_1:PlayerID):void;
        function packUpPet(_arg_1:CFunction):void;
        function putOutPet():void;
        function get friendPkMemberDatas():ArrayHash;
        function rebuildFriendPkRoom():void;

    }
}//package com.tencent.ai.core.player

