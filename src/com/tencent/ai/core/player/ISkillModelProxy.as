// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.ISkillModelProxy

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.actor.model.SkillModel;

    public interface ISkillModelProxy extends IEventDispatcher 
    {

        function get isShortcut():Boolean;
        function get index():int;
        function set postion(_arg_1:int):void;
        function get skillName():String;
        function get skillID():int;
        function get baseSkillID():int;
        function get skillGroupID():int;
        function get skillLevel():int;
        function get actionID():int;
        function get skillDes():String;
        function getModel():SkillModel;
        function getEnabled():Boolean;
        function getCanUsing():Boolean;
        function getIsCD():Boolean;
        function resetAndClearCD():void;
        function updateData():void;

    }
}//package com.tencent.ai.core.player

