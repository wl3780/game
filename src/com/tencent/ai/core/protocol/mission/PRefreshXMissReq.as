// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mission.PRefreshXMissReq

package com.tencent.ai.core.protocol.mission
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_966;

    public class PRefreshXMissReq implements ISerialize 
    {

        public static const IN_CMD:int = 525590;
        public static const OUT_CMD:int = 525589;

        public var result:int;
        public var x_miss_board:P_XMissionOnBoard;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError2(this.result, IN_CMD);
                return;
            };
            this.x_miss_board = new P_XMissionOnBoard();
            this.x_miss_board.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_966()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mission

// _SafeStr_966 = " PRefreshXMissReq" (String#14867)


