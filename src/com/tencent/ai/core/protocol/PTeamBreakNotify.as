// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTeamBreakNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1035;

    public class PTeamBreakNotify implements ISerialize 
    {

        public static const RSP:int = 524538;

        public var teamID:int;


        public function read(_arg_1:IDataInput):void
        {
            this.teamID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1035()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1035 = " PTeamBreakNotify" (String#16739)


