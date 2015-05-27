// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamRequestJoinAnswer

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1045;

    public class PTeamRequestJoinAnswer implements ISerialize 
    {

        public static const REQ:int = 524581;

        public var isAgree:Boolean;
        public var playerID:PlayerID;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeBoolean(this.isAgree);
            this.playerID.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_1045()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1045 = " PTeamRequestJoinAnswer" (String#17075)


