// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ParticleEffertInfoGenerater

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.arg.script.CreateParticleScriptArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.MapPosition;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.enum.ParticleEmitterMode;
    import com.tencent.ai.core.enum.EffectType;
    import  ©init._SafeStr_373;
    import __AS3__.vec.*;

    public class ParticleEffertInfoGenerater 
    {

        private var emitterElement:EmitterElement;
        public var isGeneratingTime:Boolean;
        private var m_effectInfo:EffectInfo;
        private var m_particleInfo:CreateParticleScriptArg;
        private var waves:int;
        private var maxParticleNumber:int = 2;
        private var minParticleNumber:int = 1;
        private var realParticleNumber:int = 1;

        public function ParticleEffertInfoGenerater(_arg_1:EmitterElement)
        {
            this.isGeneratingTime = false;
            this.emitterElement = _arg_1;
        }

        public function setInfo(_arg_1:EffectInfo):void
        {
            this.waves = 0;
            this.m_effectInfo = null;
            this.m_particleInfo = null;
            this.maxParticleNumber = 0;
            this.minParticleNumber = 0;
            this.realParticleNumber = 0;
            this.m_effectInfo = _arg_1;
            this.m_particleInfo = (this.m_effectInfo.otherArg as CreateParticleScriptArg);
            this.m_particleInfo.emitterParents = this.emitterElement;
            this.waves = this.m_particleInfo.shootTime;
            this.isGeneratingTime = true;
        }

        public function generate():Vector.<EffectInfo>
        {
            var _local_2:EffectInfo;
            var _local_4:BaseElement;
            var _local_5:MapPosition;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            this.isGeneratingTime = false;
            if (this.waves <= -1){
                this.isGeneratingTime = true;
            } else {
                if (this.waves == 0){
                    return (null);
                };
                this.waves--;
                this.isGeneratingTime = true;
            };
            var _local_1:Vector.<EffectInfo> = new Vector.<EffectInfo>();
            this.maxParticleNumber = this.m_particleInfo.maxParticleNumber;
            this.minParticleNumber = this.m_particleInfo.minParticleNumber;
            this.realParticleNumber = (Math.random() * Math.abs((this.maxParticleNumber - this.minParticleNumber)));
            this.realParticleNumber = (this.realParticleNumber + (((this.minParticleNumber < this.maxParticleNumber)) ? this.minParticleNumber : this.maxParticleNumber));
            var _local_3:int;
            while (_local_3 < this.realParticleNumber) {
                _local_2 = new EffectInfo();
                if (this.m_particleInfo.sourceMode == ParticleEmitterMode.SOURCE_RENDER_MODE){
                    _local_2.effectType = EffectType.PARTICLE_RENDER_EFFECT;
                } else {
                    if (this.m_particleInfo.sourceMode == ParticleEmitterMode.SOURCE_IMAGE_MODE){
                        _local_2.effectType = EffectType.PARTICLE_IMAGE_EFFECT;
                    };
                };
                _local_2.otherArg = this.m_particleInfo;
                if (this.m_particleInfo.target != null){
                    _local_4 = (this.m_particleInfo.target.target as BaseElement);
                };
                _local_6 = this.emitterElement.getDirection();
                _local_2.eid = this.m_particleInfo.effectID;
                _local_2.direction = _local_6;
                _local_2.rotation = this.m_particleInfo.rotation;
                _local_2.tingeInfo = this.m_particleInfo.tingeInfo;
                if (((this.m_particleInfo.bind) && (this.m_particleInfo.emitterBind))){
                    _local_5 = new MapPosition();
                    _local_7 = this.m_particleInfo.offsetX;
                    _local_5.x = (_local_7 * _local_6);
                    _local_5.y = this.m_particleInfo.offsetY;
                    _local_5.z = this.m_particleInfo.offsetZ;
                    _local_5.deepOffset = this.m_particleInfo.offsetDeep;
                    _local_2.location = _local_5;
                } else {
                    if (_local_4 != null){
                        _local_5 = _local_4.getMapPosition();
                        _local_5.x = (_local_5.x + (this.m_particleInfo.offsetX * _local_6));
                        _local_5.y = (_local_5.y + this.m_particleInfo.offsetY);
                        _local_5.z = (_local_5.z + this.m_particleInfo.offsetZ);
                        _local_5.deepOffset = (_local_5.deepOffset + this.m_particleInfo.offsetDeep);
                        if (this.m_particleInfo.fRotation){
                            _local_2.rotation = (_local_2.rotation + _local_4.getDisplay().rotation);
                            _local_5 = _local_4.getMapPosition();
                            _local_8 = ((Math.PI / 180) * (360 - _local_4.getDisplay().rotation));
                            _local_5.x = (_local_5.x + (((this.m_particleInfo.offsetX * _local_6) * Math.cos(_local_8)) - (this.m_particleInfo.offsetY * Math.sin(_local_8))));
                            _local_5.y = (_local_5.y + ((this.m_particleInfo.offsetY * Math.cos(_local_8)) + ((this.m_particleInfo.offsetX * _local_6) * Math.sin(_local_8))));
                            _local_5.z = (_local_5.z + this.m_particleInfo.offsetZ);
                        };
                        _local_2.location = _local_5;
                    } else {
                        _local_2.location = this.emitterElement.getMapPosition();
                    };
                };
                _local_1.push(_local_2);
                _local_3++;
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_373()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_373 = " ParticleEffertInfoGenerater" (String#14126)


