// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZoneDanceCommonReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1069;

    public class PZoneDanceCommonReq implements ISerialize 
    {

        public static const IN_CMD:int = 525350;
        public static const OUT_CMD:int = 525349;

        public var dance_player_id:PlayerID;
        public var serverMsgInfo:ServerMsgInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.dance_player_id = new PlayerID();
            this.dance_player_id.read(_arg_1);
            this.serverMsgInfo = new ServerMsgInfo();
            this.serverMsgInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1069()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1069 = " PZoneDanceCommonReq" (String#15698)


