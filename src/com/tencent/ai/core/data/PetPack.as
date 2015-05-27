// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetPack

package com.tencent.ai.core.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_299;
    import __AS3__.vec.*;

    public class PetPack 
    {

        public var followPetSID:uint;
        public var pets:Vector.<PetInfoWidthGrid>;


        public function getPetInfoBySID(_arg_1:int):PetInfoWidthGrid
        {
            var _local_2:PetInfoWidthGrid;
            for each (_local_2 in this.pets) {
                if (_local_2.petInfo.petSID == _arg_1){
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getTheFirstEmptyGrid():int
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:PetInfoWidthGrid;
            var _local_1:int = 3;
            if (AICore.data.mainModel.playerInfo.vipInfo.isVip){
                _local_1 = 5;
            };
            var _local_2:int = this.numPet;
            if (_local_1 > _local_2){
                _local_3 = this.pets.length;
                _local_4 = 0;
                while (_local_4 < _local_3) {
                    _local_5 = this.pets[_local_4];
                    if (!_local_5.petInfo.petSID){
                        return (_local_5.gridID);
                    };
                    _local_4++;
                };
            };
            return (-1);
        }

        public function get numPet():int
        {
            var _local_2:PetInfoWidthGrid;
            var _local_1:int;
            for each (_local_2 in this.pets) {
                if (_local_2.petInfo.petSID){
                    _local_1++;
                };
            };
            return (_local_1);
        }

        public function getPetCountBy(_arg_1:int):int
        {
            var _local_3:PetInfoWidthGrid;
            if (!this.pets){
                return (0);
            };
            var _local_2:int;
            for each (_local_3 in this.pets) {
                if (((_local_3.petInfo.petSID) && ((_local_3.petInfo.petID == _arg_1)))){
                    _local_2++;
                };
            };
            return (_local_2);
        }

        public function getPetCountByBasePetID(_arg_1:int):int
        {
            var _local_3:PetInfoWidthGrid;
            if (!this.pets){
                return (0);
            };
            var _local_2:int;
            for each (_local_3 in this.pets) {
                if (((_local_3.petInfo.petSID) && ((_local_3.petInfo.petStaticInfo.basePetID == _arg_1)))){
                    _local_2++;
                };
            };
            return (_local_2);
        }

        public function getPetInfosByBasePetID(_arg_1:int):Vector.<PetInfoWidthGrid>
        {
            var _local_3:PetInfoWidthGrid;
            if (!this.pets){
                return (null);
            };
            var _local_2:Vector.<PetInfoWidthGrid> = new Vector.<PetInfoWidthGrid>();
            for each (_local_3 in this.pets) {
                if (((_local_3.petInfo.petSID) && ((_local_3.petInfo.petStaticInfo.basePetID == _arg_1)))){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_299()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_299 = " PetPack" (String#17045)


