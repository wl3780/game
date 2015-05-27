// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.family.PFamilyNotifyReq

package com.tencent.ai.core.protocol.family
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.FamilyInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_950;

    public class PFamilyNotifyReq implements ISerialize 
    {

        public static const OUT_CMD:int = 527146;
        public static const IN_CMD:int = 527152;

        public var playerID:PlayerID;
        public var familyInfo:FamilyInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.familyInfo = new FamilyInfo();
            this.familyInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_950()
        {
        }


    }
}//package com.tencent.ai.core.protocol.family

// _SafeStr_950 = " PFamilyNotifyReq" (String#16031)


