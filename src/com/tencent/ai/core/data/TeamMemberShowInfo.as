// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TeamMemberShowInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_348;

    public class TeamMemberShowInfo implements ISerialize 
    {

        public var playerID:PlayerID;
        public var nickname:String;
        public var careerID:uint;
        public var sublime:Boolean;
        public var level:int;
        public var vipInfo:VipSimpleInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.nickname = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.careerID = _arg_1.readUnsignedInt();
            this.sublime = _arg_1.readBoolean();
            this.level = _arg_1.readUnsignedShort();
            this.vipInfo = new VipSimpleInfo();
            this.vipInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_348()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_348 = " TeamMemberShowInfo" (String#15575)


