// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PlayerEquipsID

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.data.EthnicInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipItemInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_908;

    public class P_PlayerEquipsID implements ISerialize 
    {

        public var dm:IDataManager;
        public var equipsID:PlayerEquipsID;
        protected var m_maxNum:int;
        protected var m_detail:Boolean;
        protected var m_ethnicInfo:EthnicInfo;

        public function P_PlayerEquipsID(_arg_1:PlayerEquipsID, _arg_2:EthnicInfo, _arg_3:int=0, _arg_4:Boolean=true)
        {
            this.equipsID = _arg_1;
            this.m_ethnicInfo = _arg_2;
            this.m_maxNum = _arg_3;
            this.m_detail = _arg_4;
        }

        public function get ethnicInfo():EthnicInfo
        {
            return (this.m_ethnicInfo);
        }

        public function get maxNum():int
        {
            return (this.m_maxNum);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:Vector.<EquipItemInfo>;
            if (this.m_detail){
                P_AvatarDetailInfos.P.equipMax = this.m_maxNum;
                P_AvatarDetailInfos.P.read(_arg_1);
                _local_2 = P_AvatarDetailInfos.P.iEquipItems;
            } else {
                P_AvatarSimpleInfo.P.equipMax = this.m_maxNum;
                P_AvatarSimpleInfo.P.read(_arg_1);
                _local_2 = P_AvatarSimpleInfo.P.iEquipItems;
            };
            this.equipsID.setDefaultWeapon(this.dm.getEquipStaticInfo(this.m_ethnicInfo.defaultWeaponID));
            this.equipsID.setEquips(_local_2);
        }

        public function write(_arg_1:IDataOutput):void
        {
            if (this.m_detail){
                P_AvatarDetailInfos.P.iEquipItems = this.equipsID.getEquips();
                P_AvatarDetailInfos.P.write(_arg_1);
            } else {
                P_AvatarSimpleInfo.P.iEquipItems = this.equipsID.getEquips();
                P_AvatarSimpleInfo.P.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_908()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_908 = " P_PlayerEquipsID" (String#16010)


