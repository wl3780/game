// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.item.PZoneGemMosaicQueryReq

package com.tencent.ai.core.protocol.item
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_959;
    import __AS3__.vec.*;

    public class PZoneGemMosaicQueryReq implements ISerialize 
    {

        public static const IN_CMD:int = 526892;
        public static const OUT_CMD:int = 526891;

        public var result:int;
        public var sid:int;
        public var hole_seq:int;
        public var gem_type:int;
        public var gem_type_array:Vector.<uint>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError2(this.result, IN_CMD);
                return;
            };
            this.sid = _arg_1.readUnsignedInt();
            this.hole_seq = _arg_1.readUnsignedByte();
            this.gem_type_array = new Vector.<uint>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.gem_type_array.push(_arg_1.readUnsignedInt());
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.sid);
            _arg_1.writeByte(this.hole_seq);
        }

        public /*  ©init. */ function _SafeStr_959()
        {
        }


    }
}//package com.tencent.ai.core.protocol.item

// _SafeStr_959 = " PZoneGemMosaicQueryReq" (String#16415)


