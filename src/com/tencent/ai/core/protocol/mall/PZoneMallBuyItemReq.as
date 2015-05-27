// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mall.PZoneMallBuyItemReq

package com.tencent.ai.core.protocol.mall
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_962;

    public class PZoneMallBuyItemReq implements ISerialize 
    {

        public static const IN_CMD:int = 526374;
        public static const OUT_CMD:int = 526373;

        public var buy_item_id:uint;
        public var buy_item_num:uint;
        public var type:uint;
        public var idx:uint;
        public var result:uint;
        public var channel:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result != 0){
                ProtocolHelper.handlerError(this.result, IN_CMD);
                return;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.buy_item_id);
            _arg_1.writeUnsignedInt(this.buy_item_num);
            _arg_1.writeByte(this.type);
            _arg_1.writeByte(this.idx);
            _arg_1.writeShort(this.channel);
        }

        public /*  ©init. */ function _SafeStr_962()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mall

// _SafeStr_962 = " PZoneMallBuyItemReq" (String#16322)


