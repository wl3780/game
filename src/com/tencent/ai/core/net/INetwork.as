// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.INetwork

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.data.ServerInfo;

    public interface INetwork 
    {

        function initialize(_arg_1:Object=null):void;
        function getConnection(_arg_1:int):IConnection;
        function createConnection(_arg_1:int, _arg_2:Object=null):IConnection;
        function destroyConnection(_arg_1:int):void;
        function createHttpLoader(_arg_1:Boolean, _arg_2:int=-1, _arg_3:Object=null):IHttpLoader;
        function send(_arg_1:int, _arg_2:Object, _arg_3:int=-1):Boolean;
        function sendAndListen(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:int=-1):Boolean;
        function sendAndListen2(_arg_1:int, _arg_2:Object, _arg_3:Object, _arg_4:IConnection, _arg_5:Boolean=false):Boolean;
        function cancelSendAndListen(_arg_1:Object, _arg_2:int=-1):void;
        function addFuncListener(_arg_1:int, _arg_2:Function):void;
        function removeFuncListener(_arg_1:int, _arg_2:Function):void;
        function addProtocolListener(_arg_1:IProtocolListener):void;
        function removeProtocolListener(_arg_1:IProtocolListener):void;
        function setDefaultConnID(_arg_1:int):void;
        function getDefaultConnID():int;
        function getCurrentMsgID():int;
        function registerProtocolClass(_arg_1:int, _arg_2:Class):void;
        function unregisterProtocolClass(_arg_1:int):void;
        function hasProtocolClass(_arg_1:int):Boolean;
        function getProtocolClass(_arg_1:int):Class;
        function createGroup(_arg_1:String, _arg_2:int):IGroup;
        function destroyGroup(_arg_1:String):void;
        function getGroup(_arg_1:String):IGroup;
        function getServerInfo():ServerInfo;

    }
}//package com.tencent.ai.core.net

