// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PlayerAppear

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.EthnicInfo;
    import com.tencent.ai.core.data.CareerInfo;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.data.TeamTagInfo;
    import com.tencent.ai.core.data.VipSimpleInfo;
    import com.tencent.ai.core.data.PetShowInfo;
    import com.tencent.ai.core.data.PayData;
    import com.tencent.ai.core.data.FamilyInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.data.PlayerInfo;
    import  ©init._SafeStr_906;

    public class P_PlayerAppear implements ISerialize 
    {

        public var playerID:PlayerID;
        public var vKey:int;
        public var mapPosition:MapPosition;
        public var diretion:int;
        public var ethnicID:int;
        public var ethnicInfo:EthnicInfo;
        public var career:CareerInfo;
        public var sublime:Boolean;
        public var level:int;
        public var name:String;
        public var equipsID:PlayerEquipsID;
        public var walkV:int;
        public var runV:int;
        public var mood:int;
        public var playerFlag:uint;
        public var teamTagInfo:TeamTagInfo;
        public var vipInfo:VipSimpleInfo;
        public var petShowInfo:PetShowInfo;
        public var payData:PayData;
        public var hasJoin:Boolean;
        public var familyInfo:FamilyInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:IDataManager = DEFINE.DM;
            if (this.playerID == null){
                this.playerID = new PlayerID();
            };
            this.playerID.read(_arg_1);
            this.vKey = _arg_1.readUnsignedInt();
            this.mapPosition = new MapPosition();
            this.mapPosition.decodeBytes(_arg_1);
            this.diretion = _arg_1.readShort();
            var _local_3:int = _arg_1.readUnsignedInt();
            this.career = _local_2.getCareerInfo(_local_3);
            this.sublime = _arg_1.readBoolean();
            this.level = _arg_1.readUnsignedShort();
            this.name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.ethnicID = _local_2.getEthnicID(_local_3);
            this.ethnicInfo = _local_2.getEthnicInfo(this.ethnicID);
            var _local_4:int = _arg_1.readByte();
            this.equipsID = new PlayerEquipsID(this.playerID, this.ethnicID, _local_3, _local_4);
            var _local_5:P_PlayerEquipsID = new P_PlayerEquipsID(this.equipsID, this.ethnicInfo, 0, false);
            _local_5.dm = _local_2;
            _local_5.read(_arg_1);
            this.walkV = _arg_1.readUnsignedShort();
            this.runV = _arg_1.readUnsignedShort();
            this.mood = _arg_1.readByte();
            this.playerFlag = _arg_1.readUnsignedInt();
            this.teamTagInfo = new TeamTagInfo();
            this.teamTagInfo.read(_arg_1);
            this.vipInfo = new VipSimpleInfo();
            this.vipInfo.read(_arg_1);
            var _local_6:PetShowInfo = new PetShowInfo();
            ReadIn(_arg_1, _local_6, P_PetShowInfo);
            if (_local_6.petID != 0){
                this.petShowInfo = _local_6;
            };
            this.walkV = DEFINE.CITY_V_ADD(this.walkV);
            this.runV = DEFINE.CITY_V_ADD(this.runV);
            this.payData = new PayData();
            this.payData.read(_arg_1);
            this.hasJoin = (_arg_1.readBoolean() == false);
            this.familyInfo = new FamilyInfo();
            this.familyInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function fillValue(_arg_1:PlayerInfo):void
        {
            var _local_2:PetInfo;
            if (_arg_1 == null){
                return;
            };
            _arg_1.isFull = false;
            _arg_1.playerID = this.playerID;
            _arg_1.id = this.playerID.uin;
            _arg_1.level = this.level;
            _arg_1.ethnicID = this.ethnicID;
            _arg_1.ethnicInfo = this.ethnicInfo;
            _arg_1.career = this.career;
            _arg_1.sublime = this.sublime;
            _arg_1.name = this.name;
            _arg_1.mapPosition = this.mapPosition;
            _arg_1.diretion = this.diretion;
            _arg_1.vKey = this.vKey;
            _arg_1.equipsID = this.equipsID;
            _arg_1.walkV = this.walkV;
            _arg_1.runV = this.runV;
            _arg_1.mood = this.mood;
            _arg_1.playerFlag = this.playerFlag;
            _arg_1.teamTag = this.teamTagInfo;
            _arg_1.vipInfo = this.vipInfo;
            if (this.petShowInfo != null){
                _local_2 = P_PetShowInfo.BuildPetInfo(this.petShowInfo, this.mapPosition);
                _local_2.playerID = _arg_1.playerID;
                _arg_1.followPetInfo = _local_2;
            };
            _arg_1.payData = this.payData;
            _arg_1.hasJoin = this.hasJoin;
            _arg_1.equipsID.careerType = _arg_1.getCareerType();
            _arg_1.familyInfo = this.familyInfo;
        }

        public /*  ©init. */ function _SafeStr_906()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_906 = " P_PlayerAppear" (String#17252)


