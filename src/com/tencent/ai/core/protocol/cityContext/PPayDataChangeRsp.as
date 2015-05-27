// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PPayDataChangeRsp

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.PayData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_861;

    public class PPayDataChangeRsp implements ISerialize 
    {

        public static const RSP:int = 526198;

        public var playerID:PlayerID;
        public var payData:PayData;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.payData = new PayData();
            this.payData.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_861()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_861 = " PPayDataChangeRsp" (String#16808)


