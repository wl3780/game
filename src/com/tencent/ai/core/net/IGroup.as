// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.IGroup

package com.tencent.ai.core.net
{
    public interface IGroup 
    {

        function send(_arg_1:int, _arg_2:Object):Boolean;
        function sendAndListen(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean;
        function getConnection():IConnection;
        function getType():String;

    }
}//package com.tencent.ai.core.net

