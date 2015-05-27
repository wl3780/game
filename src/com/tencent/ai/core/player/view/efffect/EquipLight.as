// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.player.view.efffect.EquipLight

package com.tencent.ai.core.player.view.efffect
{
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.effect.impl.EffectManager;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.ai.core.data.ActionInfo;
    import  ©init._SafeStr_849;

    public class EquipLight 
    {

        private var weaponElement:BaseElement;
        private var tuiElement:BaseElement;
        private var fashionElement:BaseElement;
        private var _actorView:IActorView;
        private var _weaponLightAsset:EffectAsset;
        private var _fashionLightAsset:EffectAsset;
        private var _tuiLightAsset:EffectAsset;
        private var _curCareerID:int;
        private var _weaponPos:int = 20;
        private var _tuiPos:int;


        public function set actorView(_arg_1:IActorView):void
        {
            this._actorView = _arg_1;
        }

        public function get actorView():IActorView
        {
            return (this._actorView);
        }

        public function addWeaponLight(_arg_1:int, _arg_2:int):void
        {
            var _local_4:EffectInfo;
            var _local_5:int;
            this.removeWeaponLight();
            var _local_3:EffectManager = EffectManager.getInstance();
            this._weaponLightAsset = _local_3.getEffectAsset(_arg_1);
            this._curCareerID = _arg_2;
            if (_arg_2 == 3){
                this._weaponPos = -10;
            } else {
                if (_arg_2 == 4){
                    this._weaponPos = -10;
                } else {
                    this._weaponPos = 20;
                };
            };
            if (((!(this._weaponLightAsset)) || (!(this.actorView)))){
                return;
            };
            if (this._weaponLightAsset.getIsLoaded()){
                _local_4 = new EffectInfo();
                _local_4.eid = _arg_1;
                _local_5 = (((this._curCareerID)==3) ? (18) : 5);
                _local_4.location = new MapPosition(0, _local_5, 0, 0);
                this.weaponElement = this.actorView.createElement(ElementType.ET_EFFECT, _local_4, true);
                if (this.weaponElement){
                    this.weaponElement.setDirection(this.actorView.getDirection());
                    this.weaponElement.setMapX((((this.actorView.getDirection())==Direction.LEFT) ? -(this._weaponPos) : this._weaponPos));
                    this.weaponElement.setMapY(_local_5);
                };
            } else {
                this._weaponLightAsset.addEventListener(AssetLoadEvent.COMPLETE, this.weaponEffectHandler);
                this._weaponLightAsset.load();
            };
        }

        public function removeWeaponLight():void
        {
            if (((this.weaponElement) && (this._actorView))){
                this._actorView.destoryElement(this.weaponElement);
                this.weaponElement = null;
            };
            if (this._weaponLightAsset){
                this._weaponLightAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.weaponEffectHandler);
                this._weaponLightAsset = null;
            };
        }

        public function addFashionLight(_arg_1:int):void
        {
            var _local_3:EffectInfo;
            this.removeFashionLight();
            var _local_2:EffectManager = EffectManager.getInstance();
            this._fashionLightAsset = _local_2.getEffectAsset(_arg_1);
            if (((!(this._fashionLightAsset)) || (!(this._actorView)))){
                return;
            };
            if (this._fashionLightAsset.getIsLoaded()){
                _local_3 = new EffectInfo();
                _local_3.eid = _arg_1;
                _local_3.location = new MapPosition(0, 1, 0, 0);
                this.fashionElement = this._actorView.createElement(ElementType.ET_EFFECT, _local_3, true);
            } else {
                this._fashionLightAsset.addEventListener(AssetLoadEvent.COMPLETE, this.fashionEffectHandler);
                this._fashionLightAsset.load();
            };
        }

        public function removeFashionLight():void
        {
            if (((this.fashionElement) && (this._actorView))){
                this._actorView.destoryElement(this.fashionElement);
                this.fashionElement = null;
            };
            if (this._fashionLightAsset){
                this._fashionLightAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.fashionEffectHandler);
                this._fashionLightAsset = null;
            };
        }

        public function addTuiLight(_arg_1:int, _arg_2:int):void
        {
            var _local_4:EffectInfo;
            this.removeTuiLight();
            this._curCareerID = _arg_2;
            var _local_3:EffectManager = EffectManager.getInstance();
            this._tuiLightAsset = _local_3.getEffectAsset(_arg_1);
            if (((!(this._tuiLightAsset)) || (!(this.actorView)))){
                return;
            };
            if (this._tuiLightAsset.getIsLoaded()){
                _local_4 = new EffectInfo();
                _local_4.eid = _arg_1;
                _local_4.location = new MapPosition(0, -15, 0, 0);
                this.tuiElement = this.actorView.createElement(ElementType.ET_EFFECT, _local_4, true);
                if (this.tuiElement){
                    this.tuiElement.setDirection(this.actorView.getDirection());
                    this._tuiPos = (((this._curCareerID)==4) ? -25 : 25);
                    this.tuiElement.setMapX((((this.actorView.getDirection())==Direction.LEFT) ? this._tuiPos : -(this._tuiPos)));
                };
            } else {
                this._tuiLightAsset.addEventListener(AssetLoadEvent.COMPLETE, this.tuiEffectHandler);
                this._tuiLightAsset.load();
            };
        }

        public function removeTuiLight():void
        {
            if (((this.tuiElement) && (this.actorView))){
                this.actorView.destoryElement(this.tuiElement);
                this.tuiElement = null;
            };
            if (this._tuiLightAsset){
                this._tuiLightAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.tuiEffectHandler);
                this._tuiLightAsset = null;
            };
        }

        public function changeDirection():void
        {
            if (this.tuiElement){
                this.tuiElement.setDirection(-(this.actorView.getDirection()));
                this.tuiElement.setMapX((((this.actorView.getDirection())==Direction.LEFT) ? -(this._tuiPos) : this._tuiPos));
            };
            if (this.weaponElement){
                this.weaponElement.setDirection(-(this.actorView.getDirection()));
                this.weaponElement.setMapX((((this.actorView.getDirection())==Direction.LEFT) ? this._weaponPos : -(this._weaponPos)));
            };
        }

        public function changeAction(_arg_1:ActionInfo):void
        {
            if (((_arg_1) && (this.weaponElement))){
                if (_arg_1.id == 1){
                    this.weaponElement.getDisplay().visible = false;
                } else {
                    this.weaponElement.getDisplay().visible = true;
                    if (this._curCareerID == 3){
                        if (_arg_1.id == 2){
                            this.weaponElement.setMapY(-20);
                        } else {
                            this.weaponElement.setMapY(18);
                        };
                    };
                };
            };
            if (((_arg_1) && (this.tuiElement))){
                if (this._curCareerID == 4){
                    if (_arg_1.id == 1){
                        this.tuiElement.getDisplay().visible = false;
                    } else {
                        this.tuiElement.getDisplay().visible = true;
                    };
                };
            };
        }

        protected function weaponEffectHandler(_arg_1:AssetLoadEvent):void
        {
            this._weaponLightAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.weaponEffectHandler);
            this.addWeaponLight(this._weaponLightAsset.info.id, this._curCareerID);
        }

        protected function tuiEffectHandler(_arg_1:AssetLoadEvent):void
        {
            this._tuiLightAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.tuiEffectHandler);
            this.addTuiLight(this._tuiLightAsset.info.id, this._curCareerID);
        }

        protected function fashionEffectHandler(_arg_1:AssetLoadEvent):void
        {
            this._fashionLightAsset.removeEventListener(AssetLoadEvent.COMPLETE, this.fashionEffectHandler);
            this.addFashionLight(this._fashionLightAsset.info.id);
        }

        public /*  ©init. */ function _SafeStr_849()
        {
        }


    }
}//package com.tencent.ai.core.player.view.efffect

// _SafeStr_849 = " EquipLight" (String#14924)


