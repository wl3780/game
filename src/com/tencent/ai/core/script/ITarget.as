// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.ITarget

package com.tencent.ai.core.script
{
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.render.IElementView;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.EnvironmentInfo;
    import com.tencent.ai.core.scene.IScene;

    public interface ITarget extends IScriptsContainer 
    {

        function get landFunction():CFunction;
        function set landFunction(_arg_1:CFunction):void;
        function set acceptVKeyFunction(_arg_1:CFunction):void;
        function get latestVKey():int;
        function get currentActionArgs():Array;
        function setCurrentState(_arg_1:int):void;
        function get currentActionState():ActionState;
        function clearVirgations():void;
        function control(_arg_1:ScriptArg):void;
        function nextAction(_arg_1:int=-1, _arg_2:Object=null):void;
        function getVariable(_arg_1:int, _arg_2:Boolean=false):Variable;
        function get target():HasActionElement;
        function get view():IElementView;
        function get model():ActorModel;
        function get actionInfo():ActionInfo;
        function get environmentInfo():EnvironmentInfo;
        function get scene():IScene;

    }
}//package com.tencent.ai.core.script

