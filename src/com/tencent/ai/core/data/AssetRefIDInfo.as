package com.tencent.ai.core.data
{
    
    public class AssetRefIDInfo 
    {

        public static const ID:String = "id";
        public static const EFFECT_IDS:String = "EffectIDs";
        public static const INTERACT_IDS:String = "InteractIDs";
        public static const MONSTER_IDS:String = "MonsterIDs";
        public static const SKILL_IDS:String = "SkillIDs";
        public static const SOUND_IDS:String = "SoundIDs";
        public static const ACTIVITY_MONSTER_IDS:String = "ActivityMonsters";

        public var soundIDs:Vector.<int>;
        public var effectIDs:Vector.<int>;
        public var interactIDs:Vector.<int>;
        public var monsterIDs:Vector.<int>;

    }
}
