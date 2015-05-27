// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_SkillInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_916;

    public class P_SkillInfo implements ISerialize 
    {

        public var flag:int;
        public var skillID:uint;
        public var baseSkillID:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.flag = _arg_1.readUnsignedByte();
            this.skillID = _arg_1.readUnsignedInt();
            this.baseSkillID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.flag);
            _arg_1.writeUnsignedInt(this.skillID);
            _arg_1.writeUnsignedInt(this.baseSkillID);
        }

        public /*  ©init. */ function _SafeStr_916()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_916 = " P_SkillInfo" (String#15632)


