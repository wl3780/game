// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamCreate

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.TeamCreateInfo;
    import com.tencent.ai.core.data.TeamInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1037;

    public class PTeamCreate implements ISerialize 
    {

        public static const REQ:int = 524529;
        public static const RSP:int = 524530;

        public var teamCreateInfo:TeamCreateInfo;
        public var result:int;
        public var teamInfo:TeamInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.teamInfo = new TeamInfo();
            this.teamInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.teamCreateInfo.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1037()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1037 = " PTeamCreate" (String#13988)


