// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPvpTeamMatchAnswer

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1019;

    public class PPvpTeamMatchAnswer implements ISerialize 
    {

        public static const REQ:int = 526103;
        public static const RSP:int = 526104;

        public var isAgree:Boolean;
        public var result:int;
        public var who_agree_first:PlayerID;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.who_agree_first = new PlayerID();
            this.who_agree_first.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeBoolean(this.isAgree);
        }

        public /*  ©init. */ function _SafeStr_1019()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1019 = " PPvpTeamMatchAnswer" (String#17537)


