// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IVKeyInterceptTarget

package com.tencent.ai.core.player
{
    public interface IVKeyInterceptTarget 
    {

        function inputCurrentIntercept(_arg_1:int, _arg_2:int):int;
        function addVKeyIntercept(_arg_1:IVKeyIntercept):void;
        function removeVKeyIntercept(_arg_1:IVKeyIntercept):void;
        function isKeyDown(_arg_1:int):Boolean;

    }
}//package com.tencent.ai.core.player

