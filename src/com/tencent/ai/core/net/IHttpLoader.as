// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.IHttpLoader

package com.tencent.ai.core.net
{
    import flash.events.IEventDispatcher;
    import flash.net.URLRequest;

    public interface IHttpLoader extends IEventDispatcher 
    {

        function getBytesLoaded():uint;
        function getBytesTotal():uint;
        function get responeFormat():String;
        function set responeFormat(_arg_1:String):void;
        function get response();
        function set response(_arg_1:*):void;
        function load(_arg_1:URLRequest):void;
        function close():void;
        function setIsQueue(_arg_1:Boolean):void;
        function setNoCache(_arg_1:Boolean):void;
        function setTimeOut(_arg_1:int=-1, _arg_2:Boolean=true):void;
        function getLatestURL():String;
        function destroy():void;

    }
}//package com.tencent.ai.core.net

