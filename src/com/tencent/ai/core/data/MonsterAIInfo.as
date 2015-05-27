// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MonsterAIInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_273;
    import __AS3__.vec.*;

    public class MonsterAIInfo implements IXMLSerialize, ISerialize 
    {

        public var aiID:int;
        public var aTimes:int;
        public var aType:int;
        public var aiEditionType:int = 0;
        public var firstBloodP:Number = 1;
        public var roamR:int;
        public var roamRZ:int;
        public var roamPZ:Number;
        public var roamP:Number;
        public var wantBeHurtP:Number = 0;
        public var chaseR:int;
        public var sightLineR:int;
        public var idleP:Number;
        public var durCycles:int;
        public var skillParams:Vector.<MonsterAISkillParam>;
        public var buffParams:Vector.<MonsterBuffInfo>;
        public var monsterIQ:int;
        public var monsterTemper:int;
        public var monsterRageUp:int = 0;
        public var monsterRageDown:int = 0;
        public var isFlyMonster:Boolean = false;
        public var monsterType:int;
        public var yPos1:int;
        public var yPos2:int;
        public var yPos3:int;
        public var mp:int;
        public var bDialogId:Array;
        public var bDialogId2:Array;
        public var specialAIType:int = 0;

        public function MonsterAIInfo()
        {
            this.bDialogId = new Array();
            this.bDialogId2 = new Array();
            super();
        }

        public function decode(_arg_1:XML):void
        {
            var _local_10:MonsterAISkillParam;
            var _local_11:MonsterBuffInfo;
            this.aiID = int(_arg_1.@id);
            this.aTimes = int(_arg_1.@aTimes);
            this.aType = int(_arg_1.@aType);
            this.roamR = int(_arg_1.@roamR);
            this.roamRZ = int(_arg_1.@roamRZ);
            this.roamPZ = DEFINE.CAST_FLOAT(int(_arg_1.@roamPZ));
            this.roamP = DEFINE.CAST_FLOAT(int(_arg_1.@roamP));
            this.chaseR = int(_arg_1.@chaseR);
            this.sightLineR = int(_arg_1.@sightLineR);
            this.idleP = DEFINE.CAST_FLOAT(int(_arg_1.@idleP));
            this.durCycles = int(_arg_1.@durCycles);
            this.monsterIQ = int(_arg_1.@monsterIQ);
            this.monsterTemper = int(_arg_1.@monsterTemper);
            this.monsterRageUp = int(_arg_1.@rageUp);
            this.monsterRageDown = int(_arg_1.@rageDown);
            this.aiEditionType = int(_arg_1.@aiType);
            this.firstBloodP = DEFINE.CAST_FLOAT(int(_arg_1.@firstBloodP));
            this.wantBeHurtP = DEFINE.CAST_FLOAT(int(_arg_1.@wantBeHurtP));
            this.isFlyMonster = (int(_arg_1.@monsterType) == 1);
            this.monsterType = int(_arg_1.@monsterType);
            this.yPos1 = int(_arg_1.@yPos1);
            this.yPos2 = int(_arg_1.@yPos2);
            this.yPos3 = int(_arg_1.@yPos3);
            var _local_2:String = _arg_1.@bDialogId;
            this.bDialogId = _local_2.split(",");
            var _local_3:String = _arg_1.@bDialogId2;
            this.bDialogId2 = _local_3.split(",");
            var _local_4:XMLList = _arg_1.MonsterAISkillParam;
            var _local_5:int = _local_4.length();
            this.skillParams = new Vector.<MonsterAISkillParam>();
            var _local_6:int;
            while (_local_6 < _local_5) {
                _local_10 = new MonsterAISkillParam();
                _local_10.decode(_local_4[_local_6]);
                this.skillParams.push(_local_10);
                _local_6++;
            };
            var _local_7:XMLList = _arg_1.MonsterBuffParam;
            var _local_8:int = _local_7.length();
            this.buffParams = new Vector.<MonsterBuffInfo>();
            var _local_9:int;
            while (_local_9 < _local_8) {
                _local_11 = new MonsterBuffInfo();
                _local_11.decode(_local_7[_local_9]);
                this.buffParams.push(_local_11);
                _local_9++;
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:MonsterAISkillParam;
            var _local_5:MonsterBuffInfo;
            this.aiID = _arg_1.readInt();
            this.aTimes = _arg_1.readShort();
            this.aType = _arg_1.readByte();
            this.roamR = _arg_1.readShort();
            this.roamRZ = _arg_1.readShort();
            this.roamPZ = _arg_1.readDouble();
            this.roamP = _arg_1.readDouble();
            this.chaseR = _arg_1.readShort();
            this.sightLineR = _arg_1.readShort();
            this.idleP = DEFINE.CAST_FLOAT(_arg_1.readShort());
            this.durCycles = _arg_1.readShort();
            this.monsterIQ = _arg_1.readByte();
            this.monsterTemper = _arg_1.readByte();
            this.monsterRageUp = _arg_1.readShort();
            this.monsterRageDown = _arg_1.readShort();
            this.aiEditionType = _arg_1.readByte();
            this.firstBloodP = _arg_1.readDouble();
            this.wantBeHurtP = _arg_1.readDouble();
            this.isFlyMonster = _arg_1.readBoolean();
            this.monsterType = _arg_1.readByte();
            this.yPos1 = _arg_1.readShort();
            this.yPos2 = _arg_1.readShort();
            this.yPos3 = _arg_1.readShort();
            var _local_2:int;
            this.bDialogId = _arg_1.readUTF().split(",");
            this.bDialogId2 = _arg_1.readUTF().split(",");
            _local_3 = _arg_1.readUnsignedShort();
            this.skillParams = new Vector.<MonsterAISkillParam>();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new MonsterAISkillParam();
                _local_4.read(_arg_1);
                this.skillParams.push(_local_4);
                _local_2++;
            };
            _local_3 = _arg_1.readUnsignedShort();
            this.buffParams = new Vector.<MonsterBuffInfo>();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new MonsterBuffInfo();
                _local_5.read(_arg_1);
                this.buffParams.push(_local_5);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.aiID);
            _arg_1.writeShort(this.aTimes);
            _arg_1.writeByte(this.aType);
            _arg_1.writeShort(this.roamR);
            _arg_1.writeShort(this.roamRZ);
            _arg_1.writeDouble(this.roamPZ);
            _arg_1.writeDouble(this.roamP);
            _arg_1.writeShort(this.chaseR);
            _arg_1.writeShort(this.sightLineR);
            _arg_1.writeShort((this.idleP * DEFINE.RATE_DENOM));
            _arg_1.writeShort(this.durCycles);
            _arg_1.writeByte(this.monsterIQ);
            _arg_1.writeByte(this.monsterTemper);
            _arg_1.writeShort(this.monsterRageUp);
            _arg_1.writeShort(this.monsterRageDown);
            _arg_1.writeByte(this.aiEditionType);
            _arg_1.writeDouble(this.firstBloodP);
            _arg_1.writeDouble(this.wantBeHurtP);
            _arg_1.writeBoolean(this.isFlyMonster);
            _arg_1.writeByte(this.monsterType);
            _arg_1.writeShort(this.yPos1);
            _arg_1.writeShort(this.yPos2);
            _arg_1.writeShort(this.yPos3);
            var _local_2:int;
            _arg_1.writeUTF(this.bDialogId.join(","));
            _arg_1.writeUTF(this.bDialogId2.join(","));
            _arg_1.writeShort(this.skillParams.length);
            _local_2 = 0;
            while (_local_2 < this.skillParams.length) {
                this.skillParams[_local_2].write(_arg_1);
                _local_2++;
            };
            _arg_1.writeShort(this.buffParams.length);
            _local_2 = 0;
            while (_local_2 < this.buffParams.length) {
                this.buffParams[_local_2].write(_arg_1);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_273()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_273 = " MonsterAIInfo" (String#15776)


