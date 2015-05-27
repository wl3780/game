// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupBuyReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_985;

    public class PDupBuyReq extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589920;
        public static const OUT_CMD:int = 589919;

        public var iResult:uint;
        public var oItemID:uint;
        public var oItemNum:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.iResult = _arg_1.readUnsignedInt();
            if (this.iResult != 0){
                ProtocolHelper.handlerError(this.iResult, IN_CMD);
                return;
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.oItemID);
            _arg_1.writeUnsignedInt(this.oItemNum);
        }

        public /*  ©init. */ function _SafeStr_985()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_985 = " PDupBuyReq" (String#14507)


