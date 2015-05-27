// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_DetailPlayerInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.DetailPlayerInfo;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.data.EthnicInfo;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ZoneBuff;
    import com.tencent.ai.core.data.PayData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_881;
    import __AS3__.vec.*;

    public class P_DetailPlayerInfo implements ISerialize 
    {

        public var version:uint;
        public var data:DetailPlayerInfo;

        public function P_DetailPlayerInfo(_arg_1:DetailPlayerInfo=null)
        {
            this.data = _arg_1;
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:uint;
            var _local_3:int;
            var _local_18:P_SkillInfo;
            var _local_19:SkillGroup;
            var _local_20:SkillModel;
            var _local_21:P_ZoneBuff;
            var _local_4:IDataManager = DEFINE.DM;
            if (this.data == null){
                this.data = new DetailPlayerInfo();
            };
            this.version = _arg_1.readUnsignedShort();
            var _local_5:PlayerID = new PlayerID();
            _local_5.read(_arg_1);
            this.data.playerID = _local_5;
            this.data.id = _local_5.uin;
            this.data.name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            var _local_6:int = _arg_1.readUnsignedInt();
            _local_3 = _local_4.getEthnicID(_local_6);
            this.data.ethnicID = _local_3;
            this.data.career = _local_4.getCareerInfo(_local_6);
            var _local_7:EthnicInfo = _local_4.getEthnicInfo(_local_3);
            this.data.ethnicInfo = _local_7;
            this.data.pve_exp = _arg_1.readUnsignedInt();
            this.data.pk_exp = _arg_1.readUnsignedInt();
            this.data.fatigue_val = _arg_1.readUnsignedShort();
            this.data.golden_coin = _arg_1.readUnsignedInt();
            this.data.revive_coin = _arg_1.readUnsignedInt();
            this.data.merit_val = _arg_1.readUnsignedInt();
            this.data.pk_win_point = _arg_1.readUnsignedInt();
            this.data.mood = _arg_1.readUnsignedByte();
            var _local_8:int = _arg_1.readByte();
            var _local_9:PlayerEquipsID = new PlayerEquipsID(this.data.playerID, _local_3, _local_6, _local_8);
            var _local_10:P_PlayerEquipsID = new P_PlayerEquipsID(_local_9, _local_7, Constants.NUM_AVATARS);
            _local_10.dm = _local_4;
            _local_10.read(_arg_1);
            this.data.equipsID = _local_9;
            var _local_11:Vector.<SkillGroup> = _local_7.defaultSkills;
            var _local_12:Vector.<SkillModel> = new Vector.<SkillModel>();
            var _local_13:int;
            while (_local_13 < _local_11.length) {
                _local_12.push(new SkillModel(_local_11[_local_13]));
                _local_13++;
            };
            var _local_14:int = _arg_1.readUnsignedShort();
            if (_local_14 > 0){
                _local_18 = new P_SkillInfo();
                _local_13 = 0;
                while (_local_13 < _local_14) {
                    _local_18.read(_arg_1);
                    _local_19 = _local_4.getSkillGroup(_local_18.skillID);
                    if (_local_19 != null){
                        _local_20 = new SkillModel(_local_19);
                        _local_20.flag = _local_18.flag;
                        _local_20.baseSkillID = _local_18.baseSkillID;
                        _local_12.push(_local_20);
                    };
                    _local_13++;
                };
            };
            this.data.skills = _local_12;
            var _local_15:int = _arg_1.readUnsignedShort();
            var _local_16:Vector.<ZoneBuff> = new Vector.<ZoneBuff>();
            if (_local_15 > 0){
                _local_21 = new P_ZoneBuff();
                _local_13 = 0;
                while (_local_13 < _local_15) {
                    _local_21.read(_arg_1);
                    _local_16.push(_local_21.data);
                    _local_21.data = null;
                    _local_13++;
                };
            };
            this.data.zoneBuffs = _local_16;
            this.data.military_rank = _arg_1.readUnsignedShort();
            this.data.sublime = _arg_1.readBoolean();
            this.data.pkWinRound = _arg_1.readUnsignedInt();
            this.data.pkTotalRound = _arg_1.readUnsignedInt();
            this.data.match_pk_win_round = _arg_1.readUnsignedInt();
            this.data.match_pk_total_round = _arg_1.readUnsignedInt();
            this.data.pkRefuse = _arg_1.readBoolean();
            this.data.payData = new PayData();
            this.data.payData.read(_arg_1);
            this.data.hasJoin = (_arg_1.readBoolean() == false);
            this.data.level = _arg_1.readUnsignedShort();
            this.data.pk_lvl = _arg_1.readUnsignedShort();
            this.data.pk_lvl_exp_begin = _arg_1.readUnsignedInt();
            this.data.pk_lvl_exp_end = _arg_1.readUnsignedInt();
            this.data.golden_coin_limit = _arg_1.readUnsignedInt();
            this.data.equipsID.careerType = this.data.getCareerType();
            var _local_17:P_CombatAttrib = P_CombatAttrib.P;
            _local_17.data = this.data;
            _local_17.read(_arg_1);
            _local_17.data = null;
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_881()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_881 = " P_DetailPlayerInfo" (String#15029)


