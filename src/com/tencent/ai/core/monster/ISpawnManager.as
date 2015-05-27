// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.ISpawnManager

package com.tencent.ai.core.monster
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.data.MonsterInfo;
    import flash.utils.Dictionary;

    public interface ISpawnManager extends IEventDispatcher 
    {

        function initialize(_arg_1:Object=null):void;
        function spawnMonsters(_arg_1:SpawnInfo):void;
        function sendServerBossDead(_arg_1:MonsterInfo):void;
        function sendServerMonsterDead(_arg_1:MonsterInfo):void;
        function setLocalSpawnFactory(_arg_1:ILocalSpawnFactory):void;
        function get netCmdHandlers():Dictionary;
        function defaultHandlers():void;
        function get useDupSendToSpawn():Boolean;
        function set useDupSendToSpawn(_arg_1:Boolean):void;
        function get citySendToSpawnCMD():uint;
        function set citySendToSpawnCMD(_arg_1:uint):void;

    }
}//package com.tencent.ai.core.monster

