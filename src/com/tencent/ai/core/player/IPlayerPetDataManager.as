// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.IPlayerPetDataManager

package com.tencent.ai.core.player
{
    import flash.events.IEventDispatcher;
    import com.tencent.ai.core.data.PetPack;
    import com.tencent.ai.core.data.PetStorage;
    import com.tencent.ai.core.data.PetExtraBaseInfo;
    import com.tencent.ai.core.data.PetInfo;
    import __AS3__.vec.Vector;

    public interface IPlayerPetDataManager extends IEventDispatcher 
    {

        function get numNewPetOnStorage():int;
        function set numNewPetOnStorage(_arg_1:int):void;
        function get petPack():PetPack;
        function get petStorage():PetStorage;
        function get petExtraBaseInfo():PetExtraBaseInfo;
        function get followPetSID():int;
        function movePet(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function followPet(_arg_1:int=0, _arg_2:uint=0, _arg_3:Boolean=true):void;
        function getPetInfoBySID(_arg_1:int):PetInfo;
        function canEvole(_arg_1:PetInfo):Boolean;
        function canLearnBattleSkill(_arg_1:PetInfo):Boolean;
        function updateServiceSkill(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void;
        function useItem(_arg_1:uint, _arg_2:uint, _arg_3:uint, _arg_4:uint):void;
        function setDefaultCatchItem(_arg_1:int):void;
        function setDefaultPetHpItem(_arg_1:int):void;
        function setDefaultHungryItem(_arg_1:int):void;
        function getPetCountBy(_arg_1:int):int;
        function getPetCountByBasePetID(_arg_1:int):int;
        function getPetInfosByBasePetID(_arg_1:int):Vector.<PetInfo>;

    }
}//package com.tencent.ai.core.player

