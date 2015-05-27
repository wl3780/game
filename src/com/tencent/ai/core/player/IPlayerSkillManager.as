// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerSkillManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.actor.model.ActorModel;
    import flash.utils.Dictionary;

    public interface IPlayerSkillManager extends IEventDispatcher 
    {

        function getAllSublimePositiveSkills():Vector.<ISkillModelProxy>;
        function getAllCostAngrySkills():Vector.<ISkillModelProxy>;
        function getAllPassiveSkills():Vector.<ISkillModelProxy>;
        function getAllPositiveSkills():Vector.<ISkillModelProxy>;
        function getAllSkills():Vector.<ISkillModelProxy>;
        function getShortcutSkills():Vector.<ISkillModelProxy>;
        function setControlModel(_arg_1:ActorModel=null, _arg_2:Boolean=false):void;
        function get controlMain():Boolean;
        function get controlActionInfos():Dictionary;
        function get controlSkills():Vector.<ISkillModelProxy>;
        function getSkillProxyByID(_arg_1:int):ISkillModelProxy;
        function getSkillProxyWTLevel(_arg_1:int):ISkillModelProxy;
        function requestLearnSkill(_arg_1:int):void;
        function requestSkillShortcut(_arg_1:int, _arg_2:int):void;
        function isAllowUpdate(_arg_1:int):Boolean;
        function hasLearn(_arg_1:int):Boolean;
        function toSkillGroupID(_arg_1:int):int;
        function toSkillLevel(_arg_1:int):int;
        function canLearnCostSkill():Boolean;
        function get skillUpdating():Boolean;
        function hasShortcutSkill(_arg_1:int):Boolean;
        function hasCatchSkill():Boolean;
        function execAddSkill(_arg_1:int):int;

    }
}//package com.tencent.ai.core.player

