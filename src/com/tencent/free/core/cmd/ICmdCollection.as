// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.cmd.ICmdCollection

package com.tencent.free.core.cmd
{
    public interface ICmdCollection 
    {

        function registerCmd(_arg_1:String, _arg_2:ICmdListener):void;
        function hasCmd(_arg_1:String):Boolean;
        function unregisterCmd(_arg_1:String):void;
        function call(_arg_1:String, _arg_2:Object=null):void;
        function callCommand(_arg_1:BaseCommand, _arg_2:Boolean=true):void;

    }
}//package com.tencent.free.core.cmd

