// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.EmitterElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.EffectElement;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.IScriptArrayListener;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.element.IElementContainer;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.arg.script.CreateParticleScriptArg;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.IBitmapRenderDisplay;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.BaseEvent;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.render.MotionAsset;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.global_script;
    import  ©init._SafeStr_367;
    import __AS3__.vec.*;

    public class EmitterElement extends EffectElement implements IFrameListener, IScriptArrayListener 
    {

        protected var m_target:ITarget;
        protected var m_container:IElementContainer;
        protected var m_effectInfo:EffectInfo;
        protected var m_particleInfo:CreateParticleScriptArg;
        protected var m_generate:ParticleEffertInfoGenerater;
        protected var particles:Vector.<EffectElement>;
        protected var m_bitmapDisplay:IBitmapRenderDisplay;
        protected var m_asset:EffectAsset;
        protected var m_loop:Boolean;
        private var interval:int = 10;

        public function EmitterElement()
        {
            super(EffectType.PARTICLE_EMITTER);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_bitmapDisplay = DisplaySystem.createBitmapRenderDisplay();
            m_display = this.m_bitmapDisplay;
            this.m_loop = false;
            this.m_generate = new ParticleEffertInfoGenerater(this);
            this.m_bitmapDisplay.setScriptArrayListener(this);
        }

        public function setParticleInfo(_arg_1:EffectInfo):void
        {
            this.particles = new Vector.<EffectElement>();
            this.m_effectInfo = _arg_1;
            this.m_particleInfo = (this.m_effectInfo.otherArg as CreateParticleScriptArg);
            this.m_target = this.m_particleInfo.target;
            if (this.m_target){
                this.m_container = (this.m_target.view as IElementContainer);
            };
            this.interval = 10;
            this.m_generate.setInfo(this.m_effectInfo);
        }

        override public function render(_arg_1:int):void
        {
            var _local_2:Vector.<EffectInfo>;
            var _local_3:EffectElement;
            var _local_4:int;
            var _local_5:IScene;
            if ((this.interval % 1) == 0){
                this.interval = 1;
                if (this.m_generate.isGeneratingTime){
                    _local_2 = this.m_generate.generate();
                    if (_local_2 != null){
                        _local_4 = 0;
                        while (_local_4 < _local_2.length) {
                            if (((this.m_particleInfo.bind) && (this.m_particleInfo.emitterBind))){
                                _local_3 = (this.m_container.createElement(ElementType.ET_EFFECT, _local_2[_local_4]) as EffectElement);
                            } else {
                                if (this.m_target != null){
                                    _local_3 = (this.m_target.scene.createElement(ElementType.ET_EFFECT, _local_2[_local_4]) as EffectElement);
                                } else {
                                    _local_5 = AICore.Runtime.currentScene;
                                    _local_3 = (_local_5.createElement(ElementType.ET_EFFECT, _local_2[_local_4]) as EffectElement);
                                };
                            };
                            this.particles.push(_local_3);
                            _local_4++;
                        };
                    };
                };
            } else {
                this.interval++;
            };
            this.m_bitmapDisplay.render(_arg_1);
        }

        public function onDirectionChange(_arg_1:BaseEvent):void
        {
            var _local_2:int = int(_arg_1.data);
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

        public /*  ©init. */ function _SafeStr_367()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_367 = " EmitterElement" (String#15218)


