// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerManager

package com.tencent.ai.core.player
{
    import com.tencent.ai.core.scene.IElementFactory;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.PlayerInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.PlayerID;

    public interface IPlayerManager extends IElementFactory 
    {

        function getMainPlayer():BasePlayer;
        function addPlayerPet(_arg_1:uint, _arg_2:PetInfo):void;
        function addPlayer(_arg_1:PlayerInfo):BasePlayer;
        function removePlayer(_arg_1:uint):void;
        function getPlayers():Vector.<BasePlayer>;
        function getPlayerCount():int;
        function indexOfPlayer(_arg_1:uint):int;
        function getPlayerByID(_arg_1:uint):BasePlayer;
        function getCachePlayerInfoByID(_arg_1:uint):PlayerInfo;
        function registerCachePlayerInfos(_arg_1:Vector.<PlayerInfo>):void;
        function removeCachePlayerInfo(_arg_1:uint):Boolean;
        function getBindScene():IScene;
        function clearPlayers():void;
        function getPlayerByPlayerID(_arg_1:PlayerID):BasePlayer;
        function unbind():void;

    }
}//package com.tencent.ai.core.player

