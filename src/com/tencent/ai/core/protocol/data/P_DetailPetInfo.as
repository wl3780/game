// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_DetailPetInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_880;

    public class P_DetailPetInfo implements ISerialize 
    {

        public static var P:P_DetailPetInfo = new (P_DetailPetInfo)();

        public var data:PetInfo;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new PetInfo();
            };
            ReadIn(_arg_1, this.data, P_BasePetInfo);
            ReadIn(_arg_1, this.data, P_CombatAttrib);
            this.data.originExp = _arg_1.readUnsignedInt();
            this.data.maxExp = _arg_1.readUnsignedInt();
            this.data.nextSkillLevel = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_880()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_880 = " P_DetailPetInfo" (String#15950)


