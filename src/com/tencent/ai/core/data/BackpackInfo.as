// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.BackpackInfo

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_218;
    import __AS3__.vec.*;

    public class BackpackInfo 
    {

        public var packSize:int;
        public var packSizes:Vector.<int>;
        public var equipItems:Vector.<EquipItemInfo>;
        public var commonItems:Vector.<ItemInfo>;
        public var combatItems:Vector.<ItemInfo>;
        public var shortcutItems:Vector.<int>;

        public function BackpackInfo()
        {
            this.packSizes = new Vector.<int>(11);
            super();
        }

        public /*  ©init. */ function _SafeStr_218()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_218 = " BackpackInfo" (String#14276)


