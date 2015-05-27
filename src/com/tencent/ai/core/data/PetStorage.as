// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetStorage

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ArrayHash;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_306;
    import __AS3__.vec.*;

    public class PetStorage 
    {

        protected var m_petData:ArrayHash;

        public function PetStorage()
        {
            this.m_petData = new ArrayHash();
        }

        public function get petArray():Array
        {
            return (this.m_petData.array);
        }

        public function get petHash():Dictionary
        {
            return (this.m_petData.hash);
        }

        public function getPetBy(_arg_1:int):PetInfoWidthGrid
        {
            return ((this.m_petData.getItemBy(_arg_1) as PetInfoWidthGrid));
        }

        public function deletePetBy(_arg_1:int):void
        {
            this.m_petData.deleteItemBy(_arg_1);
        }

        public function addPet(_arg_1:PetInfoWidthGrid):void
        {
            this.m_petData.push(_arg_1, _arg_1.gridID);
        }

        public function get length():int
        {
            return (this.m_petData.length);
        }

        public function getPetInfoBySID(_arg_1:int):PetInfoWidthGrid
        {
            var _local_2:PetInfoWidthGrid;
            for each (_local_2 in this.m_petData.hash) {
                if (_local_2.petInfo.petSID == _arg_1){
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getPetCountBy(_arg_1:int):int
        {
            var _local_3:PetInfoWidthGrid;
            if (!this.m_petData){
                return (0);
            };
            var _local_2:int;
            for each (_local_3 in this.m_petData.hash) {
                if (((_local_3.petInfo.petSID) && ((_local_3.petInfo.petID == _arg_1)))){
                    _local_2++;
                };
            };
            return (_local_2);
        }

        public function getPetCountByBasePetID(_arg_1:int):int
        {
            var _local_3:PetInfoWidthGrid;
            if (!this.m_petData){
                return (0);
            };
            var _local_2:int;
            for each (_local_3 in this.m_petData.hash) {
                if (((_local_3.petInfo.petSID) && ((_local_3.petInfo.petStaticInfo.basePetID == _arg_1)))){
                    _local_2++;
                };
            };
            return (_local_2);
        }

        public function getPetInfosByBasePetID(_arg_1:int):Vector.<PetInfoWidthGrid>
        {
            var _local_3:PetInfoWidthGrid;
            if (!this.m_petData){
                return (null);
            };
            var _local_2:Vector.<PetInfoWidthGrid> = new Vector.<PetInfoWidthGrid>();
            for each (_local_3 in this.m_petData.hash) {
                if (((_local_3.petInfo.petSID) && ((_local_3.petInfo.petStaticInfo.basePetID == _arg_1)))){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_306()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_306 = " PetStorage" (String#17450)


