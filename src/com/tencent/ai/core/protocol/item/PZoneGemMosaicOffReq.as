// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.item.PZoneGemMosaicOffReq

package com.tencent.ai.core.protocol.item
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.ItemHoleInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_956;

    public class PZoneGemMosaicOffReq implements ISerialize 
    {

        public static const IN_CMD:int = 526890;
        public static const OUT_CMD:int = 526889;

        public var result:int;
        public var sid:int;
        public var hole_seq:int;
        public var gem_type:int;
        public var hole:ItemHoleInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError2(this.result, IN_CMD);
                return;
            };
            this.sid = _arg_1.readUnsignedInt();
            this.hole_seq = _arg_1.readUnsignedByte();
            this.hole = new ItemHoleInfo();
            this.hole.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.sid);
            _arg_1.writeByte(this.hole_seq);
        }

        public /*  ©init. */ function _SafeStr_956()
        {
        }


    }
}//package com.tencent.ai.core.protocol.item

// _SafeStr_956 = " PZoneGemMosaicOffReq" (String#16076)


