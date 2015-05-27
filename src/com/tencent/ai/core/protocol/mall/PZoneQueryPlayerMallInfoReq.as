// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mall.PZoneQueryPlayerMallInfoReq

package com.tencent.ai.core.protocol.mall
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_963;

    public class PZoneQueryPlayerMallInfoReq implements ISerialize 
    {

        public static const IN_CMD2:int = 526372;
        public static const IN_CMD:int = 526370;
        public static const OUT_CMD:int = 526369;

        public var result:uint;
        public var player_mall_info:P_PlayerMallInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result != 0){
                ProtocolHelper.handlerError(this.result, IN_CMD);
                return;
            };
            this.player_mall_info = new P_PlayerMallInfo();
            this.player_mall_info.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_963()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mall

// _SafeStr_963 = " PZoneQueryPlayerMallInfoReq" (String#13703)


