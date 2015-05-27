// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ParticleEmitterManager

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.effect.EffectElement;
    import  ©init._SafeStr_381;
    import __AS3__.vec.*;

    public class ParticleEmitterManager implements IEffectElementManager 
    {

        protected var effectManager:IEffectManager;
        protected var singleLayerEffects:Vector.<EmitterElement>;

        public function ParticleEmitterManager(_arg_1:IEffectManager)
        {
            this.effectManager = _arg_1;
            this.singleLayerEffects = new Vector.<EmitterElement>();
        }

        public function createElement(_arg_1:EffectInfo):EffectElement
        {
            var _local_2:EmitterElement = this.newElement(_arg_1);
            _local_2.setMapPosition(_arg_1.location);
            _local_2.setDirection(_arg_1.direction);
            _local_2.setRotation(_arg_1.rotation);
            _local_2.setParticleInfo(_arg_1);
            return (_local_2);
        }

        public function destoryElement(_arg_1:EffectElement):void
        {
            var _local_2:EmitterElement = (_arg_1 as EmitterElement);
            if (_local_2 != null){
                _local_2.reset();
                this.freeElement(_local_2);
            };
        }

        protected function newElement(_arg_1:EffectInfo):EmitterElement
        {
            return ((((this.singleLayerEffects.length == 0)) ? (new EmitterElement()) : this.singleLayerEffects.pop()));
        }

        protected function freeElement(_arg_1:EffectElement):void
        {
            this.singleLayerEffects.push(_arg_1);
        }

        public function clear():void
        {
        }

        public /*  ©init. */ function _SafeStr_381()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_381 = " ParticleEmitterManager" (String#16190)


