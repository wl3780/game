// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPublicClientDataQueryReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PublicClientData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1015;

    public class PPublicClientDataQueryReq implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_CIENT_DATA_QUERY_RSP;//1509704
        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_CIENT_DATA_QUERY_REQ;//1509703

        public var ret:int;
        public var data:PublicClientData;
        public var sid:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.data = new PublicClientData();
            this.data.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.sid);
        }

        public /*  ©init. */ function _SafeStr_1015()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1015 = " PPublicClientDataQueryReq" (String#14420)


