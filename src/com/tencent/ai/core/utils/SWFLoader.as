package com.tencent.ai.core.utils
{
    import com.tencent.free.core.events.SwfLoadEvent;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.swf.ISwf;
    import com.tencent.free.core.swf.SwfFileLoader;
    import com.tencent.free.utils.CFunction;
    import com.tencent.free.utils.GabageCollection;
    import com.tencent.free.utils.Schedule;
    
    import flash.events.ErrorEvent;
    import flash.events.Event;
    import flash.events.EventDispatcher;

    public class SWFLoader extends EventDispatcher 
    {

        private static var _CONTENT_GC:GabageCollection;

        protected var m_content:Object;
        protected var m_priority:int;
        protected var m_saveSO:Boolean;
        protected var m_swffileLoader:SwfFileLoader;
        protected var m_url:String;

        public function SWFLoader(priority:int=1000, saveSO:Boolean=false)
        {
            this.initThis(priority, saveSO);
        }

        protected function initThis(priority:int, saveSO:Boolean):void
        {
            this.m_priority = priority;
            this.m_saveSO = saveSO;
            if (_CONTENT_GC == null) {
                _CONTENT_GC = new GabageCollection();
            }
        }

        protected function listen(add:Boolean):void
        {
            if (this.m_swffileLoader == null) {
                return;
            }
            var content:IContent = this.m_swffileLoader.content;
            if (add) {
                content.addEventListener(SwfLoadEvent.COMPLETE, this.onCompleteEvent);
                content.addEventListener(SwfLoadEvent.ERROR, this.onErrorEvent);
            } else {
                content.removeEventListener(SwfLoadEvent.COMPLETE, this.onCompleteEvent);
                content.removeEventListener(SwfLoadEvent.ERROR, this.onErrorEvent);
            }
        }

        protected function onErrorEvent(evt:SwfLoadEvent):void
        {
            this.dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, evt.message));
        }

        protected function onCompleteEvent(evt:Event, content:Object=null):void
        {
            if (content == null) {
                this.m_content = ISwf(this.m_swffileLoader.content).getContent();
            } else {
                this.m_content = content;
            }
            this.dispatchEvent(new Event(Event.COMPLETE));
        }

        public function getContent():Object
        {
            return this.m_content;
        }

        public function getSWFFileLoader():SwfFileLoader
        {
            return this.m_swffileLoader;
        }

        public function load(loadKey:String, hash:String=""):void
        {
            this.unload();
            var content:Object = _CONTENT_GC.find(loadKey);
            if (content == null) {
                this.m_swffileLoader = new SwfFileLoader(loadKey);
                this.m_swffileLoader.url = loadKey;
                this.m_swffileLoader.hash = hash;
                this.m_swffileLoader.priority = this.m_priority;
                this.m_swffileLoader.saveSO = this.m_saveSO;
                this.listen(true);
                this.m_url = loadKey;
                this.m_swffileLoader.load();
            } else {
                Schedule.addInvoke(new CFunction(this.onCompleteEvent, this, [null, content]), 1);
            }
        }

        public function unload():void
        {
            if (this.m_content != null) {
                if (this.m_url != "") {
                    _CONTENT_GC.gc(this.m_content, this.m_url);
                    this.m_url = "";
                }
                this.m_content = null;
            }
            if (this.m_swffileLoader != null) {
                this.listen(false);
                this.m_swffileLoader.unload();
                this.m_swffileLoader = null;
            }
        }

    }
}
