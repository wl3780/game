// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ImageParticleEffectManager

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.effect.EffectElement;
    import  ©init._SafeStr_369;
    import __AS3__.vec.*;

    public class ImageParticleEffectManager implements IEffectElementManager 
    {

        protected var m_effectManager:IEffectManager;
        protected var m_effectElements:Vector.<ImageParticleElement>;

        public function ImageParticleEffectManager(_arg_1:IEffectManager)
        {
            this.m_effectManager = _arg_1;
            this.m_effectElements = new Vector.<ImageParticleElement>();
        }

        public function createElement(_arg_1:EffectInfo):EffectElement
        {
            var _local_2:ImageParticleElement = this.newElement(_arg_1);
            var _local_3:EffectAsset = this.m_effectManager.getEffectAsset(_arg_1.eid);
            if (_local_3 == null){
                return (null);
            };
            if (_local_3.particleInfos == null){
                return (null);
            };
            _local_2.setMapPosition(_arg_1.location);
            _local_2.setDirection(_arg_1.direction);
            _local_2.setAsset(_local_3, _arg_1.motionID);
            _local_2.setParticleInfo(_arg_1, _local_3.particleInfos);
            return (_local_2);
        }

        public function destoryElement(_arg_1:EffectElement):void
        {
            var _local_2:ImageParticleElement = (_arg_1 as ImageParticleElement);
            if (_local_2 != null){
                _local_2.reset();
                this.freeElement(_local_2);
            };
        }

        protected function newElement(_arg_1:EffectInfo):ImageParticleElement
        {
            return ((((this.m_effectElements.length == 0)) ? (new ImageParticleElement()) : this.m_effectElements.pop()));
        }

        protected function freeElement(_arg_1:EffectElement):void
        {
            this.m_effectElements.push(_arg_1);
        }

        public function clear():void
        {
        }

        public /*  ©init. */ function _SafeStr_369()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_369 = " ImageParticleEffectManager" (String#16844)


