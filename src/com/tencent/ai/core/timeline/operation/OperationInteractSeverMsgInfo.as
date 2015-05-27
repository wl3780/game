// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.operation.OperationInteractSeverMsgInfo

package com.tencent.ai.core.timeline.operation
{
    import com.tencent.ai.core.combat.IDmgMetersManager;
    import com.tencent.ai.core.protocol.PDupItemInteractProtocol;
    import com.tencent.ai.core.data.SyncServerMsgInfo;
    import com.tencent.ai.core.data.PlayerID;
    import com.tencent.ai.core.player.IPlayerManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.actor.BaseActor;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import com.tencent.ai.core.pet.IPetManager;
    import com.tencent.ai.core.pet.BasePet;
    import com.tencent.ai.core.func.ISpecialFuncManager;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.InteractItemEffectType;
    import  ©init._SafeStr_1306;

    public class OperationInteractSeverMsgInfo extends BaseOperation 
    {

        private static var _DMGMETERS:IDmgMetersManager;

        protected var m_dupItemP:PDupItemInteractProtocol;
        protected var serverMsgInfo:SyncServerMsgInfo;
        protected var playerID:PlayerID;
        protected var playerm:IPlayerManager;

        public function OperationInteractSeverMsgInfo(_arg_1:PDupItemInteractProtocol, _arg_2:IPlayerManager)
        {
            super(_arg_1.sync_no, _arg_1.take_effect_frame);
            this.serverMsgInfo = _arg_1.serverMsgInfo;
            this.playerID = _arg_1.playerID;
            this.playerm = _arg_2;
            this.m_dupItemP = _arg_1;
            if (_DMGMETERS == null){
                _DMGMETERS = AICore.combatSystem.getDmgMeters();
            };
        }

        protected function createEffect(_arg_1:BaseActor, _arg_2:int=1):void
        {
            if (this.m_dupItemP.result != 0){
                return;
            };
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
            var _local_3:Vector.<ServerMsgInfo>;
            var _local_4:ServerMsgInfo;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IPetManager;
            var _local_8:BasePet;
            var _local_9:ISpecialFuncManager;
            if (this.m_dupItemP.result != 0){
                return;
            };
            var _local_1:BasePlayer = this.playerm.getPlayerByID(this.playerID.uin);
            var _local_2:Vector.<BasePlayer> = this.playerm.getPlayers();
            if (_local_1 != null){
                _local_3 = this.serverMsgInfo.serverInfos;
                _local_6 = _local_3.length;
                _local_5 = 0;
                while (_local_5 < _local_6) {
                    _local_4 = _local_3[_local_5];
                    switch (_local_4.type){
                        case InteractItemEffectType.OBJECT_EFFECT_CHANGE_HP:
                            switch (_local_4.data_1){
                                case 0:
                                    _DMGMETERS.inputActorHPUpdate(_local_1, _local_4.data_2);
                                    this.createEffect(_local_1);
                                    break;
                                case 1:
                                    _DMGMETERS.inputActorHPUpdate(_local_1, (DEFINE.CAST_FLOAT(_local_4.data_2) * _local_1.getModel().maxhp));
                                    this.createEffect(_local_1);
                                    break;
                            };
                            break;
                        case InteractItemEffectType.OBJECT_EFFECT_CHANGE_MP:
                            switch (_local_4.data_1){
                                case 0:
                                    _DMGMETERS.inputActorMPUpdate(_local_1, _local_4.data_2);
                                    this.createEffect(_local_1, 2);
                                    break;
                                case 1:
                                    _DMGMETERS.inputActorMPUpdate(_local_1, (DEFINE.CAST_FLOAT(_local_4.data_2) * _local_1.getModel().maxmp));
                                    this.createEffect(_local_1, 2);
                                    break;
                            };
                            break;
                        case InteractItemEffectType.OBJECT_EFFECT_CHANGE_HP_ALL:
                            _local_7 = AICore.Runtime.currentContext.getPetManager();
                            switch (_local_4.data_1){
                                case 0:
                                    for each (_local_1 in _local_2) {
                                        _DMGMETERS.inputActorHPUpdate(_local_1, _local_4.data_2);
                                        if (_local_1.hasPetFollow){
                                            _local_7.updatePetHP(_local_1.getPlayerInfo().playerID, _local_4.data_2);
                                            _local_8 = _local_7.getPetByPlayer(_local_1.getPlayerInfo().playerID);
                                            if (_local_8){
                                                this.createEffect(_local_8);
                                            };
                                        };
                                        this.createEffect(_local_1);
                                    };
                                    break;
                                case 1:
                                    for each (_local_1 in _local_2) {
                                        if (_local_1.hasPetFollow){
                                            _local_7.updatePetHP2(_local_1.getPlayerInfo().playerID, DEFINE.CAST_FLOAT(_local_4.data_2));
                                            _local_8 = _local_7.getPetByPlayer(_local_1.getPlayerInfo().playerID);
                                            if (_local_8){
                                                this.createEffect(_local_8);
                                            };
                                        };
                                        _DMGMETERS.inputActorHPUpdate(_local_1, (DEFINE.CAST_FLOAT(_local_4.data_2) * _local_1.getModel().maxhp));
                                        this.createEffect(_local_1);
                                    };
                                    break;
                            };
                            break;
                        case InteractItemEffectType.OBJECT_EFFECT_CHANGE_MP_ALL:
                            switch (_local_4.data_1){
                                case 0:
                                    for each (_local_1 in _local_2) {
                                        _DMGMETERS.inputActorMPUpdate(_local_1, _local_4.data_2);
                                        this.createEffect(_local_1, 2);
                                    };
                                    break;
                                case 1:
                                    for each (_local_1 in _local_2) {
                                        _DMGMETERS.inputActorMPUpdate(_local_1, (DEFINE.CAST_FLOAT(_local_4.data_2) * _local_1.getModel().maxmp));
                                        this.createEffect(_local_1, 2);
                                    };
                                    break;
                            };
                            break;
                        case InteractItemEffectType.OBJECT_ADD_FUNC:
                            _local_9 = AICore.combatSystem.getSpecialFuncManager();
                            _local_9.applyFunc(_local_1, _local_4.data_1);
                            break;
                    };
                    _local_5++;
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1306()
        {
        }


    }
}//package com.tencent.ai.core.timeline.operation

// _SafeStr_1306 = " OperationInteractSeverMsgInfo" (String#16922)


