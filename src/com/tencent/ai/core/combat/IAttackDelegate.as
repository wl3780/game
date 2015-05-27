// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.combat.IAttackDelegate

package com.tencent.ai.core.combat
{
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.actor.HasActionElement;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.data.MapPosition;

    public interface IAttackDelegate 
    {

        function useCacheSkillInfo(_arg_1:SkillInfo):void;
        function get skillInfo():SkillInfo;
        function set hitScriptFunc(_arg_1:CFunction):void;
        function get currentAim():HasActionElement;
        function set catchValue(_arg_1:int):void;
        function get catchValue():int;
        function get cacthAims():Vector.<HasActionElement>;
        function addCatchAim(_arg_1:HasActionElement):void;
        function addAttackAims(_arg_1:Vector.<HasActionElement>):void;
        function clearCatchAims(_arg_1:Boolean=false):void;
        function clearAims():void;
        function updateAttackInfo():void;
        function attackElement(_arg_1:InteractElement, _arg_2:MapPosition, _arg_3:int):Boolean;

    }
}//package com.tencent.ai.core.combat

