// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PetStorage

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetStorage;
    import com.tencent.ai.core.data.PetInfoWidthGrid;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_905;

    public class P_PetStorage implements ISerialize 
    {

        public static var P:P_PetStorage = new (P_PetStorage)();

        public var data:PetStorage;


        public function read(_arg_1:IDataInput):void
        {
            var _local_4:PetInfoWidthGrid;
            if (this.data == null){
                this.data = new PetStorage();
            };
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new PetInfoWidthGrid();
                ReadIn(_arg_1, _local_4, P_GridPetInfo);
                this.data.addPet(_local_4);
                _local_4.petInfo.playerID = ProtocolHelper.clientPlayerID;
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_905()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_905 = " P_PetStorage" (String#13991)


