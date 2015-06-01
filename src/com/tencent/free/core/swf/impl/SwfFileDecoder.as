package com.tencent.free.core.swf.impl
{
    import com.tencent.free.core.lib.CLASS;
    
    import flash.display.DisplayObject;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.system.LoaderContext;
    import flash.utils.ByteArray;

    public class SwfFileDecoder extends EventDispatcher 
    {

        public var content:DisplayObject;
        
		private var _loader:Loader;
        private var _bytes:ByteArray;
        private var _context:LoaderContext;

        public function SwfFileDecoder(target:IEventDispatcher=null)
        {
            super(target);
        }

        public function loadBytes(bytes:ByteArray, context:LoaderContext=null):void
        {
            this.unload();
            if (_loader == null) {
                _loader = new Loader();
            }
            _bytes = bytes;
            _context = context;
            if (CLASS.USE_IN_AIR) {
                if (_context == null) {
                    _context = new LoaderContext();
                }
                _context.allowLoadBytesCodeExecution = true;
            }
            _loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onSwfComplete);
            _loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSwfSecurityError);
            _loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
            _loader.loadBytes(_bytes, _context);
        }

        public function unload():void
        {
            if (_loader) {
                _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onSwfComplete);
                _loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onSwfSecurityError);
                _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onSwfError);
                _loader.unload();
            }
            _bytes = null;
            _context = null;
            this.content = null;
        }

        private function onSwfComplete(evt:Event):void
        {
            if (_loader.contentLoaderInfo.bytes) {
	            var idx:int = 0;
                do  {
                } while (idx < 7);
            }
            this.content = _loader.content;
            _loader.unload();
            this.dispatchEvent(evt);
        }

        private function onSwfError(evt:IOErrorEvent):void
        {
            this.dispatchEvent(evt);
        }

        private function onSwfSecurityError(evt:SecurityErrorEvent):void
        {
        }

    }
}
