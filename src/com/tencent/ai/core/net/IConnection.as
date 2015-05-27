// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.IConnection

package com.tencent.ai.core.net
{
    import flash.events.IEventDispatcher;
    import flash.utils.ByteArray;

    public interface IConnection extends IEventDispatcher 
    {

        function initialize(_arg_1:Object=null):void;
        function setPolicyPort(_arg_1:int):void;
        function setTimeOut(_arg_1:int):void;
        function newSocketInstance():void;
        function connect(_arg_1:String, _arg_2:int):void;
        function reconnect():void;
        function isConnected():Boolean;
        function send(_arg_1:ADF):Boolean;
        function sendBytes(_arg_1:ByteArray):void;
        function close():void;
        function dispose():void;
        function getConnID():int;
        function writeBytes(_arg_1:ByteArray):void;
        function getHost():String;
        function getPort():int;

    }
}//package com.tencent.ai.core.net

