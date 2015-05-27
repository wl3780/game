// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.FormatClass

package com.tencent.ai.core.asset.decode
{
    import com.tencent.free.core.swf.SwfFileLoader;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.core.events.SwfLoadEvent;
    import  ©init._SafeStr_64;

    public class FormatClass extends BaseFormat 
    {

        protected var m_currIndex:int = 0;
        protected var m_currItem:Object;
        protected var m_currLoader:SwfFileLoader;

        public function FormatClass()
        {
            extNames.push("asc", "swf");
        }

        override public function start():void
        {
            this.m_currIndex = 0;
            this.doNext();
        }

        protected function doNext():void
        {
            if (this.m_currIndex >= tasklist.length){
                complete();
                return;
            };
            this.m_currItem = tasklist[this.m_currIndex];
            this.m_currIndex++;
            var _local_1:CLASS = new CLASS(CLASS.current);
            this.m_currItem.content = _local_1;
            this.m_currLoader = _local_1.addLoader(this.m_currItem.name);
            this.m_currLoader.setSwfBytes(this.m_currItem.bytes);
            this.m_currLoader.content.addEventListener(SwfLoadEvent.COMPLETE, this.onState);
            this.m_currLoader.content.addEventListener(SwfLoadEvent.ERROR, this.onState);
            this.m_currLoader.load();
        }

        protected function onState(_arg_1:SwfLoadEvent):void
        {
            this.m_currLoader.content.removeEventListener(SwfLoadEvent.COMPLETE, this.onState);
            this.m_currLoader.content.removeEventListener(SwfLoadEvent.ERROR, this.onState);
            this.m_currItem.bytes = null;
            this.doNext();
        }

        override public function unload():void
        {
            if (this.m_currLoader != null){
                this.m_currLoader.content.removeEventListener(SwfLoadEvent.COMPLETE, this.onState);
                this.m_currLoader.content.removeEventListener(SwfLoadEvent.ERROR, this.onState);
                this.m_currLoader = null;
            };
            super.unload();
        }

        public /*  ©init. */ function _SafeStr_64()
        {
        }


    }
}//package com.tencent.ai.core.asset.decode

// _SafeStr_64 = " FormatClass" (String#15356)


