// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZonePropItemUseReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1084;

    public class PZonePropItemUseReq implements ISerialize 
    {

        public static const IN_CMD:int = 524344;
        public static const OUT_CMD:int = 524343;

        public var id:int;
        public var sid:int;
        public var type:int;
        public var num:int;
        public var used_num:int;
        public var iRet:int;


        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.sid = _arg_1.readInt();
            this.type = _arg_1.readUnsignedByte();
            this.num = _arg_1.readInt();
            this.used_num = _arg_1.readInt();
            this.iRet = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.id);
            _arg_1.writeUnsignedInt(this.sid);
            _arg_1.writeByte(this.type);
            _arg_1.writeUnsignedInt(this.num);
        }

        public /*  ©init. */ function _SafeStr_1084()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1084 = " PZonePropItemUseReq" (String#16199)


