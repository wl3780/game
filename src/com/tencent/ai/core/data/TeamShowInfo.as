// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.TeamShowInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_349;

    public class TeamShowInfo implements ISerialize 
    {

        public var teamID:uint;
        public var teamCreateInfo:TeamCreateInfo;
        public var numMember:int;
        public var teamVipInfo:VipSimpleInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.teamID = _arg_1.readUnsignedInt();
            this.teamCreateInfo = new TeamCreateInfo();
            this.teamCreateInfo.read(_arg_1);
            this.numMember = _arg_1.readByte();
            this.teamVipInfo = new VipSimpleInfo();
            this.teamVipInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_349()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_349 = " TeamShowInfo" (String#17555)


