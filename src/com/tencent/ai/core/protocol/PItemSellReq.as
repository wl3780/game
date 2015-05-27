// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PItemSellReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_ItemSellInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1006;

    public class PItemSellReq implements ISerialize 
    {

        public static const IN_CMD:int = 524338;
        public static const OUT_CMD:int = 524337;

        public var oItems:Vector.<P_ItemSellInfo>;
        public var iRet:int;
        public var iAddGold:int;
        public var force_to_sell:int;


        public function read(_arg_1:IDataInput):void
        {
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                if (((!((this.iRet == 80400))) && (!((this.iRet == 80308))))){
                    ProtocolHelper.handlerError(this.iRet, IN_CMD);
                };
                return;
            };
            this.iAddGold = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _arg_1.writeByte(this.force_to_sell);
            _local_3 = this.oItems.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _arg_1.writeUnsignedInt(this.oItems[_local_2].sid);
                _arg_1.writeUnsignedInt(this.oItems[_local_2].id);
                _arg_1.writeShort(this.oItems[_local_2].num);
                _local_2++;
            };
            _arg_1.writeByte(0);
        }

        public /*  ©init. */ function _SafeStr_1006()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1006 = " PItemSellReq" (String#15902)


