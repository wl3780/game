// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetExtraBaseInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_293;

    public class PetExtraBaseInfo 
    {

        public var catchItemID:uint;
        public var playerHpItemID:uint;
        public var playerMpItemID:uint;
        public var petHpItemID:uint;
        public var hungryItemID:uint;
        public var extra_buff:PetExtraBuff;

        public function PetExtraBaseInfo()
        {
            this.extra_buff = new PetExtraBuff();
            super();
        }

        public /*  ©init. */ function _SafeStr_293()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_293 = " PetExtraBaseInfo" (String#15746)


