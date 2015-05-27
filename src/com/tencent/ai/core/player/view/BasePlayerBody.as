// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.view.BasePlayerBody

package com.tencent.ai.core.player.view
{
    import com.tencent.ai.core.render.BodyViewMultiLayer;
    import com.tencent.ai.core.render.ILayerRender;
    import com.tencent.ai.core.player.view.efffect.EquipLight;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.LayerAsset;
    import com.tencent.ai.core.enum.PlayerBodyLayer;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.utils.RectArea;
    import flash.geom.ColorTransform;
    import com.tencent.ai.core.data.EquipItemInfo;
    import com.tencent.ai.core.data.PlayerEquipsID;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.EquipEffect;
    import flash.filters.GlowFilter;
    import  ©init._SafeStr_851;
    import __AS3__.vec.*;

    public class BasePlayerBody extends BodyViewMultiLayer 
    {

        protected var m_weaponRender:ILayerRender;
        protected var m_weaponRender2:ILayerRender;
        protected var m_avatarRender:ILayerRender;
        protected var m_equipLight:EquipLight;

        public function BasePlayerBody(_arg_1:Vector.<LayerAsset>=null)
        {
            super(_arg_1);
        }

        override protected function createLayers():void
        {
            var _local_2:ILayerRender;
            m_layerCount = PlayerBodyLayer.LAYER_COUNT;
            m_layerAssetsMap = new Dictionary();
            m_layerRenders = new Vector.<ILayerRender>(PlayerBodyLayer.LAYER_COUNT);
            var _local_1:int;
            while (_local_1 < m_layerCount) {
                _local_2 = DisplaySystem.createLayerRender();
                _local_2.layerID = _local_1;
                m_layerRenders[_local_1] = _local_2;
                m_display.addDisplay(_local_2);
                _local_1++;
            };
            m_mainLayer = m_layerRenders[PlayerBodyLayer.L_AVATAR];
            this.m_weaponRender = m_layerRenders[PlayerBodyLayer.L_WEAPON];
            this.m_weaponRender2 = m_layerRenders[PlayerBodyLayer.L_WEAPON_1];
        }

        override public function getAC():RectArea
        {
            var _local_1:RectArea = m_mainLayer.ac;
            if (_local_1 == null){
                _local_1 = this.m_weaponRender.ac;
            };
            return (_local_1);
        }

        override public function setFilters(_arg_1:Array):void
        {
            m_mainLayer.filters = _arg_1;
            this.m_weaponRender.filters = _arg_1;
            this.m_weaponRender2.filters = _arg_1;
        }

        public function setWeaponFilters(_arg_1:int, _arg_2:Array):void
        {
            if (((m_layerRenders) && (m_layerRenders[_arg_1]))){
                m_layerRenders[_arg_1].filters = _arg_2;
            };
        }

        override public function setColorTransform(_arg_1:ColorTransform):void
        {
            m_mainLayer.transform.colorTransform = _arg_1;
            this.m_weaponRender.transform.colorTransform = _arg_1;
            this.m_weaponRender2.transform.colorTransform = _arg_1;
        }

        public function addEquipsView(_arg_1:PlayerEquipsID, _arg_2:IActorView):void
        {
            var _local_3:EquipItemInfo;
            var _local_4:Vector.<EquipItemInfo> = _arg_1.getEquips();
            if (!_local_4){
                return;
            };
            if (!this.m_equipLight){
                this.m_equipLight = new EquipLight();
                this.m_equipLight.actorView = _arg_2;
            };
            this.removeEquipsView(_arg_2);
            _local_3 = _local_4[PlayerEquipsID.BACK_I];
            if (((_local_3) && (_local_3.id))){
                this.addTuiEffect(_local_3, _arg_2);
            };
            _local_3 = _local_4[PlayerEquipsID.WEAPON_I];
            if (((_local_3) && (_local_3.id))){
                this.addWeaponEffect(_local_3, _arg_2);
            };
            _local_3 = _local_4[PlayerEquipsID.FASHION_I];
            if (((_local_3) && (_local_3.id))){
                this.addFashionEffect(_local_3, _arg_2);
            };
        }

        public function removeEquipsView(_arg_1:IActorView):void
        {
            this.removeTuiEffect(_arg_1);
            this.removeWeaponEffect(_arg_1);
            this.removeFashionEffect(_arg_1);
        }

        public function changeDirection(_arg_1:IActorView):void
        {
            ((this.m_equipLight) && (this.m_equipLight.changeDirection()));
        }

        public function changeAction(_arg_1:ActionInfo):void
        {
            ((this.m_equipLight) && (this.m_equipLight.changeAction(_arg_1)));
        }

        private function addTuiEffect(_arg_1:EquipItemInfo, _arg_2:IActorView):void
        {
            this.removeTuiEffect(_arg_2);
            var _local_3:int = EquipStaticInfo(_arg_1.staticInfo).rare;
            var _local_4:int = int((EquipStaticInfo(_arg_1.staticInfo).careerID / 100));
            var _local_5:EquipEffect = AICore.data.getEquipEffect(PlayerEquipsID.BACK_I, _local_3, this.getEnhanceLevel(_arg_1.strengthen));
            if (_local_5){
                if (_local_5.effectType == 0){
                    this.setWeaponFilters(PlayerBodyLayer.L_BACK_AVATAR, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                    this.setWeaponFilters(PlayerBodyLayer.L_BACK_AVATAR_1, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                } else {
                    if (_local_5.effectType == 1){
                        this.m_equipLight.addTuiLight(_local_5.effectArg[0], _local_4);
                    } else {
                        if (_local_5.effectType == 2){
                            this.setWeaponFilters(PlayerBodyLayer.L_BACK_AVATAR, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                            this.setWeaponFilters(PlayerBodyLayer.L_BACK_AVATAR_1, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                            this.m_equipLight.addTuiLight(_local_5.effectArg[1], _local_4);
                        };
                    };
                };
            };
        }

        private function removeTuiEffect(_arg_1:IActorView):void
        {
            this.setWeaponFilters(PlayerBodyLayer.L_BACK_AVATAR, null);
            this.setWeaponFilters(PlayerBodyLayer.L_BACK_AVATAR_1, null);
            ((this.m_equipLight) && (this.m_equipLight.removeTuiLight()));
        }

        private function addWeaponEffect(_arg_1:EquipItemInfo, _arg_2:IActorView):void
        {
            this.removeWeaponEffect(_arg_2);
            var _local_3:int = EquipStaticInfo(_arg_1.staticInfo).rare;
            var _local_4:int = int((EquipStaticInfo(_arg_1.staticInfo).careerID / 100));
            var _local_5:EquipEffect = AICore.data.getEquipEffect(PlayerEquipsID.WEAPON_I, _local_3, this.getEnhanceLevel(_arg_1.strengthen), _local_4);
            if (_local_5){
                if (_local_5.effectType == 0){
                    this.setWeaponFilters(PlayerBodyLayer.L_WEAPON, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                    this.setWeaponFilters(PlayerBodyLayer.L_WEAPON_1, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                } else {
                    if (_local_5.effectType == 1){
                        this.m_equipLight.addWeaponLight(_local_5.effectArg[0], _local_4);
                    } else {
                        if (_local_5.effectType == 2){
                            this.setWeaponFilters(PlayerBodyLayer.L_WEAPON, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                            this.setWeaponFilters(PlayerBodyLayer.L_WEAPON_1, [new GlowFilter(_local_5.effectArg[0], 1, 10, 10, 1)]);
                            this.m_equipLight.addWeaponLight(_local_5.effectArg[1], _local_4);
                        };
                    };
                };
            };
        }

        private function removeWeaponEffect(_arg_1:IActorView):void
        {
            this.setWeaponFilters(PlayerBodyLayer.L_WEAPON, null);
            this.setWeaponFilters(PlayerBodyLayer.L_WEAPON_1, null);
            if (this.m_equipLight){
                this.m_equipLight.removeWeaponLight();
            };
        }

        private function addFashionEffect(_arg_1:EquipItemInfo, _arg_2:IActorView):void
        {
            this.removeFashionEffect(_arg_2);
            var _local_3:int = EquipStaticInfo(_arg_1.staticInfo).rare;
            var _local_4:EquipEffect = AICore.data.getEquipEffect(PlayerEquipsID.FASHION_I, _local_3, this.getEnhanceLevel(_arg_1.strengthen));
            if (_local_4){
                if (_local_4.effectType == 0){
                    this.setWeaponFilters(PlayerBodyLayer.L_AVATAR, [new GlowFilter(_local_4.effectArg[0], 1, 10, 10, 1)]);
                } else {
                    if (_local_4.effectType == 1){
                        this.m_equipLight.addFashionLight(_local_4.effectArg[0]);
                    } else {
                        if (_local_4.effectType == 2){
                            this.setWeaponFilters(PlayerBodyLayer.L_AVATAR, [new GlowFilter(_local_4.effectArg[0], 1, 10, 10, 1)]);
                            this.m_equipLight.addFashionLight(_local_4.effectArg[1]);
                        };
                    };
                };
            };
        }

        private function removeFashionEffect(_arg_1:IActorView):void
        {
            this.setWeaponFilters(PlayerBodyLayer.L_AVATAR, null);
            ((this.m_equipLight) && (this.m_equipLight.removeFashionLight()));
        }

        private function getEnhanceLevel(_arg_1:int):int
        {
            var _local_2:int;
            if (_arg_1 < 8){
                _local_2 = 0;
            } else {
                if (_arg_1 < 15){
                    _local_2 = 8;
                } else {
                    if (_arg_1 < 18){
                        _local_2 = 15;
                    } else {
                        _local_2 = 18;
                    };
                };
            };
            return (_local_2);
        }

        public /*  ©init. */ function _SafeStr_851()
        {
        }


    }
}//package com.tencent.ai.core.player.view

// _SafeStr_851 = " BasePlayerBody" (String#16289)


