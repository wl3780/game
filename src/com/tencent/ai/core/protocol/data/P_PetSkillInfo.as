// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PetSkillInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetSkillInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_904;

    public class P_PetSkillInfo implements ISerialize 
    {

        public static var P:P_PetSkillInfo = new (P_PetSkillInfo)();

        public var data:PetSkillInfo;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new PetSkillInfo();
            };
            this.data.position = _arg_1.readUnsignedByte();
            this.data.skillType = _arg_1.readUnsignedByte();
            this.data.skillID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_904()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_904 = " P_PetSkillInfo" (String#17168)


