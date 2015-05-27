// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MissionStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_272;
    import __AS3__.vec.*;

    public class MissionStaticInfo implements ISerialize 
    {

        public var id:int;
        public var name:String;
        public var shelve:Boolean;
        public var type:int;
        public var specialType:int;
        public var order:int;
        public var npcOrder:int;
        public var careerID:int;
        public var rmdLevel:int;
        public var triggerNpcID:int;
        public var description:String;
        public var description2:String;
        public var preMissions:Vector.<int>;
        public var nextMissions:Vector.<int>;
        public var displayConditions:Vector.<ConditionStaticInfo>;
        public var triggerConditions:Vector.<ConditionStaticInfo>;
        public var awards:Vector.<AwardStaticInfo>;
        public var phases:Vector.<PhaseStaticInfo>;
        public var nextPhase:Vector.<int>;
        public var scene1:int;
        public var acceptDialogID:int;
        public var refuseDialogID:int;
        public var isFinish:Boolean;
        public var indulge:Boolean;

        public function MissionStaticInfo()
        {
            this.preMissions = new Vector.<int>();
            this.nextMissions = new Vector.<int>();
            super();
        }

        public function decodeForParse(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XMLList;
            var _local_5:XML;
            var _local_6:ConditionStaticInfo;
            var _local_7:AwardStaticInfo;
            var _local_8:PhaseStaticInfo;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.shelve = (int(_arg_1.@shelve) == 1);
            this.indulge = (int(_arg_1.@indulge) == 1);
            this.type = (this.id / 10000);
            this.specialType = int(_arg_1.@type);
            this.order = int(_arg_1.@order);
            this.npcOrder = int(_arg_1.@npcOrder);
            this.careerID = int(_arg_1.@careerID);
            this.rmdLevel = int(_arg_1.@rmdLevel);
            this.triggerNpcID = int(_arg_1.@npcID);
            this.description = String(_arg_1.description);
            this.description2 = String(_arg_1.description2);
            this.scene1 = int(_arg_1.@auto_scene);
            this.acceptDialogID = int(_arg_1.dialogs.@id);
            this.refuseDialogID = int(_arg_1.dialogs.@id);
            this.preMissions = new Vector.<int>();
            _local_4 = _arg_1.preMissions.preMission;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.preMissions.push(int(_local_4[_local_2].@id));
                _local_2++;
            };
            this.nextPhase = new Vector.<int>();
            _local_4 = _arg_1.phases.phase;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.nextPhase.push(int(_local_4[_local_2].@id));
                _local_2++;
            };
            this.displayConditions = new Vector.<ConditionStaticInfo>();
            _local_4 = _arg_1.displayConditions.condition;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = _local_4[_local_2];
                _local_6 = new ConditionStaticInfo();
                _local_6.decode(_local_5);
                this.displayConditions.push(_local_6);
                _local_2++;
            };
            this.triggerConditions = new Vector.<ConditionStaticInfo>();
            _local_4 = _arg_1.triggerConditions.condition;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = _local_4[_local_2];
                _local_6 = new ConditionStaticInfo();
                _local_6.decode(_local_5);
                this.triggerConditions.push(_local_6);
                _local_2++;
            };
            this.awards = new Vector.<AwardStaticInfo>();
            _local_4 = _arg_1.awards.award;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = _local_4[_local_2];
                _local_7 = new AwardStaticInfo();
                _local_7.decode(_local_5);
                this.awards.push(_local_7);
                _local_2++;
            };
            this.phases = new Vector.<PhaseStaticInfo>();
            _local_4 = _arg_1.allPhases.phase;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = _local_4[_local_2];
                _local_8 = new PhaseStaticInfo();
                _local_8.decodeForParse(_local_5);
                this.phases.push(_local_8);
                _local_2++;
            };
        }

        public function encode():XML
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XMLList;
            var _local_5:XML;
            var _local_1:XML = <mission/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@shelve = ((this.shelve) ? 1 : 0);
            _local_1.@indulge = ((this.indulge) ? 1 : 0);
            _local_1.@order = this.order;
            _local_1.@npcOrder = this.npcOrder;
            _local_1.@careerID = this.careerID;
            _local_1.@specialType = this.specialType;
            _local_1.@rmdLevel = this.rmdLevel;
            _local_1.@triggerNpcID = this.triggerNpcID;
            _local_1.description = this.description;
            _local_1.description2 = this.description2;
            _local_1.@scene1 = this.scene1;
            _local_1.@acceptDialogID = this.acceptDialogID;
            _local_1.@refuseDialogID = this.refuseDialogID;
            _local_1.preMissions = this.preMissions.join(",");
            _local_1.nextMissions = this.nextMissions.join(",");
            _local_1.nextPhase = this.nextPhase.join(",");
            _local_3 = this.displayConditions.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.displayConditions.condition = (_local_1.displayConditions.condition + this.displayConditions[_local_2].encode());
                _local_2++;
            };
            _local_3 = this.triggerConditions.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.triggerConditions.condition = (_local_1.triggerConditions.condition + this.triggerConditions[_local_2].encode());
                _local_2++;
            };
            _local_3 = this.awards.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.awards.award = (_local_1.awards.award + this.awards[_local_2].encode());
                _local_2++;
            };
            _local_3 = this.phases.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.allPhases.phase = (_local_1.allPhases.phase + this.phases[_local_2].encode());
                _local_2++;
            };
            return (_local_1);
        }

        public function decode(_arg_1:XML):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:XMLList;
            var _local_6:XML;
            var _local_7:ConditionStaticInfo;
            var _local_8:AwardStaticInfo;
            var _local_9:PhaseStaticInfo;
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.shelve = (int(_arg_1.@shelve) == 1);
            this.indulge = (int(_arg_1.@indulge) == 1);
            this.type = (this.id / 10000);
            this.order = int(_arg_1.@order);
            this.npcOrder = int(_arg_1.@npcOrder);
            this.specialType = int(_arg_1.@specialType);
            this.careerID = int(_arg_1.@careerID);
            this.rmdLevel = int(_arg_1.@rmdLevel);
            this.triggerNpcID = int(_arg_1.@triggerNpcID);
            this.description = String(_arg_1.description);
            this.description2 = String(_arg_1.description2);
            this.scene1 = int(_arg_1.@scene1);
            this.acceptDialogID = _arg_1.@acceptDialogID;
            this.refuseDialogID = _arg_1.@refuseDialogID;
            this.nextMissions = new Vector.<int>();
            _local_2 = String(_arg_1.nextMissions).split(",");
            _local_4 = _local_2.length;
            _local_3 = 0;
            while (_local_3 < _local_4) {
                if (int(_local_2[_local_3]) > 0){
                    this.nextMissions.push(int(_local_2[_local_3]));
                };
                _local_3++;
            };
            this.preMissions = new Vector.<int>();
            _local_2 = String(_arg_1.preMissions).split(",");
            _local_4 = _local_2.length;
            _local_3 = 0;
            while (_local_3 < _local_4) {
                if (int(_local_2[_local_3])){
                    this.preMissions.push(int(_local_2[_local_3]));
                };
                _local_3++;
            };
            this.nextPhase = new Vector.<int>();
            _local_2 = String(_arg_1.nextPhase).split(",");
            _local_4 = _local_2.length;
            _local_3 = 0;
            while (_local_3 < _local_4) {
                this.nextPhase.push(int(_local_2[_local_3]));
                _local_3++;
            };
            this.displayConditions = new Vector.<ConditionStaticInfo>();
            _local_5 = _arg_1.displayConditions.condition;
            _local_4 = _local_5.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_6 = _local_5[_local_3];
                _local_7 = new ConditionStaticInfo();
                _local_7.decode(_local_6);
                this.displayConditions.push(_local_7);
                _local_3++;
            };
            this.triggerConditions = new Vector.<ConditionStaticInfo>();
            _local_5 = _arg_1.triggerConditions.condition;
            _local_4 = _local_5.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_6 = _local_5[_local_3];
                _local_7 = new ConditionStaticInfo();
                _local_7.decode(_local_6);
                this.triggerConditions.push(_local_7);
                _local_3++;
            };
            this.awards = new Vector.<AwardStaticInfo>();
            _local_5 = _arg_1.awards.award;
            _local_4 = _local_5.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_6 = _local_5[_local_3];
                _local_8 = new AwardStaticInfo();
                _local_8.decode(_local_6);
                this.awards.push(_local_8);
                _local_3++;
            };
            this.phases = new Vector.<PhaseStaticInfo>();
            _local_5 = _arg_1.allPhases.phase;
            _local_4 = _local_5.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_6 = _local_5[_local_3];
                _local_9 = new PhaseStaticInfo();
                _local_9.decode(_local_6);
                this.phases.push(_local_9);
                _local_3++;
            };
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ConditionStaticInfo;
            var _local_5:AwardStaticInfo;
            var _local_6:PhaseStaticInfo;
            this.id = _arg_1.readInt();
            this.name = _arg_1.readUTF();
            this.shelve = _arg_1.readBoolean();
            this.indulge = _arg_1.readBoolean();
            this.type = _arg_1.readInt();
            this.order = _arg_1.readInt();
            this.npcOrder = _arg_1.readInt();
            this.specialType = _arg_1.readInt();
            this.careerID = _arg_1.readInt();
            this.rmdLevel = _arg_1.readInt();
            this.triggerNpcID = _arg_1.readInt();
            this.description = _arg_1.readUTF();
            this.description2 = _arg_1.readUTF();
            this.scene1 = _arg_1.readInt();
            this.acceptDialogID = _arg_1.readInt();
            this.refuseDialogID = _arg_1.readInt();
            this.nextMissions = _arg_1.readObject();
            this.preMissions = _arg_1.readObject();
            this.nextPhase = _arg_1.readObject();
            this.displayConditions = new Vector.<ConditionStaticInfo>();
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ConditionStaticInfo();
                _local_4.read(_arg_1);
                this.displayConditions.push(_local_4);
                _local_2++;
            };
            this.triggerConditions = new Vector.<ConditionStaticInfo>();
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ConditionStaticInfo();
                _local_4.read(_arg_1);
                this.triggerConditions.push(_local_4);
                _local_2++;
            };
            this.awards = new Vector.<AwardStaticInfo>();
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new AwardStaticInfo();
                _local_5.read(_arg_1);
                this.awards.push(_local_5);
                _local_2++;
            };
            this.phases = new Vector.<PhaseStaticInfo>();
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6 = new PhaseStaticInfo();
                _local_6.read(_arg_1);
                this.phases.push(_local_6);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ConditionStaticInfo;
            var _local_5:AwardStaticInfo;
            var _local_6:PhaseStaticInfo;
            _arg_1.writeInt(this.id);
            _arg_1.writeUTF(this.name);
            _arg_1.writeBoolean(this.shelve);
            _arg_1.writeBoolean(this.indulge);
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.order);
            _arg_1.writeInt(this.npcOrder);
            _arg_1.writeInt(this.specialType);
            _arg_1.writeInt(this.careerID);
            _arg_1.writeInt(this.rmdLevel);
            _arg_1.writeInt(this.triggerNpcID);
            _arg_1.writeUTF(this.description);
            _arg_1.writeUTF(this.description2);
            _arg_1.writeInt(this.scene1);
            _arg_1.writeInt(this.acceptDialogID);
            _arg_1.writeInt(this.refuseDialogID);
            _arg_1.writeObject(this.nextMissions);
            _arg_1.writeObject(this.preMissions);
            _arg_1.writeObject(this.nextPhase);
            _local_3 = this.displayConditions.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.displayConditions[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.triggerConditions.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.triggerConditions[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.awards.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = this.awards[_local_2];
                _local_5.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.phases.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6 = this.phases[_local_2];
                _local_6.write(_arg_1);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_272()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_272 = " MissionStaticInfo" (String#16850)


