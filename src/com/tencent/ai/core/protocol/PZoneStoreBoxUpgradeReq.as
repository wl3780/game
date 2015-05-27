// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneStoreBoxUpgradeReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1090;

    public class PZoneStoreBoxUpgradeReq implements ISerialize 
    {

        public static const IN_CMD:int = 524508;
        public static const OUT_CMD:int = 524507;

        public var zoneStoreBoxSyncNotify:PZoneStoreBoxSyncNotify;


        public function read(_arg_1:IDataInput):void
        {
            this.zoneStoreBoxSyncNotify = new PZoneStoreBoxSyncNotify();
            this.zoneStoreBoxSyncNotify.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1090()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1090 = " PZoneStoreBoxUpgradeReq" (String#15680)


