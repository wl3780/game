// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPublicClientDataUpdate

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PublicClientData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1016;

    public class PPublicClientDataUpdate implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_CIENT_DATA_UPDATE_REQ;//1509705

        public var sid:uint;
        public var data:PublicClientData;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.sid);
            this.data.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1016()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1016 = " PPublicClientDataUpdate" (String#17273)


