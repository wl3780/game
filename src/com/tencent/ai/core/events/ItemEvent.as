// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.events.ItemEvent

package com.tencent.ai.core.events
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ItemInfo;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import flash.events.Event;
    import  ©init._SafeStr_542;

    public class ItemEvent extends BaseEvent 
    {

        public static const EQUIPS_CHANGE:String = "equipsChange";
        public static const COMMON_ITEMS_CHANGE:String = "commonItemsChange";
        public static const COMBAT_ITEMS_CHANGE:String = "combatItemsChange";
        public static const EQUIP_ITEMS_CHANGE:String = "equipItemsChange";
        public static const ITEM_WEAR_CHANGE:String = "itemWearChange";
        public static const ITEM_STRENGTHEN_CHANGE:String = "itemStrengthenChange";
        public static const ITEM_USEABLE_CHANGE:String = "itemUseableChange";
        public static const ITEM_NUM_CHANGE:String = "itemNumChange";
        public static const ITEM_AVAILABLE_CHANGE:String = "itemAvailableChange";
        public static const ITEM_SLOT_CHANGE:String = "itemSlotChange";
        public static const ITEM_HOLES_CHANGE:String = "itemHolesChange";
        public static const NEW_SHORTCUT:String = "newShortcut";
        public static const ADD_ITEM:String = "addItem";
        public static const REMOVE_ITEM:String = "removeItem";
        public static const PICK_ITEM:String = "pickItem";
        public static const PUT_ON_AVATAR:String = "putOnAvatar";
        public static const GET_OFF_AVATAR:String = "getOffAvatar";
        public static const PAWN_ITEM:String = "pawnItem";
        public static const CITY_BUY_COMPLETE:String = "cityBuyComplete";
        public static const DUP_BUY_COMPLETE:String = "dupBuyComplete";
        public static const HOLE_GEM_TYPES_LOADED:String = "holeGemTypesLoaded";

        public var manipulatedItems:Vector.<ItemInfo>;
        public var manipulatedItem:ItemInfo;
        public var gold:int;
        public var fatigue:int;
        public var pkExp:int;
        public var pkScore:int;
        public var petExp:int;
        public var fortressXP:int;
        public var fortressData0:int;
        public var fortressData1:int;
        public var xp:int;
        public var familyContribution:int;
        public var familyPopularity:int;
        public var familyZhuNeng:int;
        public var quatity:int;
        public var slot:int;
        public var addedItems:Vector.<ItemInfo>;
        public var removedItems:Vector.<ItemInfo>;
        public var packageItems:Vector.<ItemInfo>;
        private var _moduleType:int;
        private var _moduleInfo:ServerMsgInfo;
        public var warSouls:Vector.<ServerMsgInfo>;

        public function ItemEvent(_arg_1:String, _arg_2:ItemInfo=null)
        {
            super(_arg_1);
            this.manipulatedItem = _arg_2;
        }

        override public function clone():Event
        {
            var _local_1:ItemEvent = new ItemEvent(type);
            _local_1.manipulatedItems = this.manipulatedItems;
            _local_1.manipulatedItem = this.manipulatedItem;
            _local_1.gold = this.gold;
            _local_1.xp = this.xp;
            _local_1.fatigue = this.fatigue;
            _local_1.pkExp = this.pkExp;
            _local_1.pkScore = this.pkScore;
            _local_1.petExp = this.petExp;
            _local_1.fortressXP = this.fortressXP;
            _local_1.fortressData0 = this.fortressData0;
            _local_1.fortressData1 = this.fortressData1;
            _local_1.quatity = this.quatity;
            _local_1.slot = this.slot;
            _local_1.addedItems = this.addedItems;
            _local_1.removedItems = this.removedItems;
            _local_1.moduleType = this.moduleType;
            return (_local_1);
        }

        override public function toString():String
        {
            return (formatToString("ItemEvent", "type", "manipulatedItem"));
        }

        public function get moduleType():int
        {
            return (this._moduleType);
        }

        public function set moduleType(_arg_1:int):void
        {
            this._moduleType = _arg_1;
        }

        public function get moduleInfo():ServerMsgInfo
        {
            return (this._moduleInfo);
        }

        public function set moduleInfo(_arg_1:ServerMsgInfo):void
        {
            this._moduleInfo = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_542()
        {
        }


    }
}//package com.tencent.ai.core.events

// _SafeStr_542 = " ItemEvent" (String#16244)


