// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.SWFLoader

package com.tencent.ai.core.utils
{
    import flash.events.EventDispatcher;
    import com.tencent.free.utils.GabageCollection;
    import com.tencent.free.core.swf.SwfFileLoader;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.events.SwfLoadEvent;
    import flash.events.ErrorEvent;
    import com.tencent.free.core.swf.ISwf;
    import flash.events.Event;
    import com.tencent.free.utils.Schedule;
    import com.tencent.free.utils.CFunction;

    public class SWFLoader extends EventDispatcher 
    {

        private static var _CONTENT_GC:GabageCollection;

        protected var m_content:Object;
        protected var m_priority:int;
        protected var m_saveSO:Boolean;
        protected var m_swffileLoader:SwfFileLoader;
        protected var m_url:String;

        public function SWFLoader(_arg_1:int=1000, _arg_2:Boolean=false)
        {
            this.initThis(_arg_1, _arg_2);
        }

        protected function initThis(_arg_1:int, _arg_2:Boolean):void
        {
            this.m_priority = this.m_priority;
            this.m_saveSO = _arg_2;
            if (_CONTENT_GC == null){
                _CONTENT_GC = new GabageCollection();
            };
        }

        protected function listen(_arg_1:Boolean):void
        {
            if (this.m_swffileLoader == null){
                return;
            };
            var _local_2:IContent = this.m_swffileLoader.content;
            if (_arg_1){
                _local_2.addEventListener(SwfLoadEvent.COMPLETE, this.onCompleteEvent);
                _local_2.addEventListener(SwfLoadEvent.ERROR, this.onErrorEvent);
            } else {
                _local_2.removeEventListener(SwfLoadEvent.COMPLETE, this.onCompleteEvent);
                _local_2.removeEventListener(SwfLoadEvent.ERROR, this.onErrorEvent);
            };
        }

        protected function onErrorEvent(_arg_1:SwfLoadEvent):void
        {
            dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, _arg_1.message));
        }

        protected function onCompleteEvent(_arg_1:Event, _arg_2:Object=null):void
        {
            if (_arg_2 == null){
                this.m_content = ISwf(this.m_swffileLoader.content).getContent();
            } else {
                this.m_content = _arg_2;
            };
            dispatchEvent(new Event(Event.COMPLETE));
        }

        public function getContent():Object
        {
            return (this.m_content);
        }

        public function getSWFFileLoader():SwfFileLoader
        {
            return (this.m_swffileLoader);
        }

        public function load(_arg_1:String, _arg_2:String=""):void
        {
            this.unload();
            var _local_3:Object = _CONTENT_GC.find(_arg_1);
            if (_local_3 == null){
                this.m_swffileLoader = new SwfFileLoader(_arg_1);
                this.m_swffileLoader.url = _arg_1;
                this.m_swffileLoader.hash = _arg_2;
                this.m_swffileLoader.priority = this.m_priority;
                this.m_swffileLoader.saveSO = this.m_saveSO;
                this.listen(true);
                this.m_url = _arg_1;
                this.m_swffileLoader.load();
            } else {
                Schedule.addInvoke(new CFunction(this.onCompleteEvent, this, [null, _local_3]), 1);
            };
        }

        public function unload():void
        {
            if (this.m_content != null){
                if (this.m_url != ""){
                    _CONTENT_GC.gc(this.m_content, this.m_url);
                    this.m_url = "";
                };
                this.m_content = null;
            };
            if (this.m_swffileLoader != null){
                this.listen(false);
                this.m_swffileLoader.unload();
                this.m_swffileLoader = null;
            };
        }


    }
}//package com.tencent.ai.core.utils

// _namespace_5 = "com.tencent.free.core.swf:ISwf"


