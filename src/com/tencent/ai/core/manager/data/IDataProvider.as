package com.tencent.ai.core.manager.data
{
    import com.tencent.ai.core.data.ClientDataRecord;
    import com.tencent.ai.core.utils.ISerialize;
    
    import flash.events.IEventDispatcher;

    public interface IDataProvider extends IEventDispatcher 
    {

        function initialize():void;
        function isReady():Boolean;
        function currentRecord():ClientDataRecord;
        function setInt32(_arg_1:int, _arg_2:int):void;
        function getInt32(_arg_1:int):int;
        function setUInt32(_arg_1:int, _arg_2:uint):void;
        function getUInt32(_arg_1:int):uint;
        function setObject(_arg_1:int, _arg_2:ISerialize):void;
        function getObject(_arg_1:int, _arg_2:Class):Object;
        function get currentBytes():int;
        function get maxBytes():int;
        function flush():void;

    }
}
