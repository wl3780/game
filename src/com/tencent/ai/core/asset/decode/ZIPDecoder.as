// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.decode.ZIPDecoder

package com.tencent.ai.core.asset.decode
{
    import flash.events.EventDispatcher;
    import deng.fzip.FZip;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import deng.fzip.FZipFile;
    import  ©init._SafeStr_68;
    import __AS3__.vec.*;

    public class ZIPDecoder extends EventDispatcher implements IFileDecoder 
    {

        protected var zip:FZip;
        protected var formats:Vector.<IFormatDecoder>;
        protected var decodeIndex:int;
        protected var decodeCount:int;
        protected var curr_foramt:IFormatDecoder;
        protected var files:Dictionary;

        public function ZIPDecoder()
        {
            this.initThis();
        }

        protected function initThis():void
        {
            this.formats = new Vector.<IFormatDecoder>();
            this.addFileFormat(new FormatTxt());
            this.addFileFormat(new FormatClass());
            this.addFileFormat(new FormatImage());
        }

        protected function onDecoded(_arg_1:Event):void
        {
            var _local_4:Object;
            if (this.files == null){
                this.files = new Dictionary();
            };
            var _local_2:Vector.<Object> = this.curr_foramt.getContents();
            var _local_3:int;
            while (_local_3 < _local_2.length) {
                _local_4 = _local_2[_local_3];
                this.files[_local_4.name] = _local_4.content;
                _local_3++;
            };
            this.curr_foramt.unload();
            this.curr_foramt = null;
            this.doNext();
        }

        protected function decode(_arg_1:String, _arg_2:ByteArray):Boolean
        {
            var _local_5:IFormatDecoder;
            var _local_6:int;
            var _local_7:String;
            var _local_3:int = this.formats.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = this.formats[_local_4];
                _local_6 = _arg_1.lastIndexOf(".");
                _local_7 = "";
                if (_local_6 != -1){
                    _local_7 = _arg_1.substr((_local_6 + 1));
                };
                if (_local_5.support(_arg_1, _local_7, _arg_2)){
                    return (true);
                };
                _local_4++;
            };
            return (false);
        }

        protected function doNext():void
        {
            if (this.decodeIndex < this.decodeCount){
                this.curr_foramt = this.formats[this.decodeIndex];
                var _local_1 = this;
                var _local_2 = (_local_1.decodeIndex + 1);
                _local_1.decodeIndex = _local_2;
                if (this.curr_foramt.isEmpty()){
                    this.doNext();
                } else {
                    this.curr_foramt.start();
                };
            } else {
                dispatchEvent(new Event(Event.COMPLETE));
            };
        }

        public function addFileFormat(_arg_1:IFormatDecoder):void
        {
            _arg_1.addEventListener(Event.COMPLETE, this.onDecoded);
            this.formats.push(_arg_1);
            this.decodeCount = this.formats.length;
        }

        public function load(_arg_1:String, _arg_2:ByteArray):void
        {
            var _local_5:FZipFile;
            this.zip = new FZip();
            this.zip.loadBytes(_arg_2);
            this.decodeIndex = 0;
            var _local_3:int = this.zip.getFileCount();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = this.zip.getFileAt(_local_4);
                this.decode(_local_5.filename, _local_5.content);
                _local_4++;
            };
            this.doNext();
        }

        public function findFile(_arg_1:String, _arg_2:Array=null):Object
        {
            return (this.files[_arg_1]);
        }

        public function unload():void
        {
            this.zip = null;
            this.files = null;
            this.decodeIndex = 0;
            this.decodeCount = 0;
        }

        public /*  ©init. */ function _SafeStr_68()
        {
        }


    }
}//package com.tencent.ai.core.asset.decode

// _SafeStr_68 = " ZIPDecoder" (String#17411)


