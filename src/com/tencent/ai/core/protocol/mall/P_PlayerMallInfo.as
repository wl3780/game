// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mall.P_PlayerMallInfo

package com.tencent.ai.core.protocol.mall
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_961;

    public class P_PlayerMallInfo implements ISerialize 
    {

        public var coupons:uint;
        public var score:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.coupons = _arg_1.readUnsignedInt();
            this.score = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_961()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mall

// _SafeStr_961 = " P_PlayerMallInfo" (String#15872)


