// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.IElementController

package com.tencent.ai.core.actor
{
    import com.tencent.ai.core.data.AttackInfo;

    public interface IElementController 
    {

        function actDeadAction(... _args):void;
        function actHurtAction(_arg_1:int, _arg_2:int, _arg_3:AttackInfo):void;
        function vKeyAct(_arg_1:int, _arg_2:Object=null):void;
        function inputVKey(_arg_1:int):void;
        function inputActionID(_arg_1:int):void;
        function accept(_arg_1:int):Boolean;
        function convertVkey(_arg_1:int):int;
        function set isLock(_arg_1:Boolean):void;
        function get isLock():Boolean;
        function setCanAct(_arg_1:Boolean):void;
        function isVKeyDown(_arg_1:int):Boolean;
        function reset():void;

    }
}//package com.tencent.ai.core.actor

