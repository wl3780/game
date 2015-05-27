// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.family.PFamilyInfoChangeReq

package com.tencent.ai.core.protocol.family
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.family.base.FamilyNotifyInfo;
    import com.tencent.ai.core.data.FamilyInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_948;

    public class PFamilyInfoChangeReq implements ISerialize 
    {

        public static const OUT_CMD:int = 527139;
        public static const IN_CMD:int = 527140;

        public var result:int;
        public var notifyInfo:FamilyNotifyInfo;
        public var familyInfo:FamilyInfo;
        public var isChange:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.notifyInfo = new FamilyNotifyInfo();
                this.notifyInfo.read(_arg_1);
                this.familyInfo = new FamilyInfo();
                this.familyInfo.read(_arg_1);
                this.isChange = _arg_1.readUnsignedByte();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_948()
        {
        }


    }
}//package com.tencent.ai.core.protocol.family

// _SafeStr_948 = " PFamilyInfoChangeReq" (String#17090)


