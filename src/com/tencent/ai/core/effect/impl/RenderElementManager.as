// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.RenderElementManager

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.effect.EffectElement;
    import  ©init._SafeStr_382;
    import __AS3__.vec.*;

    public class RenderElementManager implements IEffectElementManager 
    {

        protected var effectManager:IEffectManager;
        protected var singleLayerEffects:Vector.<SingleLayerEffect>;

        public function RenderElementManager(_arg_1:IEffectManager)
        {
            this.effectManager = _arg_1;
            this.singleLayerEffects = new Vector.<SingleLayerEffect>();
        }

        public function createElement(_arg_1:EffectInfo):EffectElement
        {
            var _local_2:SingleLayerEffect = this.newElement(_arg_1);
            var _local_3:EffectAsset = this.effectManager.getEffectAsset(_arg_1.eid);
            _local_2.setMapPosition(_arg_1.location);
            _local_2.setDirection(_arg_1.direction);
            _local_2.setScale(_arg_1.scaleX, _arg_1.scaleY);
            _local_2.setRotation(_arg_1.rotation);
            _local_2.setAsset(_local_3, _arg_1.motionID);
            _local_2.tingeInfo = _arg_1.tingeInfo;
            _local_2.adjustColorInfo = _arg_1.adjustColorInfo;
            return (_local_2);
        }

        public function destoryElement(_arg_1:EffectElement):void
        {
            var _local_2:SingleLayerEffect = (_arg_1 as SingleLayerEffect);
            if (_local_2 != null){
                this.effectManager.returnEffectAsset(_local_2.getAsset());
                _local_2.reset();
                this.freeElement(_local_2);
            };
        }

        protected function newElement(_arg_1:EffectInfo):SingleLayerEffect
        {
            return ((((this.singleLayerEffects.length == 0)) ? (new SingleLayerEffect()) : this.singleLayerEffects.pop()));
        }

        protected function freeElement(_arg_1:EffectElement):void
        {
            this.singleLayerEffects.push(_arg_1);
        }

        public function clear():void
        {
        }

        public /*  ©init. */ function _SafeStr_382()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_382 = " RenderElementManager" (String#17390)


