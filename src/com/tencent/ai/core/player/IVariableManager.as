// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IVariableManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.actor.model.Variable;

    public interface IVariableManager extends IEventDispatcher 
    {

        function getVariables():Vector.<Variable>;
        function registVar(_arg_1:Variable):void;
        function unregistVar(_arg_1:Variable):void;

    }
}//package com.tencent.ai.core.player

