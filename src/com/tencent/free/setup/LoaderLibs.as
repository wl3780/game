// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.setup.LoaderLibs

package com.tencent.free.setup
{
    import com.tencent.free.phase.IPhase;
    import com.tencent.free.phase.IPhaseListener;
    import com.tencent.free.core.swf.SwfFileLoader;
    import __AS3__.vec.Vector;
    import com.tencent.free.setup.data.LibDef;
    import com.tencent.free.logging.logToLabel;
    import com.tencent.free.core.events.SwfLoadEvent;
    import com.tencent.free.core.manager.content.IContent;
    import com.tencent.free.core.lib.CLASS;
    import  ©init._SafeStr_65;

    public class LoaderLibs implements IPhase 
    {

        protected var m_listener:IPhaseListener;
        protected var m_completed:Boolean = false;
        protected var m_globalXML:LoaderGlobal;
        protected var m_swfloader:SwfFileLoader;
        protected var m_libConfs:Vector.<LibDef>;
        protected var m_total:int = 0;
        protected var m_index:int = 0;
        protected var m_libConf:LibDef;

        public function LoaderLibs(_arg_1:LoaderGlobal)
        {
            this.m_globalXML = _arg_1;
        }

        protected function progress(_arg_1:SwfLoadEvent):void
        {
            var _local_2:int = ((_arg_1.bytesLoaded / _arg_1.bytesTotal) * 100);
            this.m_listener.progress(_local_2, this.m_index, this.m_total);
            logToLabel((((("正在加载[" + this.m_libConf.name) + "] ") + _local_2) + "%"));
        }

        protected function state(_arg_1:SwfLoadEvent):void
        {
            var _local_2:IContent = this.m_swfloader.content;
            _local_2.removeEventListener(SwfLoadEvent.COMPLETE, this.state);
            _local_2.removeEventListener(SwfLoadEvent.ERROR, this.state);
            _local_2.removeEventListener(SwfLoadEvent.PROGRESS, this.progress);
            this.m_swfloader = null;
            if (_arg_1.type == SwfLoadEvent.COMPLETE){
                this.next();
            } else {
                this.m_listener.error(((("[" + this.m_libConf.name) + "] 加载失败 错误码:") + _arg_1.code));
            };
        }

        protected function next():void
        {
            if ((((this.m_total == 0)) || ((this.m_index >= this.m_total)))){
                logToLabel("");
                this.m_completed = true;
                this.m_listener.next();
                return;
            };
            this.m_libConf = this.m_libConfs[this.m_index];
            this.m_index++;
            logToLabel((("正在加载[" + this.m_libConf.name) + "]"));
            this.m_swfloader = CLASS.current.addLoader(this.m_libConf.key, this.m_libConf.src, this.m_libConf.hash);
            this.m_swfloader.saveSO = true;
            var _local_1:IContent = this.m_swfloader.content;
            _local_1.addEventListener(SwfLoadEvent.COMPLETE, this.state);
            _local_1.addEventListener(SwfLoadEvent.ERROR, this.state);
            _local_1.addEventListener(SwfLoadEvent.PROGRESS, this.progress);
            this.m_swfloader.load();
        }

        public function start():void
        {
            this.m_libConfs = this.m_globalXML.getLibs();
            this.m_index = 0;
            this.m_total = (((this.m_libConfs == null)) ? 0 : this.m_libConfs.length);
            this.next();
        }

        public function isCompleted():Boolean
        {
            return (this.m_completed);
        }

        public function setListener(_arg_1:IPhaseListener):void
        {
            this.m_listener = _arg_1;
        }

        public function getMessage():String
        {
            return ("类库加载");
        }

        public function unload():void
        {
            this.m_total = 0;
            this.m_index = 0;
            this.m_libConf = null;
        }

        public /*  ©init. */ function _SafeStr_65()
        {
        }


    }
}//package com.tencent.free.setup

// _SafeStr_65 = " LoaderLibs" (String#1559)


