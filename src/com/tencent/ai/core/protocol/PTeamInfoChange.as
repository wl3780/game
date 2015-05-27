// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamInfoChange

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.TeamInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1040;

    public class PTeamInfoChange implements ISerialize 
    {

        public static const RSP:int = 524536;

        public var teamInfo:TeamInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.teamInfo = new TeamInfo();
            this.teamInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1040()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1040 = " PTeamInfoChange" (String#17408)


