package com.tencent.free.utils
{
    import flash.utils.ByteArray;

    public class BytesUtil 
    {


        public static function directWriteInt(data:ByteArray, pos:uint, value:int):void
        {
            var lastPos:uint = data.position;
            data.position = pos;
            data.writeInt(value);
            data.position = lastPos;
        }

        public static function directWriteUint(data:ByteArray, pos:uint, value:uint):void
        {
            var lastPos:uint = data.position;
            data.position = pos;
            data.writeUnsignedInt(value);
            data.position = lastPos;
        }

        public static function directWriteSmallint(data:ByteArray, pos:uint, value:int):void
        {
            var lastPos:uint = data.position;
            data.position = pos;
            data.writeShort(value);
            data.position = lastPos;
        }

        public static function directWriteTinyint(data:ByteArray, pos:uint, value:uint):void
        {
            var lastPos:uint = data.position;
            data.position = pos;
            data.writeByte(value);
            data.position = lastPos;
        }

        public static function directReadInt(data:ByteArray, pos:uint):int
        {
            var lastPos:uint = data.position;
            data.position = pos;
            var value:int = data.readInt();
            data.position = lastPos;
            return value;
        }

        public static function directReadUint(pos:ByteArray, pos:uint):uint
        {
            var lastPos:uint = pos.position;
            pos.position = pos;
            var value:uint = pos.readUnsignedInt();
            pos.position = lastPos;
            return value;
        }

        public static function directReadSmallint(data:ByteArray, pos:uint):int
        {
            var lastPos:uint = data.position;
            data.position = pos;
            var value:int = data.readShort();
            data.position = lastPos;
            return value;
        }

        public static function directReadSmalluint(data:ByteArray, pos:uint):int
        {
            var lastPos:uint = data.position;
            data.position = pos;
            var value:int = data.readUnsignedShort();
            data.position = lastPos;
            return value;
        }

        public static function directReadTinyint(data:ByteArray, pos:uint):int
        {
            var lastPos:uint = data.position;
            data.position = pos;
            var value:int = data.readByte();
            data.position = lastPos;
            return value;
        }

        public static function directReadTinyuint(data:ByteArray, pos:uint):int
        {
            var lastPos:uint = data.position;
            data.position = pos;
            var value:int = data.readUnsignedByte();
            data.position = lastPos;
            return value;
        }

    }
}
