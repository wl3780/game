// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.mff.MFF

package com.tencent.free.mff
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import flash.utils.ByteArray;
    import flash.utils.Endian;
    import  ©init._SafeStr_48;
    import __AS3__.vec.*;

    public class MFF extends EventDispatcher 
    {

        public static const MFF_HEAD_LENGTH:int = 16;
        public static const MFF_MAGIC:uint = 0x1700FF;
        public static const MFF_VERSION:uint = 20120709;
        public static const MFF_COMPRESS_ZLIB:int = 4660;
        public static const MFF_ERROR_LESSBYTES:int = -1;
        public static const MFF_ERROR_MISMATCHMAGICE:int = -2;
        public static const MFF_ERROR_MISMATCHVERSION:int = -3;

        protected var m_mffMagic:uint;
        protected var m_mffVersion:uint;
        protected var m_mffLength:uint;
        protected var m_mffCompress:int;
        protected var m_mffCount:int;
        protected var m_mffFiles:Vector.<MFFFile>;
        protected var m_mffFileDict:Dictionary;
        protected var m_decodeClearSource:Boolean;
        protected var m_source:ByteArray;
        protected var m_fileClass:Class;
        protected var m_decoded:Boolean;
        protected var m_errorCode:int;

        public function MFF(_arg_1:Boolean=false, _arg_2:Class=null, _arg_3:ByteArray=null)
        {
            this.m_decodeClearSource = _arg_1;
            this.m_source = _arg_3;
            this.m_fileClass = (((_arg_2 == null)) ? (MFFFile) : _arg_2);
            this.m_mffCompress = MFF_COMPRESS_ZLIB;
            this.m_decoded = false;
            this.m_errorCode = 0;
        }

        public function decode(_arg_1:ByteArray=null):void
        {
            var _local_2:uint;
            var _local_3:ByteArray;
            var _local_4:int;
            var _local_5:MFFFile;
            if (this.m_decoded){
                this.dispose();
            };
            if (_arg_1 != null){
                this.m_source = _arg_1;
            };
            if (((!((this.m_source == null))) && ((this.m_source.length > MFF_HEAD_LENGTH)))){
                this.m_source.position = 0;
                this.m_source.endian = Endian.BIG_ENDIAN;
                _local_2 = this.m_source.readUnsignedInt();
                if ((_local_2 & (MFF_MAGIC == MFF_MAGIC))){
                    this.m_mffVersion = this.m_source.readUnsignedInt();
                    this.m_mffLength = this.m_source.readUnsignedInt();
                    this.m_mffCompress = this.m_source.readUnsignedShort();
                    this.m_mffCount = this.m_source.readUnsignedShort();
                    if (this.m_mffVersion <= MFF_VERSION){
                        _local_3 = new ByteArray();
                        this.m_source.readBytes(_local_3, 0, this.m_mffLength);
                        if (this.m_mffCompress == MFF_COMPRESS_ZLIB){
                            _local_3.uncompress();
                        };
                        this.m_mffFiles = new Vector.<MFFFile>();
                        this.m_mffFileDict = new Dictionary();
                        _local_4 = 0;
                        while (_local_4 < this.m_mffCount) {
                            _local_5 = MFFFile(new this.m_fileClass());
                            _local_5.readExternal(_local_3);
                            this.addFile(_local_5);
                            _local_4++;
                        };
                        _local_3.clear();
                        _local_3 = null;
                    } else {
                        this.m_errorCode = MFF_ERROR_MISMATCHVERSION;
                    };
                    this.m_decoded = true;
                } else {
                    this.m_errorCode = MFF_ERROR_MISMATCHMAGICE;
                };
            } else {
                this.m_errorCode = MFF_ERROR_LESSBYTES;
            };
            if (((this.m_decodeClearSource) && (!((this.m_source == null))))){
                this.m_source.clear();
            };
            this.m_source = null;
        }

        public function encode():ByteArray
        {
            var _local_3:int;
            var _local_1:ByteArray = new ByteArray();
            if (this.m_mffFiles){
                this.m_mffCount = this.m_mffFiles.length;
                _local_3 = 0;
                while (_local_3 < this.m_mffCount) {
                    this.m_mffFiles[_local_3].writeExternal(_local_1);
                    _local_3++;
                };
                if (this.m_mffCompress == MFF_COMPRESS_ZLIB){
                    _local_1.compress();
                };
            };
            var _local_2:ByteArray = new ByteArray();
            _local_2.writeUnsignedInt((MFF_MAGIC | uint((Math.random() * uint.MAX_VALUE))));
            _local_2.writeUnsignedInt(MFF_VERSION);
            _local_2.writeUnsignedInt(_local_1.length);
            _local_2.writeShort(this.m_mffCompress);
            _local_2.writeShort(this.m_mffCount);
            _local_2.writeBytes(_local_1);
            _local_1.clear();
            _local_1 = null;
            return (_local_2);
        }

        public function set mffCompress(_arg_1:int):void
        {
            this.m_mffCompress = _arg_1;
        }

        public function get mffCompress():int
        {
            return (this.m_mffCompress);
        }

        public function addFile(_arg_1:MFFFile):void
        {
            if (this.m_mffFileDict == null){
                this.m_mffFileDict = new Dictionary();
                this.m_mffFiles = new Vector.<MFFFile>();
            };
            if (this.m_mffFileDict[_arg_1.mffName] == null){
                this.m_mffFileDict[_arg_1.mffName] = _arg_1;
                this.m_mffFiles.push(_arg_1);
            };
        }

        public function removeFile(_arg_1:MFFFile):void
        {
            var _local_2:int;
            if (this.m_mffFileDict != null){
                _local_2 = this.m_mffFiles.indexOf(_arg_1);
                if (_local_2 != -1){
                    delete this.m_mffFileDict[_arg_1.mffName];
                    this.m_mffFiles.splice(_local_2, 1);
                };
            };
        }

        public function getErrorCode():int
        {
            return (this.m_errorCode);
        }

        public function getMMFFiles():Vector.<MFFFile>
        {
            return (this.m_mffFiles);
        }

        public function getMMFFileByName(_arg_1:String):MFFFile
        {
            return ((((this.m_mffFileDict == null)) ? (null) : this.m_mffFileDict[_arg_1]));
        }

        public function dispose():void
        {
            var _local_1:int;
            var _local_2:int;
            if (this.m_decoded){
                this.m_errorCode = 0;
                this.m_decoded = false;
                _local_1 = this.m_mffFiles.length;
                _local_2 = 0;
                while (_local_2 < _local_1) {
                    this.m_mffFiles[_local_2].dispose();
                    _local_2++;
                };
                this.m_mffFiles = null;
                this.m_mffFileDict = null;
            };
            if (((!((this.m_source == null))) && (this.m_decodeClearSource))){
                this.m_source.clear();
                this.m_source = null;
            };
        }

        public /*  ©init. */ function _SafeStr_48()
        {
        }


    }
}//package com.tencent.free.mff

// _SafeStr_48 = " MFF" (String#1514)


