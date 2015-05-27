// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamRequestJoinNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.TeamMemberShowInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1046;

    public class PTeamRequestJoinNotify implements ISerialize 
    {

        public static const RSP:int = 524582;

        public var memberShowInfo:TeamMemberShowInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.memberShowInfo = new TeamMemberShowInfo();
            this.memberShowInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1046()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1046 = " PTeamRequestJoinNotify" (String#16286)


