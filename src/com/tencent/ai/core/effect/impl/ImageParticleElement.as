// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ImageParticleElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.render.IBitmapDisplay;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.render.MotionAsset;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.BitmapKeyFrame;
    import com.tencent.ai.core.data.EffectInfo;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.Direction;
    import  ©init._SafeStr_370;

    public class ImageParticleElement extends ParticleEffertElement 
    {

        protected var m_asset:EffectAsset;
        protected var m_bitmap:IBitmapDisplay;
        private var m_frameId:int;
        private var b:Boolean = false;

        public function ImageParticleElement()
        {
            super(EffectType.PARTICLE_IMAGE_EFFECT);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_bitmap = DisplaySystem.createBitmapDisplay();
            m_display = this.m_bitmap;
        }

        public function setAsset(_arg_1:EffectAsset, _arg_2:int=0):void
        {
            this.m_asset = _arg_1;
        }

        override public function setDirection(_arg_1:int):void
        {
            super.setDirection(_arg_1);
        }

        override public function setParticleInfo(_arg_1:EffectInfo, _arg_2:Dictionary):void
        {
            var _local_3:int;
            var _local_4:MotionAsset;
            var _local_5:Vector.<BitmapKeyFrame>;
            var _local_6:BitmapKeyFrame;
            super.setParticleInfo(_arg_1, _arg_2);
            if (((((((!((m_effectInfo == null))) && (!((m_particleInfo == null))))) && (!((m_particleData == null))))) && (!((m_emitterParent == null))))){
                _local_3 = (m_particleInfo.framesIDs.length * Math.random());
                this.m_frameId = m_particleInfo.framesIDs[_local_3];
                if (this.m_asset.getIsLoaded()){
                    _local_4 = this.m_asset.motionAssets[0];
                    _local_5 = _local_4.timeline.bitmapFrames;
                    if ((((this.m_frameId >= 0)) && ((this.m_frameId < _local_5.length)))){
                        _local_6 = _local_5[this.m_frameId];
                        this.m_bitmap.bitmapData = _local_6.data;
                        this.m_bitmap.update();
                    };
                };
            };
        }

        private function call(_arg_1:Function):Boolean
        {
            return (_arg_1());
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < updateFuncArray.length) {
                this.b = this.call(updateFuncArray[_local_2]);
                if (this.b){
                    this.end();
                };
                _local_2++;
            };
        }

        override public function end():void
        {
            super.end();
        }

        override public function reset():void
        {
            if (this.m_bitmap != null){
                this.setDirection(Direction.RIGHT);
                this.m_bitmap.reset();
            };
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_370()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_370 = " ImageParticleElement" (String#17093)


