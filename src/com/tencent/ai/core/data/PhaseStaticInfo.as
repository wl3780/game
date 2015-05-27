// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PhaseStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_307;
    import __AS3__.vec.*;

    public class PhaseStaticInfo implements ISerialize 
    {

        public var id:int;
        public var type:int;
        public var commitType:int;
        public var commitNPC:uint;
        public var conditions:Vector.<ConditionStaticInfo>;
        public var nextPhase:Vector.<int>;
        public var awards:Vector.<AwardStaticInfo>;
        public var description:String;
        public var scene1:int;
        public var scene2:int;
        public var goOnDialogID:int;
        public var commitDialogID:int;
        public var dupPlanetID:int;
        private var _Script:XML;
        public var dupID:int;
        public var scriptInfo:ScriptInfo;


        public function decodeForParse(_arg_1:XML):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:XMLList;
            var _local_5:XML;
            var _local_6:ConditionStaticInfo;
            var _local_7:AwardStaticInfo;
            this.id = int(_arg_1.@id);
            this.type = int(_arg_1.@type);
            this.commitType = int(_arg_1.@commitType);
            this.commitNPC = uint(_arg_1.@commitNPC);
            this.description = String(_arg_1.description);
            this.scene1 = int(_arg_1.@auto_scene_1);
            this.scene2 = int(_arg_1.@auto_scene_2);
            this.dupPlanetID = int(_arg_1.@auto_scene_type);
            this.dupID = int(_arg_1.@auto_dup_id);
            this.conditions = new Vector.<ConditionStaticInfo>();
            _local_4 = _arg_1.conditions.condition;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = _local_4[_local_2];
                _local_6 = new ConditionStaticInfo();
                _local_6.decode(_local_5);
                this.conditions.push(_local_6);
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
            this.nextPhase = new Vector.<int>();
            _local_4 = _arg_1.phases.phase;
            _local_3 = _local_4.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.nextPhase.push(int(_local_4[_local_2].@id));
                _local_2++;
            };
            this.commitDialogID = int(_arg_1.dialogs.@id);
            this.goOnDialogID = int(_arg_1.@goOnDialogID);
            if (((_arg_1.go.length()) && (_arg_1.go[0].Script.length()))){
                this._Script = _arg_1.go[0].Script[0];
            };
        }

        public function decode(_arg_1:XML):void
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            var _local_5:XMLList;
            var _local_6:ConditionStaticInfo;
            var _local_7:AwardStaticInfo;
            this.id = int(_arg_1.@id);
            this.type = int(_arg_1.@type);
            this.commitType = int(_arg_1.@commitType);
            this.commitNPC = uint(_arg_1.@commitNPC);
            this.description = String(_arg_1.description);
            this.scene1 = int(_arg_1.@scene1);
            this.scene2 = int(_arg_1.@scene2);
            this.dupPlanetID = int(_arg_1.@dupPlanetID);
            this.dupID = int(_arg_1.@dupID);
            this.conditions = new Vector.<ConditionStaticInfo>();
            _local_5 = _arg_1.conditions.condition;
            _local_4 = _local_5.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_6 = new ConditionStaticInfo();
                _local_6.decode(_local_5[_local_3]);
                this.conditions.push(_local_6);
                _local_3++;
            };
            this.awards = new Vector.<AwardStaticInfo>();
            _local_5 = _arg_1.awards.award;
            _local_4 = _local_5.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = new AwardStaticInfo();
                _local_7.decode(_local_5[_local_3]);
                this.awards.push(_local_7);
                _local_3++;
            };
            this.nextPhase = new Vector.<int>();
            _local_2 = String(_arg_1.nextPhase).split(",");
            _local_4 = _local_2.length;
            _local_3 = 0;
            while (_local_3 < _local_4) {
                if (int(_local_2[_local_3]) > 0){
                    this.nextPhase.push(int(_local_2[_local_3]));
                };
                _local_3++;
            };
            this.commitDialogID = int(_arg_1.@commitDialogID);
            this.goOnDialogID = int(_arg_1.@goOnDialogID);
            if (_arg_1.Script.length()){
                this.scriptInfo = new ScriptInfo();
                this.scriptInfo.decode(_arg_1.Script[0]);
            };
        }

        public function encode():XML
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:XML = <phase/>
            ;
            _local_1.@id = this.id;
            _local_1.@type = this.type;
            _local_1.@commitType = this.commitType;
            _local_1.@commitNPC = this.commitNPC;
            _local_1.description = this.description;
            _local_1.@scene1 = this.scene1;
            _local_1.@scene2 = this.scene2;
            _local_1.@dupPlanetID = this.dupPlanetID;
            _local_1.@dupID = this.dupID;
            _local_1.@commitDialogID = this.commitDialogID;
            _local_1.@goOnDialogID = this.goOnDialogID;
            _local_3 = this.conditions.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.conditions.condition = (_local_1.conditions.condition + this.conditions[_local_2].encode());
                _local_2++;
            };
            _local_3 = this.awards.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.awards.award = (_local_1.awards.award + this.awards[_local_2].encode());
                _local_2++;
            };
            _local_3 = this.awards.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_1.awards.award = (_local_1.awards.award + this.awards[_local_2].encode());
                _local_2++;
            };
            _local_1.nextPhase = this.nextPhase.join(",");
            if (this._Script){
                _local_1.Script = this._Script;
            };
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ConditionStaticInfo;
            var _local_5:AwardStaticInfo;
            this.id = _arg_1.readInt();
            this.type = _arg_1.readInt();
            this.commitType = _arg_1.readInt();
            this.commitNPC = _arg_1.readUnsignedInt();
            this.description = _arg_1.readUTF();
            this.scene1 = _arg_1.readInt();
            this.scene2 = _arg_1.readInt();
            this.dupPlanetID = _arg_1.readInt();
            this.dupID = _arg_1.readInt();
            this.conditions = new Vector.<ConditionStaticInfo>();
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ConditionStaticInfo();
                _local_4.read(_arg_1);
                this.conditions.push(_local_4);
                _local_2++;
            };
            this.awards = new Vector.<AwardStaticInfo>();
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new AwardStaticInfo();
                _local_5.read(_arg_1);
                this.awards.push(_local_5);
                _local_2++;
            };
            this.nextPhase = _arg_1.readObject();
            this.commitDialogID = _arg_1.readInt();
            this.goOnDialogID = _arg_1.readInt();
            if (_arg_1.readBoolean()){
                this.scriptInfo = new ScriptInfo();
                this.scriptInfo.read(_arg_1);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ConditionStaticInfo;
            var _local_5:AwardStaticInfo;
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.commitType);
            _arg_1.writeUnsignedInt(this.commitNPC);
            _arg_1.writeUTF(this.description);
            _arg_1.writeInt(this.scene1);
            _arg_1.writeInt(this.scene2);
            _arg_1.writeInt(this.dupPlanetID);
            _arg_1.writeInt(this.dupID);
            _local_3 = this.conditions.length;
            _arg_1.writeInt(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = this.conditions[_local_2];
                _local_4.write(_arg_1);
                _local_2++;
            };
            _local_3 = this.awards.length;
            _arg_1.writeInt(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = this.awards[_local_2];
                _local_5.write(_arg_1);
                _local_2++;
            };
            _arg_1.writeObject(this.nextPhase);
            _arg_1.writeInt(this.commitDialogID);
            _arg_1.writeInt(this.goOnDialogID);
            if (this.scriptInfo){
                _arg_1.writeBoolean(true);
                this.scriptInfo.write(_arg_1);
            } else {
                _arg_1.writeBoolean(false);
            };
        }

        public /*  ©init. */ function _SafeStr_307()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_307 = " PhaseStaticInfo" (String#15713)


