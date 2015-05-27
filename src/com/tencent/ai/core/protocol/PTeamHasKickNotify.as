// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamHasKickNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1039;

    public class PTeamHasKickNotify implements ISerialize 
    {

        public static const RSP:int = 524548;

        public var teamID:int;


        public function read(_arg_1:IDataInput):void
        {
            this.teamID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1039()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1039 = " PTeamHasKickNotify" (String#16274)


