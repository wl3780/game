// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_MonsterAppear

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.status.SSModel;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.PlayerID;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_897;
    import __AS3__.vec.*;

    public class P_MonsterAppear implements ISerialize 
    {

        public static var P:P_MonsterAppear = new (P_MonsterAppear)();

        public var data:MonsterInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:IDataManager;
            var _local_8:SSModel;
            if (this.data == null){
                this.data = new MonsterInfo();
            };
            _local_2 = DEFINE.DM;
            this.data.id = _arg_1.readUnsignedShort();
            this.data.indexID = _arg_1.readUnsignedInt();
            var _local_3:int = _arg_1.readUnsignedInt();
            this.data.level = _arg_1.readUnsignedShort();
            this.data.aiID = _arg_1.readUnsignedInt();
            this.data.aiInfo = _local_2.getMonsterAIInfo(this.data.aiID);
            var _local_4:P_CombatAttrib = P_CombatAttrib.P;
            _local_4.data = this.data;
            _local_4.read(_arg_1);
            _local_4.data = null;
            this.data.refreshType = _arg_1.readUnsignedShort();
            this.data.randomRaduis = _arg_1.readUnsignedShort();
            this.data.mapPosition = new MapPosition();
            this.data.mapPosition.decodeBytes(_arg_1);
            this.data.groupID = ElementGroupDef.PVE_MONSTER;
            this.data.diretion = _arg_1.readByte();
            this.data.appearActionID = _arg_1.readUnsignedInt();
            this.data.disappearEID = 0;
            var _local_5:PlayerID = new PlayerID();
            _local_5.read(_arg_1);
            this.data.masterID = _local_5;
            this.data.masterIndex = _arg_1.readUnsignedShort();
            this.data.maxLifeTime = _arg_1.readUnsignedInt();
            this.data.currentLifeTime = _arg_1.readUnsignedInt();
            this.data.rank = _arg_1.readUnsignedByte();
            this.data.beatType = _arg_1.readUnsignedByte();
            var _local_6:Vector.<SSModel> = new Vector.<SSModel>();
            var _local_7:P_SSModel = new P_SSModel();
            var _local_9:int = _arg_1.readUnsignedShort();
            var _local_10:int;
            while (_local_10 < _local_9) {
                _arg_1.readUnsignedInt();
                _arg_1.readUnsignedShort();
                _local_10++;
            };
            var _local_11:int = _arg_1.readUnsignedShort();
            var _local_12:int;
            while (_local_12 < _local_11) {
                _local_7.read(_arg_1);
                _local_8 = _local_7.data;
                _local_8.isBorn = true;
                _local_6.push(_local_8);
                _local_7.data = null;
                _local_12++;
            };
            this.data.bornSSmodels = _local_6;
            this.data.catchable = (_arg_1.readUnsignedByte() == 1);
            var _local_13:MonsterStaticInfo = _local_2.getMonsterStaticInfo(_local_3);
            this.data.staticInfo = _local_13;
            this.data.monsterID = _local_3;
            this.data.type = _local_13.type;
            this.data.name = _local_13.name;
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_897()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_897 = " P_MonsterAppear" (String#16931)


