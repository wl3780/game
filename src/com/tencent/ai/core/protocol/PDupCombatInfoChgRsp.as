// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupCombatInfoChgRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.data.AttributeInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_987;

    public class PDupCombatInfoChgRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = ProtocolIDDef.DUP_CMD_COMBATINFO_CHG_RSP;//589874

        public var iPlayerID:PlayerID;
        public var iTakeEffectFrame:uint;
        public var iTakeEffectSeq:uint;
        public var iUpgradeLv:uint;
        public var iAttr:AttributeInfo;
        private var _iZoneUpgradeRsp:PZoneMainUpgradeRsp;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.iPlayerID = new PlayerID();
            this.iPlayerID.read(_arg_1);
            this.iTakeEffectFrame = _arg_1.readUnsignedInt();
            this.iTakeEffectSeq = _arg_1.readUnsignedInt();
            this._iZoneUpgradeRsp = new PZoneMainUpgradeRsp();
            this._iZoneUpgradeRsp.read(_arg_1);
            this.iUpgradeLv = this._iZoneUpgradeRsp.upgrade_lv;
            this.iAttr = this._iZoneUpgradeRsp.attr;
        }

        override public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_987()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_987 = " PDupCombatInfoChgRsp" (String#16397)


