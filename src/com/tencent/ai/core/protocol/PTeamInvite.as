// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamInvite

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1041;

    public class PTeamInvite implements ISerialize 
    {

        public static const REQ:int = 524533;
        public static const RSP:int = 524534;

        public var teamID:uint;
        public var playerID:PlayerID;
        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.teamID);
            this.playerID.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1041()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1041 = " PTeamInvite" (String#17024)


