// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PLearnSkillProtocol

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1009;

    public class PLearnSkillProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_LEARN_SKILL_REQ;//524373
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_LEARN_SKILL_RSP;//524374

        public var skillID:uint;
        public var result:int;
        public var preSkillID:uint;
        public var preBaseSkillID:uint;
        public var baseSkillID:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.preSkillID = _arg_1.readUnsignedInt();
                this.skillID = _arg_1.readUnsignedInt();
                this.preBaseSkillID = _arg_1.readUnsignedInt();
                this.baseSkillID = _arg_1.readUnsignedInt();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.skillID);
        }

        public /*  ©init. */ function _SafeStr_1009()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1009 = " PLearnSkillProtocol" (String#14879)


