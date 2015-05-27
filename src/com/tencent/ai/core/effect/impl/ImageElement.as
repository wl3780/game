// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ImageElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.EffectElement;
    import com.tencent.ai.core.render.IBitmapDisplay;
    import com.tencent.ai.core.data.arg.ImageEffectArg;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.display.DisplaySystem;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import com.tencent.ai.core.enum.Direction;

    public class ImageElement extends EffectElement 
    {

        protected var m_bitmap:IBitmapDisplay;
        protected var m_dAlpha:Number;
        protected var m_dScale:Number;
        protected var m_duration:int;
        protected var m_isPlay:Boolean;
        protected var m_elementArg:ImageEffectArg;
        protected var m_sourceScale:Number;

        public function ImageElement()
        {
            super(EffectType.IMAGE_EFFECT);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_bitmap = DisplaySystem.createBitmapDisplay();
            m_display = this.m_bitmap;
            this.m_dAlpha = 0;
            this.m_duration = 0;
            this.m_dScale = 0;
            this.m_isPlay = false;
            this.m_sourceScale = 1;
        }

        protected function setBitmapData():void
        {
            var _local_1:BitmapData = this.m_elementArg.copyImg;
            var _local_2:ColorTransform = this.m_elementArg.copyColor;
            this.m_bitmap.bitmapData = _local_1;
            if (_local_2 != null){
                tingeInfo = _local_2;
            };
            this.m_sourceScale = this.m_elementArg.scale;
            this.m_bitmap.scaleX = (m_direction * this.m_sourceScale);
            this.m_bitmap.scaleY = this.m_sourceScale;
            this.m_bitmap.setLocalXY(this.m_elementArg.imgLocalX, this.m_elementArg.imgLocalY);
            this.m_bitmap.update();
            this.m_isPlay = true;
        }

        override public function setDirection(_arg_1:int):void
        {
            super.setDirection(_arg_1);
            this.m_bitmap.scaleX = ((((this.m_elementArg)!=null) ? (this.m_elementArg.scale) : 1) * _arg_1);
        }

        override public function render(_arg_1:int):void
        {
            if (this.m_isPlay){
                if (this.m_dScale != 0){
                    this.m_sourceScale = (this.m_sourceScale + this.m_dScale);
                    if (this.m_sourceScale <= 0){
                        this.m_sourceScale = 0;
                    };
                    this.m_bitmap.scaleX = (m_direction * this.m_sourceScale);
                    this.m_bitmap.scaleY = this.m_sourceScale;
                    this.m_bitmap.update();
                };
                this.m_bitmap.alpha = (this.m_bitmap.alpha + this.m_dAlpha);
                if (this.m_bitmap.alpha <= 0.1){
                    this.m_bitmap.alpha = 0;
                };
                this.m_duration = (this.m_duration - 1);
                if (this.m_duration <= 0){
                    this.end();
                };
            };
        }

        override public function end():void
        {
            this.m_isPlay = false;
            super.end();
        }

        public function setElementArg(_arg_1:ImageEffectArg):void
        {
            this.m_elementArg = _arg_1;
            this.m_dAlpha = _arg_1.dAlpha;
            this.m_duration = _arg_1.duration;
            this.m_dScale = _arg_1.dScale;
            this.setBitmapData();
        }

        public function getElementArg():ImageEffectArg
        {
            return (this.m_elementArg);
        }

        override public function reset():void
        {
            if (this.m_isPlay){
                this.end();
            };
            if (this.m_bitmap != null){
                this.setDirection(Direction.RIGHT);
                this.m_bitmap.reset();
                this.m_duration = 0;
                this.m_dScale = 0;
                this.m_dAlpha = 0;
                this.m_sourceScale = 1;
                if (this.m_elementArg != null){
                    this.m_elementArg.disposeImg(this);
                    this.m_elementArg = null;
                };
                this.m_isPlay = false;
            };
            super.reset();
        }


    }
}//package com.tencent.ai.core.effect.impl

