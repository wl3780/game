// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.P_TransPetGuardChoosePet

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_970;

    public class P_TransPetGuardChoosePet implements ISerialize 
    {

        public static const REQ:int = 524747;
        public static const RSP:int = 524748;

        public var result:int;
        public var pet_sid:uint;
        public var hp_max_to_add:uint;
        public var physical_attack_to_add:uint;
        public var physical_defend_to_add:uint;
        public var magic_attack_to_add:uint;
        public var magic_defend_to_add:uint;
        public var cri_rate_to_add:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result != 0){
                return;
            };
            this.pet_sid = _arg_1.readUnsignedInt();
            this.hp_max_to_add = _arg_1.readUnsignedShort();
            this.physical_attack_to_add = _arg_1.readUnsignedShort();
            this.physical_defend_to_add = _arg_1.readUnsignedShort();
            this.magic_attack_to_add = _arg_1.readUnsignedShort();
            this.magic_defend_to_add = _arg_1.readUnsignedShort();
            this.cri_rate_to_add = _arg_1.readUnsignedShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.pet_sid);
        }

        public /*  ©init. */ function _SafeStr_970()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_970 = " P_TransPetGuardChoosePet" (String#16262)


