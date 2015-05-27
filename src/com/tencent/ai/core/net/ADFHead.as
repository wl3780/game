// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.ADFHead

package com.tencent.ai.core.net
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_805;

    public class ADFHead implements ISerialize 
    {

        public static const NOT_EN_BYTES:int = 0;
        public static const MAGIC_ERROR:int = -1;
        public static const HEAD_READY:int = 1;
        public static const HEADLEN:int = 23;
        public static const MAGIC:int = 38184;
        public static const MAGIC_L:int = 40;
        public static const MAGIC_H:int = 149;

        public var pkgLen:int = 0;
        public var version:int = 0;
        public var playerID:PlayerID = null;
        public var cmdID:uint;
        public var msgID:uint = 0;
        public var clientIP:uint = 0;


        public static function canRead(_arg_1:IDataInput):int
        {
            if (_arg_1.bytesAvailable < HEADLEN){
                return (NOT_EN_BYTES);
            };
            var _local_2:int = _arg_1.readUnsignedByte();
            if (_local_2 != MAGIC_H){
                return (MAGIC_ERROR);
            };
            _local_2 = _arg_1.readUnsignedByte();
            if (_local_2 != MAGIC_L){
                return (MAGIC_ERROR);
            };
            return (HEAD_READY);
        }


        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(MAGIC);
            _arg_1.writeShort(this.pkgLen);
            _arg_1.writeShort(this.version);
            this.playerID.write(_arg_1);
            _arg_1.writeUnsignedInt(this.cmdID);
            _arg_1.writeUnsignedInt(this.msgID);
            _arg_1.writeUnsignedInt(this.clientIP);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.pkgLen = _arg_1.readUnsignedShort();
            this.version = _arg_1.readUnsignedShort();
            if (this.playerID == null){
                this.playerID = new PlayerID();
            };
            this.playerID.read(_arg_1);
            this.cmdID = _arg_1.readUnsignedInt();
            this.msgID = _arg_1.readUnsignedInt();
            this.clientIP = _arg_1.readUnsignedInt();
        }

        public /*  ©init. */ function _SafeStr_805()
        {
        }


    }
}//package com.tencent.ai.core.net

// _SafeStr_805 = " ADFHead" (String#16265)


