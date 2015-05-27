// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MonsterAISkillParam

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_274;

    public class MonsterAISkillParam implements IXMLSerialize, ISerialize 
    {

        public var aType:int;
        public var sType:int;
        public var skillID:int;
        public var skill:SkillGroup;
        public var tType:int;
        public var tTime:int;
        public var tHPP:Number;
        public var tRandomP:Number;
        public var tP:Number;
        public var durCycles:int;
        public var dmgTotal:int;
        public var yPos:int = 0;
        public var num:int = 0;
        public var bDialogId:Array;

        public function MonsterAISkillParam()
        {
            this.bDialogId = new Array();
            super();
        }

        public function decode(_arg_1:XML):void
        {
            this.aType = int(_arg_1.@aType);
            this.sType = int(_arg_1.@sType);
            this.skillID = int(_arg_1.@skillID);
            this.skill = DEFINE.DM.getSkillGroup(this.skillID);
            this.tType = int(_arg_1.@tType);
            this.tTime = int(_arg_1.@tTime);
            this.durCycles = int(_arg_1.@durCycles);
            this.tHPP = DEFINE.CAST_FLOAT(int(_arg_1.@tHPP));
            this.tRandomP = DEFINE.CAST_FLOAT(int(_arg_1.@tRandomP));
            this.tP = DEFINE.CAST_FLOAT(int(_arg_1.@tP));
            this.dmgTotal = int(_arg_1.@dmgTotal);
            this.num = int(_arg_1.@num);
            var _local_2:String = _arg_1.@bDialogId;
            this.bDialogId = _local_2.split(",");
            this.yPos = int(_arg_1.@yPos);
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.aType = _arg_1.readByte();
            this.sType = _arg_1.readByte();
            this.skillID = _arg_1.readInt();
            this.skill = DEFINE.DM.getSkillGroup(this.skillID);
            this.tType = _arg_1.readByte();
            this.tTime = _arg_1.readShort();
            this.durCycles = _arg_1.readShort();
            this.tHPP = _arg_1.readDouble();
            this.tRandomP = _arg_1.readDouble();
            this.tP = _arg_1.readDouble();
            this.dmgTotal = _arg_1.readShort();
            this.num = _arg_1.readByte();
            this.bDialogId = _arg_1.readUTF().split(",");
            this.yPos = _arg_1.readByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.aType);
            _arg_1.writeByte(this.sType);
            _arg_1.writeInt(this.skillID);
            _arg_1.writeByte(this.tType);
            _arg_1.writeShort(this.tTime);
            _arg_1.writeShort(this.durCycles);
            _arg_1.writeDouble(this.tHPP);
            _arg_1.writeDouble(this.tRandomP);
            _arg_1.writeDouble(this.tP);
            _arg_1.writeShort(this.dmgTotal);
            _arg_1.writeByte(this.num);
            _arg_1.writeUTF(this.bDialogId.join(","));
            _arg_1.writeByte(this.yPos);
        }

        public /*  ©init. */ function _SafeStr_274()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_274 = " MonsterAISkillParam" (String#14522)


