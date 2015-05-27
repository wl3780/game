// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPvpTeamMatchInviteNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1020;

    public class PPvpTeamMatchInviteNotify implements ISerialize 
    {

        public static const RSP:int = 526102;

        public var invitor:PlayerID;


        public function read(_arg_1:IDataInput):void
        {
            this.invitor = new PlayerID();
            this.invitor.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1020()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1020 = " PPvpTeamMatchInviteNotify" (String#17066)


