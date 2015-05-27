// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.phase.IPhase

package com.tencent.free.phase
{
    public interface IPhase 
    {

        function start():void;
        function isCompleted():Boolean;
        function setListener(_arg_1:IPhaseListener):void;
        function getMessage():String;
        function unload():void;

    }
}//package com.tencent.free.phase

