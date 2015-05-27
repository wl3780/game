// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PSkillShortcutProtocol

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1029;

    public class PSkillShortcutProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_SKILL_SHORTCUT_REQ;//524357
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_SKILL_SHORTCUT_RSP;//524358

        public var skillID:int;
        public var skillPos:int;
        public var result:int;
        public var preSkillID:int;
        public var preSkillIDPos:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.skillID = _arg_1.readUnsignedInt();
                this.skillPos = _arg_1.readByte();
                this.preSkillID = _arg_1.readUnsignedInt();
                this.preSkillIDPos = _arg_1.readByte();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.skillID);
            _arg_1.writeByte(this.skillPos);
        }

        public /*  ©init. */ function _SafeStr_1029()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1029 = " PSkillShortcutProtocol" (String#14858)


