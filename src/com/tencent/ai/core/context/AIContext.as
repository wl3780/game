// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.context.AIContext

package com.tencent.ai.core.context
{
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.npc.INpcManager;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.pet.IPetManager;
    import com.tencent.ai.core.interact.IInteractItemManager;

    public interface AIContext 
    {

        function activate():void;
        function inactive():void;
        function isActive():Boolean;
        function goScene(_arg_1:int, _arg_2:int=0, _arg_3:int=0):void;
        function getCurrentScene():IScene;
        function getSceneInfo():SceneInfo;
        function getPlayerManager():IPlayerManager;
        function getNpcManager():INpcManager;
        function getMonsterManager():IMonsterManager;
        function getPetManager():IPetManager;
        function getInteractItemManager():IInteractItemManager;
        function getType():String;
        function getLevel():int;

    }
}//package com.tencent.ai.core.context

