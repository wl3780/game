// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.IDmgMetersManager

package com.tencent.ai.core.combat
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.DmgInfo;
    import com.tencent.ai.core.scene.IScene;

    public interface IDmgMetersManager extends IEventDispatcher 
    {

        function inputAttack(_arg_1:AttackInfo):void;
        function inputActorDead(_arg_1:AttackInfo, _arg_2:int=0, _arg_3:int=0, _arg_4:int=1):void;
        function inputActorHPUpdate(_arg_1:BaseActor, _arg_2:int=0, _arg_3:Boolean=true, _arg_4:Object=null):void;
        function inputActorMPUpdate(_arg_1:BaseActor, _arg_2:int=0, _arg_3:Boolean=true):void;
        function getCurrentDmgInfo():DmgInfo;
        function bindScene(_arg_1:IScene):void;
        function unbind():void;

    }
}//package com.tencent.ai.core.combat

