// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IMainPlayerModel

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.element.ITickObject;
    import com.tencent.ai.core.data.CareerInfo;
    import com.tencent.ai.core.data.ZoneBuff;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.data.PlayerInfo;
    import com.tencent.ai.core.data.DetailPlayerInfo;
    import com.tencent.ai.core.data.ActionInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.manager.key.KeyGroup;
    import com.tencent.ai.core.manager.key.IKeyFilter;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.AttributeInfo;
    import com.tencent.ai.core.data.MsgIconData;
    import com.tencent.ai.core.data.MailID;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.PublicClientData;
    import com.tencent.ai.core.data.PayData;

    public interface IMainPlayerModel extends IEventDispatcher, ITickObject 
    {

        function get isBindUI():Boolean;
        function set isBindUI(_arg_1:Boolean):void;
        function get careerWearLevel():int;
        function get isDead():Boolean;
        function get careerInfo():CareerInfo;
        function get currentLevel():int;
        function get currentHP():int;
        function get maxHP():int;
        function get currentMP():int;
        function get maxMP():int;
        function get currentAngryVal():int;
        function get maxAngryVal():int;
        function get pveExp():int;
        function get pkExp():int;
        function get fortressExp():int;
        function get fatigueVal():int;
        function get coupons():int;
        function get score():int;
        function get currentGoldenCoin():int;
        function get goldenCoinLimit():int;
        function get reviveCoin():int;
        function get meritVal():int;
        function get pkWinPoint():int;
        function get pkLevel():int;
        function get militaryRank():int;
        function get otherPlayerVV():int;
        function set otherPlayerVV(_arg_1:int):void;
        function get otherPetVV():int;
        function set otherPetVV(_arg_1:int):void;
        function get weaknessBuff():ZoneBuff;
        function get equipsID():PlayerEquipsID;
        function get playerInfo():PlayerInfo;
        function get itemManager():IItemManager;
        function get mallManager():IMallManager;
        function get skillManager():IPlayerSkillManager;
        function get mailManager():IMailManager;
        function get variableManager():IVariableManager;
        function setControlEnabled(_arg_1:Boolean):void;
        function getControlEnabled():Boolean;
        function changeEquip(_arg_1:int, _arg_2:int, _arg_3:Boolean=true, _arg_4:uint=0xFFFF):Boolean;
        function getDetailPlayerInfo():DetailPlayerInfo;
        function bindRuntimeModel(_arg_1:PlayerModel):void;
        function unbindRuntimeModel():void;
        function newRound():void;
        function clearRound():void;
        function getRuntimeModel():PlayerModel;
        function getCurrentActionInfo():ActionInfo;
        function getCurrentSSModels():Vector.<SSModel>;
        function getCurrentZoneBuffs():Vector.<ZoneBuff>;
        function getCombatKeyGroup():KeyGroup;
        function getNormalKeyGroup():KeyGroup;
        function getDefaultKeyFilters():Vector.<IKeyFilter>;
        function getActionInfos():Dictionary;
        function copyValues(_arg_1:AttributeInfo):void;
        function reset():void;
        function resetFrameIndex():void;
        function addIconMessage(_arg_1:MsgIconData):void;
        function removeIconMessage(_arg_1:MsgIconData):void;
        function removeIconMessageByType(_arg_1:int):void;
        function getMessageIconDatas():Vector.<MsgIconData>;
        function mailRequest(_arg_1:MailID):void;
        function upgradeCareerWear():void;
        function removeExt(_arg_1:int):void;
        function isIndulge(_arg_1:uint=0, _arg_2:CFunction=null):uint;
        function indulgeState():uint;
        function getPublicDataBySID(_arg_1:uint, _arg_2:Function):void;
        function setPublicDataBySID(_arg_1:uint, _arg_2:PublicClientData):void;
        function guidBubbleSetPosN(_arg_1:uint, _arg_2:uint=1):uint;
        function guidBubbleSendCheckDatas():void;
        function guidBubbleTestPosN(_arg_1:uint):Boolean;
        function guidBubbleSendSetInfo():void;
        function updateMilitaryRank(_arg_1:int):void;
        function quickPay(_arg_1:int, _arg_2:int, _arg_3:Function):void;
        function quickBuy(_arg_1:int, _arg_2:int):void;
        function petFortressLibBuildingUpdate(_arg_1:uint, _arg_2:Object):void;
        function updateAdvBuff(_arg_1:int):void;
        function get todayOnlineTime():int;
        function get teamManager():ITeamManager;
        function get friendSystem():IFriendSystem;
        function get petDataManager():IPlayerPetDataManager;
        function get pvpManager():IPvpManager;
        function get familyManager():IFamilyManager;
        function updateName(_arg_1:String):void;
        function updatePayData(_arg_1:PayData):void;
        function get warSoulManager():IWarSoulManager;

    }
}//package com.tencent.ai.core.player

