// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.phase.IPhaseListener

package com.tencent.free.phase
{
    public interface IPhaseListener 
    {

        function progress(_arg_1:int, _arg_2:int=0, _arg_3:int=0, _arg_4:String=""):void;
        function error(_arg_1:String):void;
        function next():void;

    }
}//package com.tencent.free.phase

