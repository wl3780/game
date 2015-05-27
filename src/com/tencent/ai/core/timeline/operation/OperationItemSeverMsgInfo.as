// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationItemSeverMsgInfo

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.protocol.PDupPropItemUseRsp;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.player.BasePlayer;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import com.tencent.ai.core.func.ISpecialFuncManager;
    import com.tencent.ai.core.pet.IPetManager;
    import com.tencent.ai.core.pet.BasePet;
    import com.tencent.ai.core.data.PetInfo;
    import com.tencent.ai.core.enum.ItemEffectType;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.status.impl.RemoveSS;
    import com.tencent.free.logging.error;
    import  ©init._SafeStr_1307;

    public class OperationItemSeverMsgInfo extends BaseOperation 
    {

        private static var _DMGMETERS:IDmgMetersManager;

        protected var m_playerm:IPlayerManager;
        protected var m_itemUsRsp:PDupPropItemUseRsp;

        public function OperationItemSeverMsgInfo(_arg_1:PDupPropItemUseRsp, _arg_2:IPlayerManager)
        {
            super(_arg_1.sync_no, _arg_1.iTakeEffectFrame);
            this.m_itemUsRsp = _arg_1;
            this.m_playerm = _arg_2;
            if (_DMGMETERS == null){
                _DMGMETERS = AICore.combatSystem.getDmgMeters();
            };
        }

        protected function createEffect(_arg_1:BaseActor, _arg_2:int=1):void
        {
            var _local_3:EffectInfo = new EffectInfo();
            var _local_4:IActorView = _arg_1.getActorView();
            _local_3.eid = 6004;
            _local_3.location = new MapPosition(0, 0, 60);
            if ((_arg_2 & 1) != 0){
                _local_4.createElement(ElementType.ET_EFFECT, _local_3);
            };
            if ((_arg_2 & 2) != 0){
                _local_3.adjustColorInfo = new AdjustColorInfo();
                _local_3.adjustColorInfo.hue = 150;
                _local_3.location.y = 30;
                _local_4.createElement(ElementType.ET_EFFECT, _local_3);
            };
            var _local_5:int = SoundDef.HPMP_SOUND_ID;
            if (_local_5 != 0){
                AICore.sound.play(_local_5, -1, 0, 100, 0, _arg_1);
            };
        }

        override public function execute():void
        {
            var _local_1:BasePlayer;
            var _local_2:Vector.<ServerMsgInfo>;
            var _local_3:ServerMsgInfo;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Number;
            var _local_7:ISpecialFuncManager;
            var _local_8:IPetManager;
            var _local_9:BasePet;
            var _local_10:PetInfo;
            _local_1 = this.m_playerm.getPlayerByID(this.m_itemUsRsp.iPlayerID.uin);
            if (_local_1 != null){
                _local_2 = this.m_itemUsRsp.itemUseRsp.serverInfos;
                _local_5 = _local_2.length;
                _local_4 = 0;
                while (_local_4 < _local_5) {
                    _local_3 = _local_2[_local_4];
                    switch (_local_3.type){
                        case ItemEffectType.RECOVER_HP:
                            _DMGMETERS.inputActorHPUpdate(_local_1, _local_3.data_1);
                            this.createEffect(_local_1);
                            break;
                        case ItemEffectType.RECOVER_RATE_HP:
                            _DMGMETERS.inputActorHPUpdate(_local_1, (DEFINE.CAST_FLOAT(_local_3.data_1) * _local_1.getModel().maxhp));
                            this.createEffect(_local_1);
                            break;
                        case ItemEffectType.RECOVER_ALL_HP:
                            _DMGMETERS.inputActorHPUpdate(_local_1, _local_1.getModel().maxhp);
                            this.createEffect(_local_1);
                            break;
                        case ItemEffectType.RECOVER_MP:
                            _DMGMETERS.inputActorMPUpdate(_local_1, _local_3.data_1);
                            this.createEffect(_local_1, 2);
                            break;
                        case ItemEffectType.RECOVER_RATE_MP:
                            _DMGMETERS.inputActorMPUpdate(_local_1, (DEFINE.CAST_FLOAT(_local_3.data_1) * _local_1.getModel().maxmp));
                            this.createEffect(_local_1, 2);
                            break;
                        case ItemEffectType.RECOVER_ALL_MP:
                            _DMGMETERS.inputActorMPUpdate(_local_1, _local_1.getModel().maxmp);
                            this.createEffect(_local_1, 2);
                            break;
                        case ItemEffectType.RECOVER_HP_MP:
                            _DMGMETERS.inputActorHPUpdate(_local_1, _local_3.data_1);
                            _DMGMETERS.inputActorMPUpdate(_local_1, _local_3.data_2);
                            this.createEffect(_local_1, 3);
                            break;
                        case ItemEffectType.RECOVER_RATE_HP_MP:
                            _local_6 = DEFINE.CAST_FLOAT(_local_3.data_1);
                            _DMGMETERS.inputActorHPUpdate(_local_1, (_local_6 * _local_1.getModel().maxhp));
                            _DMGMETERS.inputActorMPUpdate(_local_1, (_local_6 * _local_1.getModel().maxmp));
                            this.createEffect(_local_1, 3);
                            break;
                        case ItemEffectType.RECOVER_ALL_HP_MP:
                            _DMGMETERS.inputActorHPUpdate(_local_1, _local_1.getModel().maxhp);
                            _DMGMETERS.inputActorMPUpdate(_local_1, _local_1.getModel().maxmp);
                            this.createEffect(_local_1, 3);
                            break;
                        case ItemEffectType.EM_ADD_DUP_SF:
                            _local_7 = AICore.combatSystem.getSpecialFuncManager();
                            _local_7.applyFunc(_local_1, _local_3.data_1);
                            break;
                        case ItemEffectType.EM_REMOVE_DUP_SS:
                            RemoveSS.INSTANCE.removeSSType = _local_3.data_1;
                            _local_1.addStatus(RemoveSS.INSTANCE);
                            break;
                        case ItemEffectType.EM_ITEM_EFFECT_PET_HP:
                            _local_8 = AICore.Runtime.currentContext.getPetManager();
                            _local_8.updatePetHP(_local_1.getPlayerInfo().playerID, _local_3.data_1);
                            _local_9 = _local_8.getPetByPlayer(_local_1.getPlayerInfo().playerID);
                            if (_local_9){
                                this.createEffect(_local_9);
                            } else {
                                if (_local_1.isMain()){
                                    _local_10 = AICore.Runtime.currentContext.getPetManager().getCachePetInfoByPlayer(this.m_itemUsRsp.iPlayerID);
                                    AICore.data.mainModel.petDataManager.followPet(_local_10.petSID);
                                };
                            };
                            break;
                        default:
                            error("[OperationUseItem]>>> 没有此效果 ####### useItem type:", _local_3.type);
                    };
                    _local_4++;
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1307()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1307 = " OperationItemSeverMsgInfo" (String#17213)


