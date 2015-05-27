// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PetShowInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetShowInfo;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.PetAIInfo;
    import com.tencent.ai.core.enum.MonsterEnum;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_903;

    public class P_PetShowInfo implements ISerialize 
    {

        public static var P:P_PetShowInfo = new (P_PetShowInfo)();

        public var data:PetShowInfo;


        public static function BuildPetInfo(_arg_1:PetShowInfo, _arg_2:MapPosition, _arg_3:PetInfo=null):PetInfo
        {
            if (_arg_3 == null){
                _arg_3 = new PetInfo();
            };
            _arg_3.petID = _arg_1.petID;
            _arg_3.petSID = _arg_1.petSID;
            _arg_3.nickname = _arg_1.nickname;
            _arg_3.level = _arg_1.level;
            _arg_3.aptitude = _arg_1.aptitude;
            _arg_3.staticInfo = DEFINE.DM.getMonsterStaticInfo(_arg_3.petID);
            _arg_3.petStaticInfo = DEFINE.DM.getPetStaticInfo(_arg_3.petID);
            if (_arg_3.nickname == ""){
                _arg_3.nickname = _arg_3.staticInfo.name;
            };
            _arg_3.walkV = 500;
            var _local_4:PetAIInfo = new PetAIInfo();
            _arg_3.aiInfo = _local_4;
            _local_4.aiType = MonsterEnum.AI_CITY_PET;
            var _local_5:PetAIInfo = DEFINE.DM.getPetAIInfo(_arg_3.petStaticInfo.petAIID);
            if (!_local_5){
                throw (new Error(((("找不到宠物的 AI 数据，请检查配置表。petID=" + _arg_3.petID) + ",petAIID=") + _arg_3.petStaticInfo.petAIID)));
            };
            _local_4.fillPetAIInfo(_local_5, _arg_3);
            _arg_3.type = _arg_3.staticInfo.type;
            _arg_3.name = _arg_3.staticInfo.name;
            _arg_3.mapPosition = new MapPosition(_arg_2.x, (_arg_2.z - 10));
            _arg_3.petMasterPos = _arg_2;
            return (_arg_3);
        }


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new PetShowInfo();
            };
            this.data.petID = _arg_1.readUnsignedInt();
            this.data.petSID = _arg_1.readUnsignedInt();
            this.data.nickname = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
            this.data.level = _arg_1.readUnsignedShort();
            this.data.aptitude = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_903()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_903 = " P_PetShowInfo" (String#16589)


