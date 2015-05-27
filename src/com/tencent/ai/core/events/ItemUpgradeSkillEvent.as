// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ItemUpgradeSkillEvent

package com.tencent.ai.core.events
{
    import flash.events.Event;
    import com.tencent.ai.core.data.EquipItemInfo;
    import  ©init._SafeStr_543;

    public class ItemUpgradeSkillEvent extends Event 
    {

        public static const UPGRADE_SKILL:String = "upgradeSkill";

        public var manipulatedGem:EquipItemInfo;
        public var isSuccess:Boolean;

        public function ItemUpgradeSkillEvent(_arg_1:String)
        {
            super(_arg_1);
        }

        override public function clone():Event
        {
            return (new ItemUpgradeSkillEvent(type));
        }

        public /*  ©init. */ function _SafeStr_543()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_543 = " ItemUpgradeSkillEvent" (String#16943)


