// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PItemBuyReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_ItemBuyInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1005;

    public class PItemBuyReq implements ISerialize 
    {

        public static const IN_CMD:int = 524330;
        public static const OUT_CMD:int = 524329;

        public var oNpcID:int;
        public var oItems:Vector.<P_ItemBuyInfo>;
        public var iRet:uint;
        public var iAddGold:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.iRet = _arg_1.readUnsignedInt();
            if (this.iRet != 0){
                ProtocolHelper.handlerError(this.iRet, IN_CMD);
                return;
            };
            this.iAddGold = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _arg_1.writeUnsignedInt(this.oNpcID);
            _local_3 = this.oItems.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _arg_1.writeUnsignedInt(this.oItems[_local_2].id);
                _arg_1.writeShort(this.oItems[_local_2].num);
                _local_2++;
            };
            _arg_1.writeByte(0);
        }

        public /*  ©init. */ function _SafeStr_1005()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1005 = " PItemBuyReq" (String#13700)


