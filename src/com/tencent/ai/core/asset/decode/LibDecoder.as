// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.LibDecoder

package com.tencent.ai.core.asset.decode
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import com.tencent.free.core.lib.CLASS;
    import  ©init._SafeStr_67;
    import __AS3__.vec.*;

    public class LibDecoder extends EventDispatcher implements IFileDecoder 
    {

        protected var m_formats:Vector.<IFormatDecoder>;
        protected var m_decodeIndex:int;
        protected var m_decodeCount:int;
        protected var m_currFormat:IFormatDecoder;
        protected var m_files:Dictionary;
        protected var m_name:String;

        public function LibDecoder()
        {
            this.m_formats = new Vector.<IFormatDecoder>();
            this.addFileFormat(new FormatClass());
        }

        protected function onDecoded(_arg_1:Event):void
        {
            var _local_4:Object;
            if (this.m_files == null){
                this.m_files = new Dictionary();
            };
            var _local_2:Vector.<Object> = this.m_currFormat.getContents();
            var _local_3:int;
            while (_local_3 < _local_2.length) {
                _local_4 = _local_2[_local_3];
                this.m_files[_local_4.name] = _local_4.content;
                _local_3++;
            };
            this.m_currFormat.unload();
            this.m_currFormat = null;
            this.doNext();
        }

        protected function decode(_arg_1:String, _arg_2:ByteArray):Boolean
        {
            var _local_3:IFormatDecoder = this.m_formats[0];
            if (_local_3.support(_arg_1, "swf", _arg_2)){
                return (true);
            };
            return (false);
        }

        protected function doNext():void
        {
            if (this.m_decodeIndex < this.m_decodeCount){
                this.m_currFormat = this.m_formats[this.m_decodeIndex];
                var _local_1 = this;
                var _local_2 = (_local_1.m_decodeIndex + 1);
                _local_1.m_decodeIndex = _local_2;
                if (this.m_currFormat.isEmpty()){
                    this.doNext();
                } else {
                    this.m_currFormat.start();
                };
            } else {
                dispatchEvent(new Event(Event.COMPLETE));
            };
        }

        public function addFileFormat(_arg_1:IFormatDecoder):void
        {
            _arg_1.addEventListener(Event.COMPLETE, this.onDecoded);
            this.m_formats.push(_arg_1);
            this.m_decodeCount = this.m_formats.length;
        }

        public function load(_arg_1:String, _arg_2:ByteArray):void
        {
            this.m_name = _arg_1;
            this.decode(_arg_1, _arg_2);
            this.doNext();
        }

        public function findFile(_arg_1:String, _arg_2:Array=null):Object
        {
            var _local_3:CLASS = (this.m_files[this.m_name] as CLASS);
            return (_local_3.tryNewInstance(_arg_1));
        }

        public function unload():void
        {
            var _local_1:CLASS;
            if (this.m_files != null){
                for each (_local_1 in this.m_files) {
                    _local_1.dispose();
                };
                this.m_files = null;
            };
            this.m_decodeIndex = 0;
            this.m_decodeCount = 0;
        }

        public /*  ©init. */ function _SafeStr_67()
        {
        }


    }
}//package com.tencent.ai.core.asset.decode

// _SafeStr_67 = " LibDecoder" (String#14435)


