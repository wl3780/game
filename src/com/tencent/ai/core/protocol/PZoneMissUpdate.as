// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneMissUpdate

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.data.P_MissionData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1077;

    public class PZoneMissUpdate implements ISerialize 
    {

        public static const IN_CMD:int = 524404;
        public static const OUT_CMD:int = 524403;

        public var iMissionData:P_MissionData;


        public function read(_arg_1:IDataInput):void
        {
            this.iMissionData = new P_MissionData();
            this.iMissionData.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1077()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1077 = " PZoneMissUpdate" (String#13718)


