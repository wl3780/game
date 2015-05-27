// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.ParticleEffectScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.data.EffectInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.effect.EffectElement;
    import flash.utils.Dictionary;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.arg.script.CreateParticleScriptArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.events.BaseEvent;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1227;
    import __AS3__.vec.*;

    public class ParticleEffectScript implements IScript 
    {

        protected var m_target:ITarget;
        protected var m_container:IElementContainer;
        protected var m_effectInfo:EffectInfo;
        protected var m_effects:Vector.<EffectElement>;
        protected var m_bind_offsetXs:Dictionary;
        protected var m_effectEndHandler:CFunction;
        protected var m_hasBind:Boolean;
        protected var m_effect_id:int;

        public function ParticleEffectScript()
        {
            this.m_effects = new Vector.<EffectElement>();
            this.m_effectEndHandler = new CFunction(this.onEffectEnd, this);
            this.m_effectInfo = new EffectInfo();
            this.m_effectInfo.effectType = EffectType.PARTICLE_EMITTER;
            this.m_bind_offsetXs = new Dictionary();
            this.m_effect_id = 0;
            this.m_hasBind = false;
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:MapPosition;
            var _local_7:int;
            var _local_8:EffectElement;
            var _local_9:Number;
            var _local_3:CreateParticleScriptArg = (_arg_2 as CreateParticleScriptArg);
            _local_3.target = this.m_target;
            var _local_4:BaseElement = (this.m_target.target as BaseElement);
            this.m_effectInfo.otherArg = _local_3;
            if (_local_3.clear){
                this.m_target.removeLastRs(this);
                this.stop();
                return;
            };
            var _local_6:int = _local_4.getDirection();
            this.m_effectInfo.eid = _local_3.effectID;
            this.m_effectInfo.direction = _local_6;
            this.m_effectInfo.rotation = _local_3.rotation;
            this.m_effectInfo.tingeInfo = _local_3.tingeInfo;
            if (_local_3.bind){
                this.m_hasBind = true;
                if (this.m_container == null){
                    this.m_container = (this.m_target.view as IElementContainer);
                };
                _local_5 = new MapPosition();
                _local_7 = _local_3.offsetX;
                _local_5.x = (_local_7 * _local_6);
                _local_5.y = _local_3.offsetY;
                _local_5.z = _local_3.offsetZ;
                _local_5.deepOffset = _local_3.offsetDeep;
                this.m_effectInfo.location = _local_5;
                _local_8 = (this.m_container.createElement(ElementType.ET_EFFECT, this.m_effectInfo) as EffectElement);
                _local_8.id = this.m_effect_id++;
                this.m_bind_offsetXs[_local_8.id] = _local_7;
                this.m_effects.push(_local_8);
                _local_8.setEndHandler(this.m_effectEndHandler);
                this.m_target.addLastRS(this);
                this.m_target.target.addEventListener(ElementEvent.ON_DIR_CHANGE, this.onDirectionChange);
            } else {
                _local_5 = _local_4.getMapPosition();
                _local_5.x = (_local_5.x + (_local_3.offsetX * _local_6));
                _local_5.y = (_local_5.y + _local_3.offsetY);
                _local_5.z = (_local_5.z + _local_3.offsetZ);
                _local_5.deepOffset = (_local_5.deepOffset + _local_3.offsetDeep);
                if (_local_3.fRotation){
                    this.m_effectInfo.rotation = (this.m_effectInfo.rotation + _local_4.getDisplay().rotation);
                    _local_5 = _local_4.getMapPosition();
                    _local_9 = ((Math.PI / 180) * (360 - _local_4.getDisplay().rotation));
                    _local_5.x = (_local_5.x + (((_local_3.offsetX * _local_6) * Math.cos(_local_9)) - (_local_3.offsetY * Math.sin(_local_9))));
                    _local_5.y = (_local_5.y + ((_local_3.offsetY * Math.cos(_local_9)) + ((_local_3.offsetX * _local_6) * Math.sin(_local_9))));
                    _local_5.z = (_local_5.z + _local_3.offsetZ);
                };
                this.m_effectInfo.location = _local_5;
                this.m_target.scene.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
            };
            if (_local_3.reflashDeep){
                this.m_target.scene.getLayer(SceneLayerDef.LAYER_GROUND).sort();
            };
        }

        protected function onEffectEnd(_arg_1:EffectElement):void
        {
            var _local_2:int = this.m_effects.indexOf(_arg_1);
            if (_local_2 != -1){
                this.m_effects.splice(_local_2, 1);
                delete this.m_bind_offsetXs[_arg_1.id];
                if (this.m_effects.length == 0){
                    this.m_target.removeLastRs(this);
                    this.stop();
                };
            };
        }

        public function onDirectionChange(_arg_1:BaseEvent):void
        {
            var _local_5:EffectElement;
            var _local_2:int = int(_arg_1.data);
            var _local_3:int = this.m_effects.length;
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = this.m_effects[_local_4];
                _local_5.setDirection(_local_2);
                _local_5.setMapX((this.m_bind_offsetXs[_local_5.id] * _local_2));
                _local_4++;
            };
        }

        public function stop():void
        {
            var _local_3:EffectElement;
            this.m_hasBind = false;
            this.m_target.target.removeEventListener(ElementEvent.ON_DIR_CHANGE, this.onDirectionChange);
            var _local_1:int = this.m_effects.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                _local_3 = this.m_effects[_local_2];
                this.m_container.destoryElement(_local_3);
                delete this.m_bind_offsetXs[_local_3.id];
                _local_2++;
            };
            this.m_effects.length = 0;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_PARTICLE_EFFECT);
        }

        public /*  ©init. */ function _SafeStr_1227()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1227 = " ParticleEffectScript" (String#15971)


