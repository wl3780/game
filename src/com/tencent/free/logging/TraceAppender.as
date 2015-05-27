// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.logging.TraceAppender

package com.tencent.free.logging
{
    import flash.events.EventDispatcher;
    import flash.display.Sprite;
    import flash.net.FileReference;
    import flash.text.TextField;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import  ©init._SafeStr_47;
    import __AS3__.vec.*;

    public class TraceAppender extends EventDispatcher implements IAppender 
    {

        private static var _root:Sprite;
        private static var _file:FileReference;
        private static var _txt:TextField;
        private static var _traceAppender:TraceAppender;
        private static var _cacheTraceOutput:Function;

        protected var m_filters:Vector.<String>;
        public var traceFunc:Function = null;
        private var _msgBuffer:Vector.<String>;
        private var _txt:TextField;


        public static function msgBufferSaveAs(_arg_1:Event):void
        {
            var _local_2:ByteArray;
            var _local_3:String;
            if (_file == null){
                _file = new FileReference();
            };
            if (LoggingDefine.msgBuffer.length > 0){
                _local_2 = new ByteArray();
                _local_2.writeByte(239);
                _local_2.writeByte(187);
                _local_2.writeByte(191);
                _local_3 = LoggingDefine.msgBuffer.join("\r\n");
                _local_2.writeUTFBytes(_local_3);
                _file.save(_local_2, (new Date().time + "_log.txt"));
            };
            LoggingDefine.msgBuffer.length = 0;
        }

        public static function msgBufferPrint(_arg_1:Event):void
        {
            if (_txt == null){
                _txt = new TextField();
                _txt.width = _root.stage.stageWidth;
                _txt.height = 170;
                _txt.background = true;
                _txt.backgroundColor = 0x222222;
                _txt.textColor = 0xFF00FF;
                _txt.alpha = 0.6;
            };
            if (_root.stage.contains(_txt)){
                _txt.text = "";
                _root.stage.removeChild(_txt);
                _traceAppender.traceFunc = _cacheTraceOutput;
            } else {
                _root.stage.addChild(_txt);
                _cacheTraceOutput = _traceAppender.traceFunc;
                _traceAppender.traceFunc = txtOutput;
            };
        }

        public static function txtOutput(_arg_1:String, _arg_2:int):void
        {
            _txt.appendText(("\n" + _arg_1));
            _txt.scrollV = _txt.maxScrollV;
        }


        public function write(_arg_1:String, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:int;
            if (this.traceFunc == null){
                if (this.m_filters != null){
                    _local_3 = this.m_filters.length;
                    _local_4 = 0;
                    while (_local_4 < _local_3) {
                        if (_arg_1.indexOf(this.m_filters[_local_4]) != -1){
                            return;
                        };
                        _local_4++;
                    };
                };
            } else {
                this.traceFunc(_arg_1, _arg_2);
            };
        }

        public function addFilter(_arg_1:Object):void
        {
            var _local_2:String;
            if (_arg_1 == ""){
                return;
            };
            if (this.m_filters == null){
                this.m_filters = new Vector.<String>();
            };
            if ((_arg_1 is String)){
                _local_2 = String(_arg_1);
                if (this.m_filters.indexOf(_local_2) == -1){
                    this.m_filters.push(_local_2);
                };
            } else {
                if ((_arg_1 is Array)){
                    this.m_filters.push.apply(this.m_filters, _arg_1);
                };
            };
        }

        public function removeFilter(_arg_1:Object):void
        {
            var _local_3:int;
            var _local_2:String = String(_arg_1);
            if (this.m_filters != null){
                _local_3 = this.m_filters.indexOf(_local_2);
                if (_local_3 != -1){
                    this.m_filters.splice(_local_3, 1);
                };
            };
        }

        public function clearFilters():void
        {
            this.m_filters = null;
        }

        public function openMsgCache(_arg_1:Sprite, _arg_2:int=0):void
        {
            _root = _arg_1;
            _traceAppender = this;
            if (this._msgBuffer == null){
                this._msgBuffer = LoggingDefine.msgBuffer;
            };
            LoggingDefine.msgBufferSize = (((_arg_2)!=0) ? _arg_2 : LoggingDefine.msgBufferSize);
            this.traceFunc = this.traceOutput;
        }

        public function traceOutput(_arg_1:String, _arg_2:int):void
        {
            this._msgBuffer.push(_arg_1);
            if (this._msgBuffer.length > LoggingDefine.msgBufferSize){
                this._msgBuffer.shift();
            };
        }

        public /*  ©init. */ function _SafeStr_47()
        {
        }


    }
}//package com.tencent.free.logging

// _SafeStr_47 = " TraceAppender" (String#1442)


