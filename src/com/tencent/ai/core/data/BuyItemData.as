// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.BuyItemData

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_221;

    public class BuyItemData extends ServerMsgInfo 
    {

        public var score_price:int;
        public var coupon_price:int;
        public var vip_coupon_price:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.score_price = int(_arg_1.@score_price);
            this.coupon_price = int(_arg_1.@coupon_price);
            this.vip_coupon_price = int(_arg_1.@vip_coupon_price);
        }

        public /*  ©init. */ function _SafeStr_221()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_221 = " BuyItemData" (String#15365)


