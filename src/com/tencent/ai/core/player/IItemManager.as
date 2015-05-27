// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IItemManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.ItemInfo;
    import com.tencent.ai.core.data.EquipItemInfo;
    import __AS3__.vec.Vector;

    public interface IItemManager extends IEventDispatcher 
    {

        function useItem(_arg_1:ItemInfo, _arg_2:int=0):void;
        function dropItem(_arg_1:ItemInfo, _arg_2:int):void;
        function updateAvatar(_arg_1:int, _arg_2:EquipItemInfo, _arg_3:EquipItemInfo):void;
        function swapShortcut(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void;
        function setShortcut(_arg_1:int, _arg_2:int):void;
        function getPackSize(_arg_1:int):uint;
        function setItemsSlot(_arg_1:Array, _arg_2:Array):void;
        function getItemCountByID(_arg_1:int):int;
        function repair(_arg_1:Vector.<int>):void;
        function getItem(_arg_1:int):ItemInfo;
        function get combatItems():Vector.<ItemInfo>;
        function get commonItems():Vector.<ItemInfo>;
        function get equipItems():Vector.<EquipItemInfo>;
        function get equips():Vector.<EquipItemInfo>;
        function get shortcutItems():Vector.<ItemInfo>;
        function buildTemporaryItem(_arg_1:int, _arg_2:uint):ItemInfo;
        function cityBuy(_arg_1:uint, _arg_2:uint, _arg_3:int):void;
        function dupBuy(_arg_1:uint, _arg_2:uint):void;
        function recycle(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Boolean=false):void;
        function packageToStorage(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:int):void;
        function storageToPackage(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:int):void;
        function embedGem(_arg_1:EquipItemInfo, _arg_2:int, _arg_3:int=0):void;
        function punch(_arg_1:EquipItemInfo, _arg_2:int):void;
        function upgradeGem(_arg_1:EquipItemInfo, _arg_2:int):void;
        function dismantleGem(_arg_1:EquipItemInfo, _arg_2:int):void;
        function combinGem(_arg_1:int, _arg_2:int, _arg_3:int=1):void;
        function loadHoleGemTypes(_arg_1:uint, _arg_2:int):void;
        function upgradeSkill(_arg_1:int, _arg_2:int, _arg_3:int):void;

    }
}//package com.tencent.ai.core.player

