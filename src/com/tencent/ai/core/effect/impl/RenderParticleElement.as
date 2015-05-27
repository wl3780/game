// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.RenderParticleElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.IScriptArrayListener;
    import com.tencent.ai.core.render.IBitmapRenderDisplay;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.render.MotionAsset;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.global_script;
    import com.tencent.ai.core.data.EffectInfo;
    import flash.utils.Dictionary;
    import  ©init._SafeStr_384;

    public class RenderParticleElement extends ParticleEffertElement implements IFrameListener, IScriptArrayListener 
    {

        protected var m_bitmapDisplay:IBitmapRenderDisplay;
        protected var m_asset:EffectAsset;
        protected var m_loop:Boolean;
        private var b:Boolean = false;

        public function RenderParticleElement()
        {
            super(EffectType.PARTICLE_RENDER_EFFECT);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_bitmapDisplay = DisplaySystem.createBitmapRenderDisplay();
            m_display = this.m_bitmapDisplay;
            this.m_loop = false;
            this.m_bitmapDisplay.setScriptArrayListener(this);
        }

        protected function setLoop(_arg_1:Boolean):void
        {
            this.m_loop = _arg_1;
            if (!this.m_loop){
                this.m_bitmapDisplay.addFrameListener(MotionDef.L_FRAME_END, this);
            };
        }

        override public function setDirection(_arg_1:int):void
        {
            super.setDirection(_arg_1);
            this.m_bitmapDisplay.scaleX = _arg_1;
            if (m_angle != 0){
                setRotation(m_angle);
            };
        }

        public function setAsset(_arg_1:EffectAsset, _arg_2:int=0):void
        {
            var _local_3:MotionAsset;
            this.m_asset = _arg_1;
            this.setLoop(_arg_1.info.loop);
            this.setBlendMode(_arg_1.info.blendMode);
            if (_arg_1.motionAssets){
                _local_3 = _arg_1.motionAssets[_arg_2];
                if (_local_3){
                    this.m_bitmapDisplay.setTimeLine(_local_3.timeline);
                    this.m_bitmapDisplay.play();
                };
            };
        }

        public function getAsset():EffectAsset
        {
            return (this.m_asset);
        }

        public function getBitmapDisplay():IBitmapRenderDisplay
        {
            return (this.m_bitmapDisplay);
        }

        public function onFrameEvent(_arg_1:String):void
        {
            end();
        }

        public function onScripts(_arg_1:Array):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ScriptInfo;
            if (_arg_1 != null){
                _local_2 = _arg_1.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = _arg_1[_local_3];
                    global_script(_local_4.cmd, _local_4.arg, this);
                    _local_3++;
                };
            };
        }

        override public function setParticleInfo(_arg_1:EffectInfo, _arg_2:Dictionary):void
        {
            super.setParticleInfo(_arg_1, _arg_2);
        }

        override public function reset():void
        {
            if (this.m_bitmapDisplay != null){
                this.m_bitmapDisplay.reset();
                if (!this.m_loop){
                    this.m_bitmapDisplay.removeFrameListener(MotionDef.L_FRAME_END, this);
                };
            };
            this.m_asset = null;
            this.m_loop = false;
            super.reset();
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:int;
            while (_local_2 < updateFuncArray.length) {
                this.b = this.call(updateFuncArray[_local_2]);
                if (this.b){
                    end();
                };
                _local_2++;
            };
            this.m_bitmapDisplay.render(_arg_1);
        }

        private function call(_arg_1:Function):Boolean
        {
            return (_arg_1());
        }

        public /*  ©init. */ function _SafeStr_384()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_384 = " RenderParticleElement" (String#16124)


