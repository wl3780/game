// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetSaveStorage

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ArrayHash;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_300;

    public class PetSaveStorage 
    {

        protected var m_petData:ArrayHash;

        public function PetSaveStorage()
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

        public /*  ©init. */ function _SafeStr_300()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_300 = " PetSaveStorage" (String#14912)


