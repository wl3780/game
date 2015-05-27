// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.FormatImage

package com.tencent.ai.core.asset.decode
{
    import __AS3__.vec.Vector;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.display.Bitmap;
    import  ©init._SafeStr_65;
    import __AS3__.vec.*;

    public class FormatImage extends BaseFormat 
    {

        public static var g_order:int = 1;

        protected var m_isError:Boolean;
        protected var m_todo:Vector.<Object>;
        protected var m_order:int;

        public function FormatImage()
        {
            extNames.push("png");
            this.m_isError = false;
            this.m_todo = new Vector.<Object>();
            this.m_order = g_order++;
        }

        override public function start():void
        {
            var _local_2:Object;
            var _local_3:String;
            var _local_4:Loader;
            var _local_1:int;
            while (_local_1 < tasklist.length) {
                _local_2 = tasklist[_local_1];
                _local_3 = ((this.m_order.toString() + "_") + _local_2.name);
                _local_4 = new Loader();
                _local_4.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoadImage);
                _local_4.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onLoadImage);
                _local_4.loadBytes(_local_2.bytes, new LoaderContext(false, new ApplicationDomain()));
                _local_4["key"] = _local_3;
                this.m_todo.push(_local_2);
                _local_1++;
            };
            if (this.m_todo.length == 0){
                complete();
            };
        }

        protected function onLoadImage(_arg_1:Event):void
        {
            var _local_2:Loader;
            var _local_3:String;
            var _local_4:int;
            var _local_5:Object;
            var _local_6:String;
            var _local_7:Bitmap;
            if (!this.m_isError){
                _local_2 = (_arg_1.target as Loader);
                _local_3 = _local_2["key"];
                _local_2.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onLoadImage);
                _local_2.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onLoadImage);
                if (Event.COMPLETE == _arg_1.type){
                    _local_4 = 0;
                    while (_local_4 < this.m_todo.length) {
                        _local_5 = this.m_todo[_local_4];
                        _local_6 = ((this.m_order.toString() + "_") + _local_5.name);
                        if (_local_6 == _local_3){
                            _local_7 = Bitmap(_local_2.content);
                            _local_5.content = _local_7.bitmapData;
                            this.m_todo.splice(_local_4, 1);
                            break;
                        };
                        _local_4++;
                    };
                    if (this.m_todo.length == 0){
                        complete();
                    };
                } else {
                    this.m_isError = true;
                    this.dispatchEvent(new Event("error"));
                };
            };
        }

        override public function unload():void
        {
            super.unload();
            tasklist = null;
            this.m_todo = null;
            this.m_isError = false;
        }

        public /*  ©init. */ function _SafeStr_65()
        {
        }


    }
}//package com.tencent.ai.core.asset.decode

// _SafeStr_65 = " FormatImage" (String#16514)


