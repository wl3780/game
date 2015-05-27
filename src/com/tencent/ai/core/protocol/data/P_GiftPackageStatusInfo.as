// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_GiftPackageStatusInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_886;

    public class P_GiftPackageStatusInfo implements ISerialize 
    {

        public var type:uint;
        public var id:uint;
        public var status:uint;
        public var piteminfos:P_SyncServerInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedShort();
            this.id = _arg_1.readUnsignedInt();
            this.status = _arg_1.readUnsignedByte();
            this.piteminfos = new P_SyncServerInfo();
            this.piteminfos.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_886()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_886 = " P_GiftPackageStatusInfo" (String#16400)


