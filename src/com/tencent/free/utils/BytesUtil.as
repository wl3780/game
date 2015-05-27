// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.utils.BytesUtil

package com.tencent.free.utils
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_68;

    public class BytesUtil 
    {


        public static function directWriteInt(_arg_1:ByteArray, _arg_2:uint, _arg_3:int):void
        {
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _arg_1.writeInt(_arg_3);
            _arg_1.position = _local_4;
        }

        public static function directWriteUint(_arg_1:ByteArray, _arg_2:uint, _arg_3:uint):void
        {
            var _local_4:uint;
            _local_4 = _arg_1.position;
            _arg_1.position = _arg_2;
            _arg_1.writeUnsignedInt(_arg_3);
            _arg_1.position = _local_4;
        }

        public static function directWriteSmallint(_arg_1:ByteArray, _arg_2:uint, _arg_3:int):void
        {
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _arg_1.writeShort(_arg_3);
            _arg_1.position = _local_4;
        }

        public static function directWriteTinyint(_arg_1:ByteArray, _arg_2:uint, _arg_3:uint):void
        {
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _arg_1.writeByte(_arg_3);
            _arg_1.position = _local_4;
        }

        public static function directReadInt(_arg_1:ByteArray, _arg_2:uint):int
        {
            var _local_3:int;
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _local_3 = _arg_1.readInt();
            _arg_1.position = _local_4;
            return (_local_3);
        }

        public static function directReadUint(_arg_1:ByteArray, _arg_2:uint):uint
        {
            var _local_3:uint;
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _local_3 = _arg_1.readUnsignedInt();
            _arg_1.position = _local_4;
            return (_local_3);
        }

        public static function directReadSmallint(_arg_1:ByteArray, _arg_2:uint):int
        {
            var _local_3:int;
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _local_3 = _arg_1.readShort();
            _arg_1.position = _local_4;
            return (_local_3);
        }

        public static function directReadSmalluint(_arg_1:ByteArray, _arg_2:uint):int
        {
            var _local_3:int;
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _local_3 = _arg_1.readUnsignedShort();
            _arg_1.position = _local_4;
            return (_local_3);
        }

        public static function directReadTinyint(_arg_1:ByteArray, _arg_2:uint):int
        {
            var _local_3:int;
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _local_3 = _arg_1.readByte();
            _arg_1.position = _local_4;
            return (_local_3);
        }

        public static function directReadTinyuint(_arg_1:ByteArray, _arg_2:uint):int
        {
            var _local_3:int;
            var _local_4:uint = _arg_1.position;
            _arg_1.position = _arg_2;
            _local_3 = _arg_1.readUnsignedByte();
            _arg_1.position = _local_4;
            return (_local_3);
        }


        public /*  ©init. */ function _SafeStr_68()
        {
        }


    }
}//package com.tencent.free.utils

// _SafeStr_68 = " BytesUtil" (String#1412)


