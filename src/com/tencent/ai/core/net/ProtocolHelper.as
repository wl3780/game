// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.ProtocolHelper

package com.tencent.ai.core.net
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.events.ProtocolEvent;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.ByteArray;
    import com.tencent.ai.core.events.EventDispatcher2;
    import  ©init._SafeStr_806;

    public class ProtocolHelper 
    {

        private static var _errorCodeDispather:IEventDispatcher;
        private static var _errorCodeEvent:ProtocolEvent;
        private static var _alertEvent:ProtocolEvent;
        public static const OK:uint = 4;
        public static const CANCEL:uint = 8;
        public static var M_PROTOCOL_INSTANCES:Dictionary = new Dictionary();
        public static var M_PROTOCOL_CLASSES:Dictionary = new Dictionary();
        public static var clientPlayerID:PlayerID = new PlayerID();


        public static function CreateADF(_arg_1:uint, _arg_2:uint, _arg_3:Object=null):ADF
        {
            var _local_4:ADFHead = new ADFHead();
            _local_4.playerID = clientPlayerID;
            _local_4.cmdID = _arg_1;
            _local_4.msgID = _arg_2;
            var _local_5:ADF = new ADF(_local_4);
            if ((_arg_3 is ISerialize)){
                _local_5.body = (_arg_3 as ISerialize);
            } else {
                if ((_arg_3 is ByteArray)){
                    _local_5.buf = (_arg_3 as ByteArray);
                };
            };
            return (_local_5);
        }

        public static function get errorCodeDispather():IEventDispatcher
        {
            if (_errorCodeDispather == null){
                _errorCodeDispather = new EventDispatcher2();
                _errorCodeEvent = new ProtocolEvent(ProtocolEvent.PROTOCOL_ERROR_CODE);
                _alertEvent = new ProtocolEvent("alert");
            };
            return (_errorCodeDispather);
        }

        public static function handlerError(_arg_1:uint, _arg_2:int):void
        {
            if (_errorCodeDispather != null){
                _errorCodeEvent.data = {
                    "errorCode":_arg_1,
                    "cmd":_arg_2
                };
                _errorCodeDispather.dispatchEvent(_errorCodeEvent);
            };
        }

        public static function handlerError2(_arg_1:uint, _arg_2:int):void
        {
            if (_errorCodeDispather != null){
                _errorCodeEvent.data = {
                    "errorCode":_arg_1,
                    "cmd":_arg_2,
                    "newHandler":true
                };
                _errorCodeDispather.dispatchEvent(_errorCodeEvent);
            };
        }

        public static function showAlert(_arg_1:String="", _arg_2:uint=4, _arg_3:Function=null, _arg_4:String="", _arg_5:String=""):void
        {
            if (_errorCodeDispather != null){
                _alertEvent.data = {
                    "text":_arg_1,
                    "flags":_arg_2,
                    "closeHandler":_arg_3,
                    "okLabel":_arg_4,
                    "cancelLabel":_arg_5
                };
                _errorCodeDispather.dispatchEvent(_alertEvent);
            };
        }


        public /*  ©init. */ function _SafeStr_806()
        {
        }


    }
}//package com.tencent.ai.core.net

// _SafeStr_806 = " ProtocolHelper" (String#14450)


