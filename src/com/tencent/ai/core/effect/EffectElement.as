// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.EffectElement

package com.tencent.ai.core.effect
{
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.sound.ISoundSource;
    import com.tencent.free.utils.CFunction;
    import flash.geom.ColorTransform;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import flash.filters.ColorMatrixFilter;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.sound.ISoundManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.data.TingeInfo;
    import flash.filters.BitmapFilter;
    import fl.motion.AdjustColor;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.free.logging.warning;
    import  ©init._SafeStr_389;

    public class EffectElement extends BaseElement implements ISoundSource 
    {

        public var effectType:int;
        protected var m_endHandler:CFunction;
        protected var m_tingeInfo:ColorTransform;
        protected var m_adjustColorInfo:AdjustColorInfo;
        protected var m_colorMatrixFilter:ColorMatrixFilter;
        protected var m_playingSounds:Array;
        protected var m_angle:int;
        protected var m_scaleX:Number;
        protected var m_scaleY:Number;

        public function EffectElement(_arg_1:int)
        {
            this.effectType = _arg_1;
            this.m_playingSounds = [];
            this.m_angle = 0;
            this.m_scaleX = 1;
            this.m_scaleY = 1;
            super(ElementType.ET_EFFECT);
        }

        public function setEndHandler(_arg_1:CFunction):void
        {
            this.m_endHandler = _arg_1;
        }

        public function getEndHandler():CFunction
        {
            return (this.m_endHandler);
        }

        public function get playingSounds():Array
        {
            return (this.m_playingSounds);
        }

        public function getSourceTarget():BaseElement
        {
            return (this);
        }

        public function stopAllSounds():void
        {
            var _local_2:ISoundManager;
            var _local_1:int = (((this.m_playingSounds == null)) ? -1 : (this.m_playingSounds.length - 1));
            if (_local_1 >= 0){
                _local_2 = AICore.sound;
                while (_local_1 >= 0) {
                    _local_2.stop(this.m_playingSounds[_local_1]);
                    _local_1--;
                };
                this.m_playingSounds.length = 0;
            };
        }

        public function get tingeInfo():ColorTransform
        {
            return (this.m_tingeInfo);
        }

        public function set tingeInfo(_arg_1:ColorTransform):void
        {
            this.m_tingeInfo = _arg_1;
            if (m_display != null){
                if (_arg_1 != null){
                    m_display.transform.colorTransform = _arg_1;
                } else {
                    m_display.transform.colorTransform = TingeInfo.NULL;
                };
            };
        }

        public function get adjustColorInfo():AdjustColorInfo
        {
            return (this.m_adjustColorInfo);
        }

        public function set adjustColorInfo(_arg_1:AdjustColorInfo):void
        {
            var _local_2:Array;
            var _local_3:Boolean;
            var _local_4:int;
            var _local_5:int;
            var _local_6:BitmapFilter;
            var _local_7:AdjustColor;
            this.m_adjustColorInfo = _arg_1;
            if (this.m_display){
                _local_2 = this.m_display.filters;
                _local_3 = ((_local_2) && (_local_2.length));
                if (_local_3){
                    _local_4 = _local_2.length;
                    _local_5 = 0;
                    while (_local_5 < _local_4) {
                        _local_6 = _local_2[_local_5];
                        if ((_local_6 is ColorMatrixFilter)){
                            _local_2.splice(_local_5, 1);
                        };
                        _local_5++;
                    };
                };
                if (_arg_1){
                    _local_7 = new AdjustColor();
                    _local_7.brightness = _arg_1.brightness;
                    _local_7.contrast = _arg_1.contrast;
                    _local_7.hue = _arg_1.hue;
                    _local_7.saturation = _arg_1.saturation;
                    this.m_colorMatrixFilter = ((this.m_colorMatrixFilter) || (new ColorMatrixFilter()));
                    this.m_colorMatrixFilter.matrix = _local_7.CalculateFinalFlatArray();
                    if (_local_3){
                        _local_2.push(this.m_colorMatrixFilter);
                    } else {
                        _local_2 = [this.m_colorMatrixFilter];
                    };
                };
                this.m_display.filters = _local_2;
            };
        }

        public function setScale(_arg_1:Number, _arg_2:Number):void
        {
            if (this.m_scaleX != _arg_1){
                this.m_scaleX = _arg_1;
                if (m_display != null){
                    m_display.scaleX = (this.m_scaleX * m_direction);
                };
            };
            if (this.m_scaleY != _arg_2){
                this.m_scaleY = _arg_2;
                if (m_display != null){
                    m_display.scaleY = this.m_scaleY;
                };
            };
        }

        public function setRotation(_arg_1:int):void
        {
            this.m_angle = _arg_1;
            if (m_display != null){
                m_display.rotation = (((m_direction == Direction.RIGHT)) ? this.m_angle : (360 - this.m_angle));
            };
        }

        public function getRotation():int
        {
            return (this.m_angle);
        }

        public function end():void
        {
            var _local_1:CFunction = this.m_endHandler;
            if (m_parent != null){
                m_parent.destoryElement(this);
            } else {
                warning("[EffectElement] m_parent is null!");
            };
            if (_local_1 != null){
                _local_1.call(this);
            };
        }

        override public function reset():void
        {
            this.m_endHandler = null;
            this.tingeInfo = null;
            this.adjustColorInfo = null;
            this.setScale(1, 1);
            this.setRotation(0);
            this.stopAllSounds();
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_389()
        {
        }


    }
}//package com.tencent.ai.core.effect

// _SafeStr_389 = " EffectElement" (String#13784)


