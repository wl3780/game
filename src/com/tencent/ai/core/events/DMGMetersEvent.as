// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.DMGMetersEvent

package com.tencent.ai.core.events
{
    import com.tencent.ai.core.data.AttackInfo;
    import flash.geom.Point;
    import com.tencent.ai.core.actor.BaseActor;
    import  ©init._SafeStr_532;

    public class DMGMetersEvent extends BaseEvent 
    {

        public static const ON_DMGINFO_UPDATE:String = "onDmgInfoUpdate";
        public static const ON_BEAT_HURT_CHANGE:String = "onBeatHurtChange";
        public static const ON_ATTACK_HAPPENED:String = "onAttackHappened";
        public static const ON_MONSTER_KILLED:String = "onMonsterKilled";
        public static const ON_ACTOR_HP_UPDATE:String = "onActorHPUpdate";
        public static const ON_ACTOR_MP_UPDATE:String = "onActorMPUpdate";
        public static const ON_ACTOR_ANGRY_UPDATE:String = "onActorAngryUpdate";

        public var attackInfo:AttackInfo;
        public var sceneOffset:Point;
        public var hitCombo:int;
        public var isExtraDmg:Boolean;
        public var updateActor:BaseActor;
        public var updateValue:int;
        public var flag:Boolean;
        public var reason:String;

        public function DMGMetersEvent(_arg_1:String, _arg_2:Object=null, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.m_target = _arg_2;
        }

        public /*  ©init. */ function _SafeStr_532()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_532 = " DMGMetersEvent" (String#15743)


