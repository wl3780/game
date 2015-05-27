package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.free.utils.XString;
    
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class SkillGroup implements IXMLSerialize, ISerialize 
    {

        public static const INSTR_SPLIT:String = "/";
        public static const INSTR_ARG:String = "arg";

        public var id:int;
        public var name:String;
        public var actionID:int;
        public var dur_times:int;
        public var cd_times:int;
        public var startCDtime:int;
        public var cd_group:int;
        public var type:int;
        public var careerID:int;
        public var useLevel:int;
        public var skillStep:int;
        public var learnType:int;
        public var preID:int;
        public var coin:int;
        public var itemID:int;
        public var itemNum:int;
        public var skillInfos:Array;
        public var des:String;
        public var des2:String;
        public var des3:String;
        public var instruction:String;
        public var instrArgs:Array;
        public var assetID:int;


        public function get level():int
        {
            return this.id % 100;
        }

        public function decode(xml:XML):void
        {
            this.id = int(xml.@id);
            this.name = String(xml.@name);
            this.actionID = int(xml.@actionID);
            this.dur_times = int(xml.@durTimes);
            this.cd_times = int(xml.@cdTimes);
            this.startCDtime = int(xml.@startCDTime);
            this.cd_group = int(xml.@cdGroup);
            this.type = int(xml.@type);
            this.careerID = int(xml.@careerID);
            this.useLevel = int(xml.@useLevel);
            this.learnType = int(xml.@learnType);
            this.preID = int(xml.@preID);
            this.coin = int(xml.@coin);
            this.itemID = int(xml.@itemID);
            this.itemNum = int(xml.@itemNum);
            this.assetID = int(xml.@assetID);
            
			this.skillInfos = [];
            var skillXML:XMLList = xml.SkillInfo;
            var len:int = skillXML.length();
            var index:int;
            while (index < len) {
            	var skillInfo:SkillInfo = new SkillInfo();
                skillInfo.id = this.id;
                skillInfo.actionID = this.actionID;
                skillInfo.decode(skillXML[index]);
                this.skillInfos[skillInfo.index] = skillInfo;
                index++;
            }
            var desXML:XML = xml.Des[0];
            this.des = desXML == null ? "" : desXML.toString();
            var des2XML:XML = xml.Des2[0];
            this.des2 = des2XML == null ? "" : des2XML.toString();
            if (this.des2.length < 2) {
                this.des2 = "";
            }
            var des3XML:XML = xml.Des3[0];
            this.des3 = des3XML == null ? "" : des3XML.toString();
            if (this.des3.length < 2) {
                this.des3 = "";
            }
            this.instruction = String(xml.@instruction);
            this.instrArgs = this.instruction.split(INSTR_SPLIT);
            this.instruction = this.instrArgs[0];
        }

        public function encode()
        {
            var xml:XML = <SkillGroup/>;
            xml.@id = this.id;
            xml.@name = this.name;
            xml.@actionID = this.actionID;
            xml.@durTimes = this.dur_times;
            xml.@cdTimes = this.cd_times;
            xml.@startCDTime = this.startCDtime;
            xml.@cdGroup = this.cd_group;
            xml.@type = this.type;
            xml.@careerID = this.careerID;
            xml.@useLevel = this.useLevel;
            xml.@learnType = this.learnType;
            xml.@preID = this.preID;
            xml.@coin = this.coin;
            xml.@itemID = this.itemID;
            xml.@itemNum = this.itemNum;
            xml.@assetID = this.assetID;
			
            var len:int = this.skillInfos.length;
            var index:int;
            while (index < len) {
	            var skillInfo:SkillInfo = this.skillInfos[index];
                xml.appendChild(skillInfo.encode());
                index++;
            }
            var desXML:XML = <Des/>;
            desXML.appendChild(this.des);
            xml.appendChild(desXML);
            var des2XML:XML = <Des2/>;
            des2XML.appendChild(this.des2);
            xml.appendChild(des2XML);
            var des3XML:XML = <Des3/>;
            des3XML.appendChild(this.des3);
            xml.appendChild(des3XML);
			
            if (this.instrArgs != null) {
                xml.@instruction = this.instrArgs.join(INSTR_SPLIT);
            } else {
                xml.@instruction = "";
            }
            return xml;
        }

        public function read(data:IDataInput):void
        {
            this.id = data.readInt();
            this.name = XString.ReadString(data);
            this.actionID = data.readInt();
            this.dur_times = data.readInt();
            this.cd_times = data.readInt();
            this.startCDtime = data.readInt();
            this.cd_group = data.readInt();
            this.type = data.readInt();
            this.careerID = data.readInt();
            this.useLevel = data.readInt();
            this.learnType = data.readInt();
            this.preID = data.readInt();
            this.coin = data.readInt();
            this.itemID = data.readInt();
            this.itemNum = data.readInt();
            this.assetID = data.readInt();
			
            this.skillInfos = [];
            var len:int = data.readInt();
            var index:int;
            while (index < len) {
	            var skillInfo:SkillInfo = new SkillInfo();
                skillInfo.id = this.id;
                skillInfo.actionID = this.actionID;
                skillInfo.read(data);
                this.skillInfos[skillInfo.index] = skillInfo;
                index++;
            }
            this.des = XString.ReadString(data);
            this.des2 = XString.ReadString(data);
            this.des3 = XString.ReadString(data);
            this.instruction = XString.ReadString(data);
            this.instrArgs = this.instruction.split(INSTR_SPLIT);
            this.instruction = this.instrArgs[0];
        }

        public function write(data:IDataOutput):void
        {
            data.writeInt(this.id);
            XString.WriteString(data, this.name);
            data.writeInt(this.actionID);
            data.writeInt(this.dur_times);
            data.writeInt(this.cd_times);
            data.writeInt(this.startCDtime);
            data.writeInt(this.cd_group);
            data.writeInt(this.type);
            data.writeInt(this.careerID);
            data.writeInt(this.useLevel);
            data.writeInt(this.learnType);
            data.writeInt(this.preID);
            data.writeInt(this.coin);
            data.writeInt(this.itemID);
            data.writeInt(this.itemNum);
            data.writeInt(this.assetID);
			
            var len:int = this.skillInfos.length;
            data.writeInt(len);
            var index:int;
            while (index < len) {
	            var skillInfo:SkillInfo = this.skillInfos[index];
                skillInfo.write(data);
                index++;
            }
            XString.WriteString(data, this.des);
            XString.WriteString(data, this.des2);
            XString.WriteString(data, this.des3);
            XString.WriteString(data, this.instrArgs.join(INSTR_SPLIT));
        }

    }
}
