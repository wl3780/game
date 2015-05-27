// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protect.IProtectModule

package com.tencent.ai.core.protect
{
    public interface IProtectModule 
    {

        function createObjectProtect(_arg_1:Object):void;
        function returnObjectProtect(_arg_1:Object):void;
        function start(_arg_1:Object):void;
        function stop():void;
        function forceReportCheatData():void;

    }
}//package com.tencent.ai.core.protect

