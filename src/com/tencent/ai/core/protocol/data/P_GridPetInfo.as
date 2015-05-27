// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_GridPetInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetInfoWidthGrid;
    import com.tencent.ai.core.data.PetInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_888;

    public class P_GridPetInfo implements ISerialize 
    {

        public static var P:P_GridPetInfo = new (P_GridPetInfo)();

        public var data:PetInfoWidthGrid;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new PetInfoWidthGrid();
            };
            this.data.gridID = _arg_1.readUnsignedShort();
            this.data.petInfo = new PetInfo();
            ReadIn(_arg_1, this.data.petInfo, P_DetailPetInfo);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_888()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_888 = " P_GridPetInfo" (String#15173)


