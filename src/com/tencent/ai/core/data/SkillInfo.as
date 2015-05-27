package com.tencent.ai.core.data
{
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.free.utils.XString;
    
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class SkillInfo implements IXMLSerialize 
    {

        public static const HURT_DIR_AUTO:int = 0;
        public static const HURT_DIR_OPPO:int = 1;
        public static const HURT_DIR_SAME:int = 2;

        public var id:int;
        public var actionID:int;
        public var index:int;
        public var frameIndex:int;
        public var attackType:int;
        public var hurtType:int;
        public var type:int;
        public var hurt_eid:int;
        public var wheBool:Boolean;
        public var hurt_color:int;
        public var hurt_shake:int;
        public var hurt_fixDir:int;
        public var powerX:int;
        public var powerY:int;
        public var powerX2:int;
        public var powerY2:int;
        public var randomDY:int;
        public var freezTimes:int;
        public var attackDZ:int;
        public var attackDX:int;
        public var attackDY:int = 1000;
        public var mana_cost:int;
        public var angryVal_cost:int;
        public var dmg_rate:Number = 1;
        public var dmg_value:int;
        public var dmg_mulitple:int;
        public var dmg_interval:int;
        public var stiff_rate:Number = 1;
        public var variable0:int;
        public var variable1:int;
        public var init_funcIDs:Array;
        public var start_funcIDs:Array;
        public var hit_funcIDs:Array;
        public var event_funcIDs:Array;
        public var scriptArgs:Array;


        protected function strToArray(str:String):Array
        {
            if (str  && str != "0") {
                return str.split(",");
            }
            return null;
        }

        protected function arrToString(arr:Array):String
        {
            if (arr == null) {
                return "";
            }
            return arr.join(",");
        }

        public function decode(xml:XML):void
        {
            this.type = int(xml.@type);
            this.attackType = int(xml.@aType);
            this.hurtType = int(xml.@hType);
            this.index = int(xml.@index);
            this.frameIndex = int(xml.@frameIndex);
            this.hurt_eid = int(xml.@heid);
            this.wheBool = (int(xml.@wheBool) == 1);
            this.hurt_color = int(xml.@color);
            this.hurt_shake = int(xml.@shake);
            this.hurt_fixDir = int(xml.@fixDir);
            this.powerX = int(xml.@px);
            this.powerY = int(xml.@py);
            this.powerX2 = int(xml.@powerX2);
            this.powerY2 = int(xml.@powerY2);
            this.randomDY = int(xml.@randomDY);
            this.freezTimes = int(xml.@fTimes);
            this.attackDZ = int(xml.@adz);
            this.attackDX = int(xml.@adx);
            if (xml.@ady != "") {
                this.attackDY = int(xml.@ady);
            }
            this.mana_cost = int(xml.@manaCost);
            this.angryVal_cost = int(xml.@angryValCost);
            this.dmg_rate = DEFINE.CAST_FLOAT(int(xml.@dmgRate));
            this.dmg_value = int(xml.@dmgValue);
            this.dmg_mulitple = int(xml.@dmgMultiple);
            this.dmg_interval = int(xml.@dmgInterval);
            this.stiff_rate = DEFINE.CAST_FLOAT(int(xml.@stiffRate));
            if (this.stiff_rate == 0) {
                this.stiff_rate = 1;
            }
            this.variable0 = int(xml.@variable0);
            this.variable1 = int(xml.@variable1);
            this.hit_funcIDs = this.strToArray(xml.@hit_funcIDs);
            this.event_funcIDs = this.strToArray(xml.@event_funcIDs);
            this.start_funcIDs = this.strToArray(xml.@start_funcIDs);
            this.init_funcIDs = this.strToArray(xml.@init_funcIDs);
            
			var argXML:XMLList = xml.ActionArg;
            var len:int = argXML.length();
            if (len > 0) {
                this.scriptArgs = [];
	            var idx:int = 0;
                while (idx < len) {
		            var scriptArg:ScriptArg = new ScriptArg();
                    scriptArg.decode(argXML[idx]);
                    this.scriptArgs.push(scriptArg);
                    idx++;
                }
            }
        }

        public function encode()
        {
            var xml:XML = <SkillInfo/>;
            xml.@type = this.type;
            xml.@aType = this.attackType;
            xml.@hType = this.hurtType;
            xml.@index = this.index;
            xml.@frameIndex = this.frameIndex;
            xml.@heid = this.hurt_eid;
            xml.@wheBool = ((this.wheBool) ? 1 : 0);
            xml.@color = this.hurt_color;
            xml.@shake = this.hurt_shake;
            xml.@fixDir = this.hurt_fixDir;
            xml.@px = this.powerX;
            xml.@py = this.powerY;
            xml.@powerX2 = this.powerX2;
            xml.@powerY2 = this.powerY2;
            xml.@randomDY = this.randomDY;
            xml.@fTimes = this.freezTimes;
            xml.@adz = this.attackDZ;
            xml.@adx = this.attackDX;
            xml.@ady = this.attackDY;
            xml.@manaCost = this.mana_cost;
            xml.@angryValCost = this.angryVal_cost;
            xml.@dmgRate = (this.dmg_rate * DEFINE.RATE_DENOM);
            xml.@dmgValue = this.dmg_value;
            xml.@dmgMultiple = this.dmg_mulitple;
            xml.@dmgInterval = this.dmg_interval;
            xml.@stiffRate = (this.stiff_rate * DEFINE.RATE_DENOM);
            xml.@variable0 = this.variable0;
            xml.@variable1 = this.variable1;
            xml.@hit_funcIDs = this.arrToString(this.hit_funcIDs);
            xml.@event_funcIDs = this.arrToString(this.event_funcIDs);
            xml.@start_funcIDs = this.arrToString(this.start_funcIDs);
            xml.@init_funcIDs = this.arrToString(this.init_funcIDs);
            
			var len:int = this.scriptArgs == null ? 0 : this.scriptArgs.length;
            if (len > 0) {
            	var idx:int = 0;
                while (idx < len) {
		            var scriptArg:ScriptArg = this.scriptArgs[idx];
                    xml.appendChild(scriptArg.encode());
                    idx++;
                }
            }
            return xml;
        }

        public function toString():String
        {
            return "技能ID_" + this.id + "_段_" + this.index;
        }

        public function read(data:IDataInput):void
        {
            this.type = data.readUnsignedByte();
            this.attackType = data.readByte();
            this.hurtType = data.readByte();
            this.index = data.readUnsignedInt();
            this.frameIndex = data.readByte();
            this.hurt_eid = data.readUnsignedInt();
            this.wheBool = data.readBoolean();
            this.hurt_color = data.readUnsignedInt();
            this.hurt_shake = data.readUnsignedByte();
            this.hurt_fixDir = data.readByte();
            this.powerX = data.readUnsignedInt();
            this.powerY = data.readUnsignedInt();
            this.powerX2 = data.readUnsignedInt();
            this.powerY2 = data.readUnsignedInt();
            this.randomDY = data.readUnsignedInt();
            this.freezTimes = data.readUnsignedByte();
            this.attackDZ = data.readShort();
            this.attackDX = data.readShort();
            this.attackDY = data.readShort();
            this.mana_cost = data.readUnsignedShort();
            this.angryVal_cost = data.readUnsignedShort();
            this.dmg_rate = data.readDouble();
            this.dmg_value = data.readUnsignedInt();
            this.dmg_mulitple = data.readUnsignedInt();
            this.dmg_interval = data.readUnsignedInt();
            this.stiff_rate = data.readDouble();
            if (this.stiff_rate == 0) {
                this.stiff_rate = 1;
            }
            this.variable0 = data.readUnsignedInt();
            this.variable1 = data.readUnsignedInt();
            this.hit_funcIDs = this.strToArray(XString.ReadString(data));
            this.event_funcIDs = this.strToArray(XString.ReadString(data));
            this.start_funcIDs = this.strToArray(XString.ReadString(data));
            this.init_funcIDs = this.strToArray(XString.ReadString(data));
            
            var len:int = data.readInt();
            if (len > 0) {
                this.scriptArgs = [];
				var idx:int = 0;
                while (idx < len) {
		            var scriptArg:ScriptArg = new ScriptArg();
                    scriptArg.read(data);
                    this.scriptArgs.push(scriptArg);
                    idx++;
                }
            }
        }

        public function write(data:IDataOutput):void
        {
            data.writeByte(this.type);
            data.writeByte(this.attackType);
            data.writeByte(this.hurtType);
            data.writeUnsignedInt(this.index);
            data.writeByte(this.frameIndex);
            data.writeUnsignedInt(this.hurt_eid);
            data.writeBoolean(this.wheBool);
            data.writeInt(this.hurt_color);
            data.writeByte(this.hurt_shake);
            data.writeByte(this.hurt_fixDir);
            data.writeUnsignedInt(this.powerX);
            data.writeUnsignedInt(this.powerY);
            data.writeUnsignedInt(this.powerX2);
            data.writeUnsignedInt(this.powerY2);
            data.writeUnsignedInt(this.randomDY);
            data.writeByte(this.freezTimes);
            data.writeShort(this.attackDZ);
            data.writeShort(this.attackDX);
            data.writeShort(this.attackDY);
            data.writeShort(this.mana_cost);
            data.writeShort(this.angryVal_cost);
            data.writeDouble(this.dmg_rate);
            data.writeUnsignedInt(this.dmg_value);
            data.writeUnsignedInt(this.dmg_mulitple);
            data.writeUnsignedInt(this.dmg_interval);
            data.writeDouble(this.stiff_rate);
            data.writeUnsignedInt(this.variable0);
            data.writeUnsignedInt(this.variable1);
            XString.WriteString(data, this.arrToString(this.hit_funcIDs));
            XString.WriteString(data, this.arrToString(this.event_funcIDs));
            XString.WriteString(data, this.arrToString(this.start_funcIDs));
            XString.WriteString(data, this.arrToString(this.init_funcIDs));
            
            var len:int = this.scriptArgs ? this.scriptArgs.length : 0;
            data.writeInt(len);
            var idx:int;
            while (idx < len) {
				var scriptArg:ScriptArg = this.scriptArgs[idx];
                scriptArg.write(data);
                idx++;
            }
        }

    }
}
