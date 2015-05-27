// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamInviteAnswer

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1042;

    public class PTeamInviteAnswer implements ISerialize 
    {

        public static const REQ:int = 524535;

        public var teamID:uint;
        public var isAgree:Boolean;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.teamID);
            _arg_1.writeBoolean(this.isAgree);
        }

        public /*  ©init. */ function _SafeStr_1042()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1042 = " PTeamInviteAnswer" (String#17705)


