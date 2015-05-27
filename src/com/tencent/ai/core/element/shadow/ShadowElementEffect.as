// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.shadow.ShadowElementEffect

package com.tencent.ai.core.element.shadow
{
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.render.IBitmapRenderDisplay;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.enum.ShadowType;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.render.MotionAsset;
    import  ©init._SafeStr_391;

    public class ShadowElementEffect extends ShadowElement 
    {

        private static var _EFFECT:IEffectManager;

        protected var m_shadowDisplay:IBitmapRenderDisplay;
        protected var m_asset:EffectAsset;

        public function ShadowElementEffect()
        {
            this.m_shadowType = ShadowType.EFFECT_ASSET;
        }

        override protected function createDisplay():IDisplay
        {
            this.m_shadowDisplay = DisplaySystem.createBitmapRenderDisplay();
            return (this.m_shadowDisplay);
        }

        override public function initialize(_arg_1:Object=null):void
        {
            if (_EFFECT == null){
                _EFFECT = AICore.effect;
            };
            this.m_asset = _EFFECT.getEffectAsset(int(_arg_1), this);
            var _local_2:MotionAsset = this.m_asset.motionAssets[0];
            this.m_shadowDisplay.setTimeLine(_local_2.timeline);
            this.m_shadowDisplay.play();
        }

        override public function render(_arg_1:int):void
        {
            this.m_shadowDisplay.render(_arg_1);
        }

        override public function reset():void
        {
            if (this.m_shadowDisplay != null){
                this.m_shadowDisplay.reset();
                _EFFECT.returnEffectAsset(this.m_asset, this);
            };
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_391()
        {
        }


    }
}//package com.tencent.ai.core.element.shadow

// _SafeStr_391 = " ShadowElementEffect" (String#14789)


