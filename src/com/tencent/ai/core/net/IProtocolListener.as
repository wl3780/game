// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.IProtocolListener

package com.tencent.ai.core.net
{
    import __AS3__.vec.Vector;

    public interface IProtocolListener 
    {

        function getCmdsInterest():Vector.<int>;
        function onReceiveADF(_arg_1:ADF, _arg_2:int=-1):void;

    }
}//package com.tencent.ai.core.net

