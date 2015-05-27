// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.IOperation

package com.tencent.ai.core.timeline
{
    public interface IOperation 
    {

        function getSyncID():int;
        function getExecuteFrame():int;
        function execute():void;

    }
}//package com.tencent.ai.core.timeline

