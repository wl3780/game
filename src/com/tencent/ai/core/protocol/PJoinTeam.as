// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PJoinTeam

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1007;

    public class PJoinTeam implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_JOIN_TEAM_RSP;//526898

        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1007()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1007 = " PJoinTeam" (String#17324)


