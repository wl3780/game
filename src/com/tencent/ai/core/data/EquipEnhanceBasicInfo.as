// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipEnhanceBasicInfo

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_249;

    public class EquipEnhanceBasicInfo 
    {

        public var equipLevel:int;
        public var equipType:int;
        public var equipRarity:int;
        public var equipEnhanceLevel:int;


        public function toString():String
        {
            return (((((((this.equipLevel + ",") + this.equipType) + ",") + this.equipRarity) + ",") + this.equipEnhanceLevel));
        }

        public /*  ©init. */ function _SafeStr_249()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_249 = " EquipEnhanceBasicInfo" (String#13682)


