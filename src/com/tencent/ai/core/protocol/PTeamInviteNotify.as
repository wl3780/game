// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamInviteNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.TeamInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1043;

    public class PTeamInviteNotify implements ISerialize 
    {

        public static const RSP:int = 524490;

        public var teamInfo:TeamInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.teamInfo = new TeamInfo();
            this.teamInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1043()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1043 = " PTeamInviteNotify" (String#14021)


