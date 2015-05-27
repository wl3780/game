// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.interact.BaseInteractItem

package com.tencent.ai.core.interact
{
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.scene.property.IPropertyTarget;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.property.AbstractProperty;
    import com.tencent.ai.core.combat.impl.DMGCalculator;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.interact.res.InteractItemAsset;
    import flash.geom.Rectangle;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.triggerEvent.ITriggerEvent;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.procedure.IProcedure;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.SceneWalkData;
    import com.tencent.ai.core.data.SceneConfigInfo;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.interact.impl.InteractItemModel;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.render.ElementViewHead;
    import com.tencent.ai.core.scene.property.PropertyFactory;
    import com.tencent.ai.core.procedure.ProcedureManager;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.events.TriggerEvent;
    import com.tencent.ai.core.triggerEvent.TriggerEventBuilder;
    import com.tencent.ai.core.interact.view.BaseInteratItemView;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.protocol.PDupItemInteractProtocol;
    import com.tencent.ai.core.protocol.PCityInteractItemReq;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AIContextType;
    import com.tencent.ai.core.net.DupSend;
    import com.tencent.ai.core.net.CitySend;
    import flash.display.Sprite;
    import com.tencent.ai.core.enum.TriggerEventType;
    import com.tencent.ai.core.action.IElementAction;
    import com.tencent.free.logging.warning;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.VKeyInfo;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import  ©init._SafeStr_581;
    import __AS3__.vec.*;

    public class BaseInteractItem extends HasActionElement implements IPropertyTarget 
    {

        protected var m_propertyList:Vector.<AbstractProperty>;
        protected var m_dmgCalculator:DMGCalculator;
        protected var m_resmanger:IInteractItemAssetManager;
        protected var m_info:InteractItemInfo;
        protected var m_itemType:int;
        protected var m_asset:InteractItemAsset;
        protected var m_vx:int;
        protected var m_vy:int;
        protected var m_vz:int;
        protected var m_avx:int;
        protected var m_avy:int;
        protected var m_avz:int;
        protected var m_rMapX:int;
        protected var m_rMapY:int;
        protected var m_rMapZ:int;
        protected var m_blockRect:Rectangle;
        protected var m_sceneBlockRect:Rectangle;
        protected var m_states:Dictionary;
        protected var m_currentState:int;
        protected var m_model:ActorModel;
        protected var m_hp:int;
        public var trigger:ITriggerEvent;
        public var nextState:int;
        public var reportToServer:Boolean;
        protected var m_effectFrame:int;
        protected var m_bInitialize:Boolean;
        protected var m_bFollow:Boolean;
        protected var m_owner:BaseElement;
        protected var m_verifyWalkable:Boolean = false;
        protected var m_procedure:IProcedure;
        protected var m_excludeItem:Array;

        public function BaseInteractItem()
        {
            super(ElementType.ET_INTERACT);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_dmgCalculator = DMGCalculator.getInstance();
            this.m_currentState = -1;
        }

        override protected function executeFrame(_arg_1:int):void
        {
            if (this.m_bInitialize){
                this.onEnterFrame(_arg_1);
            } else {
                var _local_2 = this;
                var _local_3 = (_local_2.m_effectFrame - 1);
                _local_2.m_effectFrame = _local_3;
                if (this.m_effectFrame == 0){
                    this.m_bInitialize = true;
                    this.changeState(this.m_info.state);
                };
            };
        }

        protected function onEnterFrame(_arg_1:int):void
        {
            super.executeFrame(_arg_1);
            if (((this.m_bFollow) && (this.m_owner))){
                if (((((!((this.m_vx == 0))) || (!((this.m_vy == 0))))) || (!((this.m_vz == 0))))){
                    this.m_rMapX = (this.m_rMapX + this.m_vx);
                    this.m_rMapY = (this.m_rMapY + this.m_vy);
                    this.m_rMapZ = (this.m_rMapZ + this.m_vz);
                };
                setMapXZY((this.m_owner.mapX + (this.m_rMapX * m_direction)), (this.m_owner.mapZ + this.m_rMapZ), (this.m_owner.mapY + this.m_rMapY));
            } else {
                if (((((!((this.m_vx == 0))) || (!((this.m_vy == 0))))) || (!((this.m_vz == 0))))){
                    if (this.m_verifyWalkable){
                        if (((m_scene) && (m_scene.isWalkable((mapX + this.m_vx), (mapZ + this.m_vz))))){
                            setMapXZY((mapX + this.m_vx), (mapZ + this.m_vz), (mapY + this.m_vy));
                        } else {
                            setMapXZY(mapX, mapZ, (mapY + this.m_vy));
                        };
                    } else {
                        setMapXZY((mapX + this.m_vx), (mapZ + this.m_vz), (mapY + this.m_vy));
                    };
                };
            };
            this.m_vx = (this.m_vx + this.m_avx);
            this.m_vy = (this.m_vy + this.m_avy);
            this.m_vz = (this.m_vz + this.m_avz);
        }

        override public function setParentContainer(_arg_1:IElementContainer):void
        {
            var _local_2:SceneWalkData;
            if (((this.m_parent) && (this.m_sceneBlockRect))){
                _local_2 = (m_scene.getConfig()["scene"] as SceneConfigInfo).walkData;
                if (_local_2){
                    _local_2.removeUnwalkable(this.m_sceneBlockRect);
                };
            };
            super.setParentContainer(_arg_1);
            m_scene = (_arg_1 as IScene);
            if (((m_scene) && (this.m_sceneBlockRect))){
                _local_2 = (m_scene.getConfig()["scene"] as SceneConfigInfo).walkData;
                if (_local_2){
                    _local_2.addUnwalkable(this.m_sceneBlockRect);
                };
            };
            this.activate(!((_arg_1 == null)));
            this.excludeItem();
        }

        public function excludeItem():void
        {
            var _local_1:Array;
            var _local_2:BaseElement;
            var _local_3:BaseInteractItem;
            if (((((this.m_scene) && (this.m_excludeItem))) && (!((this.m_owner == null))))){
                _local_1 = m_scene.getElements(SceneLayerDef.LAYER_GROUND);
                for each (_local_2 in _local_1) {
                    if ((_local_2 is BaseInteractItem)){
                        _local_3 = (_local_2 as BaseInteractItem);
                        if (((((!((_local_3 == this))) && ((_local_3.owner == this.owner)))) && (!((this.m_excludeItem.indexOf(_local_3.getInteractItemInfo().interactItemID.toString()) == -1))))){
                            _local_3.destroyItem();
                        };
                    };
                };
            };
        }

        public function setResManager(_arg_1:IInteractItemAssetManager):void
        {
            this.m_resmanger = _arg_1;
            if (m_view){
                (this.m_view as IInteractItemView).setResManager(_arg_1);
            };
        }

        public function initialize(_arg_1:InteractItemInfo):void
        {
            var _local_3:PropertyArg;
            var _local_4:AbstractProperty;
            this.renderLevel = _arg_1.renderLevel;
            this.m_bInitialize = false;
            this.m_info = _arg_1;
            this.id = this.m_info.id;
            this.m_model = new InteractItemModel();
            this.m_model.stiff = this.m_info.staticInfo.stiff;
            this.m_model.level = 1;
            this.m_itemType = this.m_info.interactItemType;
            groupID = this.m_info.groupID;
            if (this.m_info.hp == -1){
                this.m_hp = this.m_info.staticInfo.hp;
            } else {
                this.m_hp = this.m_info.hp;
            };
            if (this.m_hp == 0){
                this.m_hp = -1;
            };
            this.m_bFollow = this.m_info.bfollowTarget;
            this.m_owner = this.m_info.owner;
            var _local_2:MapPosition = this.m_info.location.clone();
            _local_2.deepOffset = (_local_2.deepOffset + this.m_info.staticInfo.deepOffset);
            if (((this.m_bFollow) && (this.m_owner))){
                this.m_rMapX = _local_2.x;
                this.m_rMapY = _local_2.y;
                this.m_rMapZ = _local_2.z;
                _local_2.x = (_local_2.x * this.m_info.direction);
                _local_2.x = (_local_2.x + this.m_owner.mapX);
                _local_2.y = (_local_2.y + this.m_owner.mapY);
                _local_2.z = (_local_2.z + this.m_owner.mapZ);
            };
            setMapPosition(_local_2);
            this.setDirection(this.m_info.direction);
            this.initializeAction();
            if (m_view != null){
                (this.m_view as IInteractItemView).loadAsset(this.m_info.staticInfo);
            };
            if ((this.m_view is ElementViewHead)){
                (this.m_view as ElementViewHead).setHeadText(this.m_info.staticInfo.text);
            };
            setBlendMode(this.m_info.staticInfo.blendMode);
            this.m_currentState = -1;
            this.m_states = this.m_info.staticInfo.states;
            this.reportToServer = false;
            this.tingeInfo = this.m_info.tingeInfo;
            this.adjustColorInfo = this.m_info.adjustColorInfo;
            for each (_local_3 in this.m_info.propertyArgList) {
                _local_4 = PropertyFactory.create(_local_3);
                this.addProperty(_local_4);
            };
            this.m_effectFrame = this.m_info.delayFrames;
            if (this.m_effectFrame == 0){
                this.m_bInitialize = true;
                this.changeState(this.m_info.state);
            };
            if (_arg_1.procedureInfo){
                this.m_procedure = ProcedureManager.getInstance().createProcedure(_arg_1.procedureInfo, this);
                this.m_procedure.initialize(_arg_1.procedureInfo, this);
            };
            this.m_excludeItem = this.m_info.staticInfo.excludeItems;
            if (((this.m_info.disappearOnOwnerDead) && (this.m_owner))){
                this.m_owner.addEventListener(ElementEvent.ON_ELEMENT_DEAD, this.onOwnerDead);
            };
            if (((this.m_info.disappearOnOwnerActionEnd) && ((this.m_owner is BaseActor)))){
                (this.m_owner as BaseActor).getModel().addEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onOwnerActionEnd);
            };
        }

        public function onOwnerDead(_arg_1:ElementEvent):void
        {
            this.changeState(0);
        }

        public function onOwnerActionEnd(_arg_1:ActorModelEvent):void
        {
            this.changeState(0);
        }

        public function activate(_arg_1:Boolean):void
        {
            if (_arg_1){
                if (this.trigger){
                    this.trigger.activate();
                };
                if (this.m_procedure){
                    this.m_procedure.activate();
                };
            } else {
                if (this.trigger){
                    this.trigger.inactivate();
                };
                if (this.m_procedure){
                    this.m_procedure.deactivate();
                };
            };
        }

        public function getInteractItemInfo():InteractItemInfo
        {
            return (this.m_info);
        }

        public function getItemType():int
        {
            return (this.m_itemType);
        }

        override public function reset():void
        {
            this.tingeInfo = null;
            this.adjustColorInfo = null;
            this.m_asset = null;
            if (m_view != null){
                m_view.reset();
            };
            this.m_itemType = 0;
            if (m_currentAction != null){
                m_currentAction.stop();
                m_currentAction = null;
            };
            this.m_vx = 0;
            this.m_vy = 0;
            this.m_vz = 0;
            this.m_avx = 0;
            this.m_avy = 0;
            this.m_avz = 0;
            if (this.trigger){
                this.trigger.removeEventListener(TriggerEvent.ON_TRIGGER, this.onEventTrigger);
                this.trigger.inactivate();
                TriggerEventBuilder.getInstance().breakTriggerEvent(this.trigger);
                this.trigger = null;
            };
            if (this.m_procedure){
                this.m_procedure.deactivate();
                this.m_procedure.finalize();
                this.m_procedure = null;
            };
            if (this.m_owner){
                this.m_owner.removeEventListener(ElementEvent.ON_ELEMENT_DEAD, this.onOwnerDead);
            };
            if (((((this.m_owner) && ((this.m_owner is BaseActor)))) && ((this.m_owner as BaseActor).getModel()))){
                (this.m_owner as BaseActor).getModel().removeEventListener(ActorModelEvent.ON_ACTION_CHANGE, this.onOwnerActionEnd);
            };
            this.m_owner = null;
            this.m_info = null;
            m_scene = null;
            super.reset();
        }

        public function getInteractItemView():BaseInteratItemView
        {
            return ((this.m_view as BaseInteratItemView));
        }

        public function getModel():ActorModel
        {
            return (this.m_model);
        }

        override public function setDirection(_arg_1:int):void
        {
            super.setDirection(_arg_1);
            if (m_view){
                m_view.setDirection(_arg_1);
            };
        }

        protected function onEventTrigger(_arg_1:TriggerEvent):void
        {
            this.reportServer((_arg_1.data as BasePlayer));
            this.changeState(this.nextState);
        }

        protected function reportServer(_arg_1:BasePlayer=null):void
        {
            var _local_2:AIEvent;
            var _local_3:PDupItemInteractProtocol;
            var _local_4:PCityInteractItemReq;
            if (this.reportToServer){
                if (AICore.Runtime.currentContext.getType() == AIContextType.CT_DUPLICATE){
                    if (!_arg_1){
                        _arg_1 = AICore.Runtime.currentContext.getPlayerManager().getMainPlayer();
                    };
                    _local_3 = new PDupItemInteractProtocol();
                    _local_3.index = this.m_info.id;
                    _local_3.sequence_no = 1;
                    _local_3.playerID = _arg_1.getPlayerInfo().playerID;
                    _local_3.pos = this.getMapPosition();
                    DupSend(PDupItemInteractProtocol.OUT_CMD, _local_3);
                } else {
                    if (AICore.Runtime.currentContext.getType() == AIContextType.CT_CITY){
                        _local_4 = new PCityInteractItemReq();
                        if (this.m_info.id > 100000){
                            _local_4.index = this.m_info.id;
                        } else {
                            _local_4.index = this.m_info.interactItemID;
                        };
                        CitySend(PCityInteractItemReq.REQ_CMD, _local_4);
                    };
                };
                _local_2 = new AIEvent(AIEvent.ITEM_INTERACT);
                _local_2.data = this.m_info.interactItemID;
                AICore.dispatchAIEvent(_local_2);
            };
        }

        public function changeState(_arg_1:int):void
        {
            var _local_2:InteractState;
            var _local_3:Sprite;
            var _local_4:Object;
            var _local_5:SceneWalkData;
            if (this.m_currentState != _arg_1){
                _local_2 = this.m_states[_arg_1];
                if (_local_2){
                    _local_3 = (this.m_view.getDisplay() as Sprite);
                    if (_local_3){
                        _local_3.mouseEnabled = false;
                        _local_3.buttonMode = false;
                    };
                    if (this.trigger){
                        this.trigger.removeEventListener(TriggerEvent.ON_TRIGGER, this.onEventTrigger);
                        this.trigger.inactivate();
                        TriggerEventBuilder.getInstance().breakTriggerEvent(this.trigger);
                        this.trigger = null;
                    };
                    this.nextState = _local_2.nextState;
                    this.reportToServer = _local_2.reportToServer;
                    this.act(_local_2.actionID, -1);
                    this.m_defaultActionID = _local_2.actionID;
                    this.m_currentState = _arg_1;
                    if (((_local_2.triggerInfo) && (!((_local_2.triggerInfo.type == ""))))){
                        _local_4 = {"target":this};
                        this.trigger = TriggerEventBuilder.getInstance().buildTriggerEvent(_local_2.triggerInfo, _local_4);
                        this.trigger.addEventListener(TriggerEvent.ON_TRIGGER, this.onEventTrigger);
                        this.trigger.activate();
                        if (_local_2.triggerInfo.type == TriggerEventType.T_BE_ClICK){
                            _local_3 = (this.m_view.getDisplay() as Sprite);
                            if (_local_3){
                                _local_3.mouseEnabled = true;
                                _local_3.buttonMode = true;
                            };
                        };
                    };
                };
                if (((this.m_scene) && (this.m_sceneBlockRect))){
                    _local_5 = (m_scene.getConfig()["scene"] as SceneConfigInfo).walkData;
                    if (_local_5){
                        _local_5.removeUnwalkable(this.m_sceneBlockRect);
                    };
                };
                if (_local_2){
                    this.m_vx = (_local_2.vx * this.m_info.direction);
                    this.m_vy = _local_2.vy;
                    this.m_vz = _local_2.vz;
                    this.m_avx = (_local_2.avx * this.m_info.direction);
                    this.m_avy = _local_2.avy;
                    this.m_avz = _local_2.avz;
                } else {
                    this.m_vx = 0;
                    this.m_vy = 0;
                    this.m_vz = 0;
                    this.m_avx = 0;
                    this.m_avy = 0;
                    this.m_avz = 0;
                };
                this.m_blockRect = null;
                this.m_sceneBlockRect = null;
                if (((_local_2) && (_local_2.blockRect))){
                    this.m_blockRect = _local_2.blockRect;
                    this.m_sceneBlockRect = this.m_blockRect.clone();
                    this.m_sceneBlockRect.x = (this.mapX + this.m_blockRect.x);
                    this.m_sceneBlockRect.y = (this.mapZ + this.m_blockRect.y);
                    if (m_scene){
                        _local_5 = (m_scene.getConfig()["scene"] as SceneConfigInfo).walkData;
                        if (_local_5){
                            _local_5.addUnwalkable(this.m_sceneBlockRect);
                        };
                    };
                };
                if (this.m_currentState == 0){
                    this.destroyItem();
                };
            };
        }

        override public function act(_arg_1:int, _arg_2:int, _arg_3:Object=null):Boolean
        {
            var _local_4:IElementAction;
            if (-1 != _arg_1){
                _local_4 = m_actionList[_arg_1];
                if (_local_4 == null){
                    warning("[BaseInteractItem] 没有找到可执行的动作或执行动作相同!");
                    return (false);
                };
                if (_local_4 == m_currentAction){
                    m_currentAction.exec(_arg_2, _arg_3);
                    return (false);
                };
                m_prevAction = m_currentAction;
                if (m_prevAction != null){
                    m_prevAction.stop();
                };
                m_currentAction = _local_4;
                m_currentAction.exec(_arg_2, _arg_3);
                if (this.m_view){
                    this.m_view.getDisplay().x = this.m_posX;
                    this.m_view.getDisplay().y = this.m_posY;
                };
            } else {
                m_prevAction = m_currentAction;
                if (m_prevAction != null){
                    m_prevAction.stop();
                };
                m_currentAction = null;
                if (this.m_view){
                    this.m_view.setMotionID(-1);
                };
            };
            return (true);
        }

        override public function dispose():void
        {
            if (this.trigger){
                this.trigger.removeEventListener(TriggerEvent.ON_TRIGGER, this.onEventTrigger);
                this.trigger.inactivate();
                TriggerEventBuilder.getInstance().breakTriggerEvent(this.trigger);
                this.trigger = null;
            };
            if (this.m_procedure){
                this.m_procedure.finalize();
                this.m_procedure = null;
            };
            super.dispose();
        }

        protected function initializeAction():void
        {
        }

        protected function createAction(_arg_1:int, _arg_2:Class, _arg_3:Boolean=false):IElementAction
        {
            var _local_8:IElementAction;
            var _local_4:ActionInfo = new ActionInfo();
            _local_4.id = _arg_1;
            var _local_5:VKeyInfo = new VKeyInfo();
            _local_5.value = _arg_1;
            if (!_local_4.vKeyInfos){
                _local_4.vKeyInfos = new Vector.<VKeyInfo>();
            };
            _local_4.vKeyInfos.push(_local_5);
            if (!_local_4.actionStates){
                _local_4.actionStates = new Dictionary();
            };
            var _local_6:ActionState = new ActionState();
            _local_6.index = 0;
            _local_6.frameIndex = 0;
            _local_6.motionID = _arg_1;
            _local_4.actionStates[_local_6.index] = _local_6;
            var _local_7:InteractItemModel = (this.m_model as InteractItemModel);
            if (!_local_7.vkeyMapActionIDs){
                _local_7.vkeyMapActionIDs = new Dictionary();
            };
            _local_7.mapActionVKeys(_local_4);
            if (_arg_3){
                _local_8 = new (_arg_2)(_local_4.id, _arg_3);
            } else {
                _local_8 = new (_arg_2)(_local_4.id);
            };
            this.m_model.setActionInfo(_local_4.id, _local_4);
            return (_local_8);
        }

        protected function destroyItem():void
        {
            var _local_2:IScene;
            var _local_1:Battle = Battle.Current;
            if (_local_1){
                _local_2 = _local_1.getCurrentScene();
                if (_local_2){
                    _local_1.execBehindFrame(new CFunction(dispatchEvent, this, [new ElementEvent(ElementEvent.ON_ELEMENT_DEAD, this)]));
                    _local_1.execBehindFrame(new CFunction(_local_2.destoryElement, _local_2, [this]));
                };
            };
        }

        public function get tingeInfo():TingeInfo
        {
            return (this.m_info.tingeInfo);
        }

        public function set tingeInfo(_arg_1:TingeInfo):void
        {
            if (!this.m_info){
                return;
            };
            this.m_info.tingeInfo = _arg_1;
            if (this.getDisplay()){
                if (_arg_1){
                    this.getDisplay().transform.colorTransform = _arg_1;
                } else {
                    this.getDisplay().transform.colorTransform = TingeInfo.NULL;
                };
            };
        }

        public function get adjustColorInfo():AdjustColorInfo
        {
            return (this.m_info.adjustColorInfo);
        }

        public function set adjustColorInfo(_arg_1:AdjustColorInfo):void
        {
            if (!this.m_info){
                return;
            };
            this.m_info.adjustColorInfo = _arg_1;
            if (this.getDisplay()){
                if (_arg_1){
                    this.getDisplay().filters = [_arg_1.toColorMatrixFilter()];
                } else {
                    this.getDisplay().filters = null;
                };
            };
        }

        public function get hp():int
        {
            return (this.m_hp);
        }

        public function set owner(_arg_1:BaseElement):void
        {
            this.m_owner = _arg_1;
            if (this.m_owner){
                this.setMapPosition(new MapPosition((this.m_owner.mapX + (this.m_rMapX * this.m_owner.getDirection())), (this.m_owner.mapZ + this.m_rMapZ), (this.m_owner.mapY + this.m_rMapY)));
            };
        }

        public function get owner():BaseElement
        {
            return (this.m_owner);
        }

        public function addProperty(_arg_1:AbstractProperty):void
        {
            if (!_arg_1){
                return;
            };
            if (!this.m_propertyList){
                this.m_propertyList = new Vector.<AbstractProperty>();
            };
            _arg_1.install(this);
            this.m_propertyList.push(_arg_1);
        }

        public function removeProperty(_arg_1:AbstractProperty):void
        {
            if (!_arg_1){
                return;
            };
            _arg_1.uninstall();
            var _local_2:int = this.m_propertyList.indexOf(_arg_1);
            if (_local_2 > -1){
                this.m_propertyList.splice(_local_2, 1);
            };
        }

        public function getProperty():Vector.<AbstractProperty>
        {
            return (this.m_propertyList);
        }

        public function getPropertyByType(_arg_1:String):Vector.<AbstractProperty>
        {
            var _local_3:AbstractProperty;
            var _local_2:Vector.<AbstractProperty> = new Vector.<AbstractProperty>();
            for each (_local_3 in this.m_propertyList) {
                if (_local_3.getType() == _arg_1){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:AbstractProperty;
            super.render(_arg_1);
            var _local_3:int;
            var _local_4:* = this.m_propertyList;
            for each (_local_2 in this.m_propertyList) {
                _local_2.render();
            };
        }

        public function get bFollowToNextScene():Boolean
        {
            return (this.m_bFollow);
        }

        public /*  ©init. */ function _SafeStr_581()
        {
        }


    }
}//package com.tencent.ai.core.interact

// _SafeStr_581 = " BaseInteractItem" (String#13901)


