// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.LibBuildingBasicInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_267;

    public class LibBuildingBasicInfo implements ISerialize 
    {

        public var sid:uint;
        public var buildingID:uint;
        public var status:uint;
        public var gotTime:uint;
        public var slot:uint;
        public var harvestCount:uint;
        public var startTime:uint;
        public var deadTime:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.slot = _arg_1.readUnsignedInt();
            this.sid = _arg_1.readUnsignedInt();
            this.buildingID = _arg_1.readUnsignedInt();
            this.status = _arg_1.readUnsignedByte();
            this.gotTime = _arg_1.readUnsignedInt();
            this.harvestCount = _arg_1.readUnsignedInt();
            this.startTime = _arg_1.readUnsignedInt();
            this.deadTime = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_267()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_267 = " LibBuildingBasicInfo" (String#15890)


