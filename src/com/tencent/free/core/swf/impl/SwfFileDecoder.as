// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.swf.impl.SwfFileDecoder

package com.tencent.free.core.swf.impl
{
    import flash.events.EventDispatcher;
    import flash.display.DisplayObject;
    import flash.display.Loader;
    import flash.utils.ByteArray;
    import flash.system.LoaderContext;
    import flash.events.IEventDispatcher;
    import com.tencent.free.core.lib.CLASS;
    import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import  ©init._SafeStr_42;

    public class SwfFileDecoder extends EventDispatcher 
    {

        public var content:DisplayObject;
        private var _loader:Loader;
        private var _bytes:ByteArray;
        private var _context:LoaderContext;

        public function SwfFileDecoder(_arg_1:IEventDispatcher=null)
        {
            super(_arg_1);
        }

        public function loadBytes(_arg_1:ByteArray, _arg_2:LoaderContext=null):void
        {
            this.unload();
            if (this._loader == null){
                this._loader = new Loader();
            };
            this._bytes = _arg_1;
            this._context = _arg_2;
            if (CLASS.USE_IN_AIR){
                if (this._context == null){
                    this._context = new LoaderContext();
                };
                this._context["allowLoadBytesCodeExecution"] = true;
            };
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onSwfComplete);
            this._loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSwfSecurityError);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
            this._loader.loadBytes(this._bytes, this._context);
        }

        public function unload():void
        {
            if (this._loader){
                this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onSwfComplete);
                this._loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSwfSecurityError);
                this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
                this._loader.unload();
            };
            this._bytes = null;
            this._context = null;
            this.content = null;
        }

        private function onSwfComplete(_arg_1:Event):void
        {
            var _local_2:int;
            if (this._loader.contentLoaderInfo.bytes){
                _local_2 = 0;
                do  {
                } while (_local_2 < 7);
            };
            this.content = this._loader.content;
            this._loader.unload();
            this.dispatchEvent(_arg_1);

//!!! Invalid/corrupt action data, import aborted for this method body.
        }

        private function onSwfError(_arg_1:IOErrorEvent):void
        {
            this.dispatchEvent(_arg_1);
        }

        private function onSwfSecurityError(_arg_1:SecurityErrorEvent):void
        {
        }

        public /*  ©init. */ function _SafeStr_42()
        {
        }


    }
}//package com.tencent.free.core.swf.impl

// _SafeStr_42 = " SwfFileDecoder" (String#1517)


