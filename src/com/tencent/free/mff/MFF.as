package com.tencent.free.mff
{
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.Endian;

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

        public function MFF(clearSource:Boolean=false, fileClass:Class=null, source:ByteArray=null)
        {
            this.m_decodeClearSource = clearSource;
            this.m_source = source;
            this.m_fileClass = fileClass == null ? MFFFile : fileClass;
            this.m_mffCompress = MFF_COMPRESS_ZLIB;
            this.m_decoded = false;
            this.m_errorCode = 0;
        }

        public function decode(bytes:ByteArray=null):void
        {
            if (this.m_decoded) {
                this.dispose();
            }
            if (bytes != null) {
                this.m_source = bytes;
            }
            if (this.m_source != null && this.m_source.length > MFF_HEAD_LENGTH) {
                this.m_source.position = 0;
                this.m_source.endian = Endian.BIG_ENDIAN;
	            var magicNum:uint  = this.m_source.readUnsignedInt();
                if ((magicNum & MFF_MAGIC) == MFF_MAGIC) {
                    this.m_mffVersion = this.m_source.readUnsignedInt();
                    this.m_mffLength = this.m_source.readUnsignedInt();
                    this.m_mffCompress = this.m_source.readUnsignedShort();
                    this.m_mffCount = this.m_source.readUnsignedShort();
                    if (this.m_mffVersion <= MFF_VERSION) {
			            var tmpBytes:ByteArray = new ByteArray();
                        this.m_source.readBytes(tmpBytes, 0, this.m_mffLength);
                        if (this.m_mffCompress == MFF_COMPRESS_ZLIB) {
                            tmpBytes.uncompress();
                        }
                        this.m_mffFiles = new Vector.<MFFFile>();
                        this.m_mffFileDict = new Dictionary();
			            var idx:int = 0;
                        while (idx < this.m_mffCount) {
				            var file:MFFFile = MFFFile(new this.m_fileClass());
                            file.readExternal(tmpBytes);
                            this.addFile(file);
                            idx++;
                        }
                        tmpBytes.clear();
                        tmpBytes = null;
                    } else {
                        this.m_errorCode = MFF_ERROR_MISMATCHVERSION;
                    }
                    this.m_decoded = true;
                } else {
                    this.m_errorCode = MFF_ERROR_MISMATCHMAGICE;
                }
            } else {
                this.m_errorCode = MFF_ERROR_LESSBYTES;
            }
            if (this.m_decodeClearSource && this.m_source != null) {
                this.m_source.clear();
            }
            this.m_source = null;
        }

        public function encode():ByteArray
        {
            var bytes:ByteArray = new ByteArray();
            if (this.m_mffFiles) {
                this.m_mffCount = this.m_mffFiles.length;
	            var idx:int = 0;
                while (idx < this.m_mffCount) {
                    this.m_mffFiles[idx].writeExternal(bytes);
                    idx++;
                }
                if (this.m_mffCompress == MFF_COMPRESS_ZLIB) {
                    bytes.compress();
                }
            }
            var ret:ByteArray = new ByteArray();
            ret.writeUnsignedInt(MFF_MAGIC | uint(Math.random() * uint.MAX_VALUE));
            ret.writeUnsignedInt(MFF_VERSION);
            ret.writeUnsignedInt(bytes.length);
            ret.writeShort(this.m_mffCompress);
            ret.writeShort(this.m_mffCount);
            ret.writeBytes(bytes);
            bytes.clear();
            bytes = null;
            return ret;
        }

        public function set mffCompress(value:int):void
        {
            this.m_mffCompress = value;
        }

        public function get mffCompress():int
        {
            return this.m_mffCompress;
        }

        public function addFile(file:MFFFile):void
        {
            if (this.m_mffFileDict == null) {
                this.m_mffFileDict = new Dictionary();
                this.m_mffFiles = new Vector.<MFFFile>();
            }
            if (this.m_mffFileDict[file.mffName] == null) {
                this.m_mffFileDict[file.mffName] = file;
                this.m_mffFiles.push(file);
            }
        }

        public function removeFile(file:MFFFile):void
        {
            if (this.m_mffFileDict != null) {
	            var idx:int = this.m_mffFiles.indexOf(file);
                if (idx != -1) {
                    delete this.m_mffFileDict[file.mffName];
                    this.m_mffFiles.splice(idx, 1);
                }
            }
        }

        public function getErrorCode():int
        {
            return this.m_errorCode;
        }

        public function getMMFFiles():Vector.<MFFFile>
        {
            return this.m_mffFiles;
        }

        public function getMMFFileByName(fileName:String):MFFFile
        {
            return this.m_mffFileDict == null ? null : this.m_mffFileDict[fileName];
        }

        public function dispose():void
        {
            if (this.m_decoded) {
                this.m_errorCode = 0;
                this.m_decoded = false;
	            var len:int = this.m_mffFiles.length;
	            var idx:int = 0;
                while (idx < len) {
                    this.m_mffFiles[idx].dispose();
                    idx++;
                }
                this.m_mffFiles = null;
                this.m_mffFileDict = null;
            }
            if (this.m_decodeClearSource && this.m_source != null) {
                this.m_source.clear();
                this.m_source = null;
            }
        }

    }
}
