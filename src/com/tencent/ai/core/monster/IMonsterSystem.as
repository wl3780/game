// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.IMonsterSystem

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.player.BasePlayer;

    public interface IMonsterSystem 
    {

        function newFactory(_arg_1:MonsterStaticInfo, _arg_2:CLASS):void;
        function getFactory(_arg_1:int):IMonsterFactory;
        function disposeFactory(_arg_1:int):void;
        function getResource():IMonsterAssetManager;
        function newManager(_arg_1:Class=null):IMonsterManager;
        function spawnMonsters(_arg_1:SpawnInfo):void;
        function getSpawnManager():ISpawnManager;
        function catchMonster(_arg_1:BasePlayer, _arg_2:BaseMonster):void;

    }
}//package com.tencent.ai.core.monster

