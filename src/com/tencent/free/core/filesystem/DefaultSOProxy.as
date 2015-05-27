// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.filesystem.DefaultSOProxy

package com.tencent.free.core.filesystem
{
    import flash.events.EventDispatcher;
    import flash.net.SharedObject;
    import com.tencent.free.core.events.SOEvent;
    import flash.net.SharedObjectFlushStatus;
    import flash.events.NetStatusEvent;
    import flash.utils.ByteArray;
    import  ©init._SafeStr_12;

    public class DefaultSOProxy extends EventDispatcher implements ISOProxy 
    {

        private var _name:String = "";
        private var _enabled:Boolean = false;
        private var _sharedObject:SharedObject;


        private function onInitResult():void
        {
            var _local_1:SOEvent = new SOEvent(SOEvent.SO_INIT_RESULT);
            _local_1.result = this._enabled;
            dispatchEvent(_local_1);
        }

        private function netStatusEvent

        // Error while decompiling!


        private function keyToName(_arg_1:String):String
        {
            var _local_2:int = _arg_1.indexOf("://");
            if (_local_2 != -1){
                return (_arg_1.substr((_local_2 + 3)));
            };
            return (_arg_1);
        }

        public function tryOpen(_arg_1:String="17xf.qq.com"):Boolean
        {
            (this._name = _arg_1);
            var _local_3 = SharedObject.getLocal(this._name, "/");
            this._sharedObject = _local_3;
            _local_3;
            var _local_2:Object = this._sharedObject.data["isMaxSize"];
            return ((_local_2 == true));
        }

        public function open(_arg_1:String="17xf.qq.com"):void
        {
            var _local_2:String;
            (this._name = _arg_1);
            (this._sharedObject = SharedObject.getLocal(this._name, "/"));
            _local_2 = this._sharedObject.flush(((0x0400 * 0x0400) * 100));
            _local_2;
            if (_local_2 == SharedObjectFlushStatus.PENDING){
                this._sharedObject.addEventListener(NetStatusEvent.NET_STATUS, this.netStatusEvent);
            } else {
            };

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        public function saveFile(key:Object, path:String, bytes:ByteArray):Boolean
        {
            var so:SharedObject;
            if (this._enabled){
                if (this._sharedObject.data[key] == path){
                    return (true);
                };
                so = SharedObject.getLocal(this.keyToName((key as String)), "/");
                if (so){
                    so.clear();
                    (so.data["key"] = key);
                    (so.data["path"] = path);
                    (so.data["bytes"] = bytes);
                    so.flush(((0x0400 * 0x0400) * 100));
                    so.close();
                    var _local_5 = null;
                    so = _local_5;
                    _local_5;
                    (this._sharedObject.data[key] = path);
                    this._sharedObject.flush(((0x0400 * 0x0400) * 100));
                    return (true);
                };
                return (false);
            };
            return (false);

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        public function delFile(_arg_1:Object):void
        {
            var _local_2:ByteArray;
            var _local_3:SharedObject;
            if (this._enabled){
                if (this._sharedObject.data[_arg_1] != null){
                    (this._sharedObject.data[_arg_1] = null);
                    delete this._sharedObject.data[_arg_1];
                    this._sharedObject.flush(((0x0400 * 0x0400) * 100));
                    _local_3 = SharedObject.getLocal(this.keyToName((_arg_1 as String)), "/");
                    if (_local_3){
                        _local_3.clear();
                        _local_3.close();
                        _local_3 = null;
                        _local_3;
                    };
                };
            };

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        public function getFile(_arg_1:Object, _arg_2:String):ByteArray
        {
            var _local_4:String;
            var _local_5:SharedObject;
            var _local_3:ByteArray;
            if (this._enabled){
                if (this._sharedObject.data[_arg_1] != null){
                    _local_4 = this.keyToName((_arg_1 as String));
                    _local_5 = SharedObject.getLocal(_local_4, "/");
                    if (((_local_5) && (_local_5.data))){
                        if ((((_local_5.data["key"] == _arg_1)) && ((_local_5.data["path"] == _arg_2)))){
                            _local_3 = (_local_5.data["bytes"] as ByteArray);
                            _local_3;
                        };
                    };
                };
                if (_local_3 == null){
                    this.delFile(_arg_1);
                };
            };
            return (_local_3);
        }

        public /*  ©init. */ function _SafeStr_12()
        {
        }


    }
}//package com.tencent.free.core.filesystem

// _SafeStr_12 = " DefaultSOProxy" (String#1436)


