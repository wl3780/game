// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TeamCreateInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_345;

    public class TeamCreateInfo implements ISerialize 
    {

        public var name:String;
        public var planetID:int;
        public var dupID:int;
        public var level:int;
        public var maxNum:int;

        public function TeamCreateInfo()
        {
            this.name = "新建一个队伍";
        }

        public function read(_arg_1:IDataInput):void
        {
            this.name = XString.ReadChars(_arg_1, Constants.MAX_TEAM_NAME_LEN);
            this.planetID = _arg_1.readUnsignedShort();
            this.dupID = _arg_1.readUnsignedInt();
            this.level = _arg_1.readUnsignedByte();
            this.maxNum = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteChars(_arg_1, this.name, Constants.MAX_TEAM_NAME_LEN);
            _arg_1.writeShort(this.planetID);
            _arg_1.writeUnsignedInt(this.dupID);
            _arg_1.writeByte(this.level);
            _arg_1.writeByte(this.maxNum);
        }

        public /*  ©init. */ function _SafeStr_345()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_345 = " TeamCreateInfo" (String#14723)


