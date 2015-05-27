// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.FamilyInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_255;

    public class FamilyInfo implements ISerialize 
    {

        public var familyID:int;
        public var familyName:String = "";
        public var familyLevel:int;
        public var creatorID:PlayerID;
        public var creatorName:String = "";
        public var memberNum:int;
        public var maxMemberNum:int;
        public var totalPower:int;
        public var identity:int;
        public var staues:int;
        public var backGround:int;


        public function read(_arg_1:IDataInput):void
        {
            this.familyID = _arg_1.readUnsignedInt();
            this.familyName = XString.ReadChars(_arg_1, Constants.PROTOCAL_32);
            this.familyLevel = _arg_1.readUnsignedInt();
            this.creatorID = new PlayerID();
            this.creatorID.read(_arg_1);
            this.creatorName = XString.ReadChars(_arg_1, Constants.PROTOCAL_32);
            this.memberNum = _arg_1.readUnsignedInt();
            this.maxMemberNum = _arg_1.readUnsignedInt();
            this.totalPower = _arg_1.readUnsignedInt();
            this.identity = _arg_1.readUnsignedByte();
            this.staues = _arg_1.readUnsignedByte();
            this.backGround = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.familyID);
            XString.WriteChars(_arg_1, this.familyName, Constants.PROTOCAL_32);
            _arg_1.writeUnsignedInt(this.familyLevel);
            if (!this.creatorID){
                this.creatorID = new PlayerID(0, 0);
            };
            this.creatorID.write(_arg_1);
            XString.WriteChars(_arg_1, this.creatorName, Constants.PROTOCAL_32);
            _arg_1.writeUnsignedInt(this.memberNum);
            _arg_1.writeUnsignedInt(this.maxMemberNum);
            _arg_1.writeUnsignedInt(this.totalPower);
            _arg_1.writeByte(this.identity);
            _arg_1.writeByte(this.staues);
        }

        public /*  ©init. */ function _SafeStr_255()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_255 = " FamilyInfo" (String#15014)


