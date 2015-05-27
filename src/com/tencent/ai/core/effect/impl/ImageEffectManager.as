// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ImageEffectManager

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.arg.ImageEffectArg;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.effect.EffectElement;
    import  ©init._SafeStr_368;
    import __AS3__.vec.*;

    public class ImageEffectManager implements IEffectElementManager 
    {

        protected var m_effectManager:IEffectManager;
        protected var m_effectElements:Vector.<ImageElement>;
        protected var m_imgByRefs:Dictionary;

        public function ImageEffectManager(_arg_1:IEffectManager)
        {
            this.m_effectManager = _arg_1;
            this.m_effectElements = new Vector.<ImageElement>();
            this.m_imgByRefs = new Dictionary();
        }

        public function imgEffectsDisappear(_arg_1:ImageRefInfo=null):void
        {
            delete this.m_imgByRefs[_arg_1.ref];
        }

        public function createElement(_arg_1:EffectInfo):EffectElement
        {
            var _local_2:ImageElement = this.newElement(_arg_1);
            _local_2.setMapPosition(_arg_1.location);
            _local_2.setDirection(_arg_1.direction);
            _local_2.setElementArg(ImageEffectArg(_arg_1.otherArg));
            var _local_3:Object = (((_arg_1.ref == null)) ? this : (_arg_1.ref));
            var _local_4:ImageRefInfo = this.m_imgByRefs[_local_3];
            if (_local_4 == null){
                _local_4 = new ImageRefInfo(_local_3, _arg_1.maxCount, this);
                this.m_imgByRefs[_local_3] = _local_4;
            };
            _local_4.push(_local_2);
            return (_local_2);
        }

        public function destoryElement(_arg_1:EffectElement):void
        {
            var _local_2:ImageElement = (_arg_1 as ImageElement);
            if (_local_2 != null){
                _local_2.reset();
                this.freeElement(_local_2);
            };
        }

        protected function newElement(_arg_1:EffectInfo):ImageElement
        {
            return ((((this.m_effectElements.length == 0)) ? (new ImageElement()) : this.m_effectElements.pop()));
        }

        protected function freeElement(_arg_1:EffectElement):void
        {
            this.m_effectElements.push(_arg_1);
        }

        public function clear():void
        {
            var _local_1:ImageRefInfo;
            for each (_local_1 in this.m_imgByRefs) {
                _local_1.dispose();
            };
            this.m_imgByRefs = new Dictionary();
        }

        public /*  ©init. */ function _SafeStr_368()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_368 = " ImageEffectManager" (String#15668)


