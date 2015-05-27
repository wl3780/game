// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ThunderEffectManager

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.effect.EffectElement;
    import  ©init._SafeStr_387;
    import __AS3__.vec.*;

    public class ThunderEffectManager implements IEffectElementManager 
    {

        protected var m_effectManager:IEffectManager;
        protected var m_effectElements:Vector.<ThunderChainElement>;

        public function ThunderEffectManager(_arg_1:IEffectManager)
        {
            this.m_effectManager = _arg_1;
            this.m_effectElements = new Vector.<ThunderChainElement>();
        }

        public function createElement(_arg_1:EffectInfo):EffectElement
        {
            var _local_2:ThunderChainElement = new ThunderChainElement();
            _local_2.setMapPosition(_arg_1.location);
            _local_2.setElementArg(_arg_1);
            this.m_effectElements.push(_local_2);
            return (_local_2);
        }

        public function destoryElement(_arg_1:EffectElement):void
        {
            var _local_3:int;
            var _local_2:ThunderChainElement = (_arg_1 as ThunderChainElement);
            if (_local_2 != null){
                _local_2.reset();
                _local_3 = this.m_effectElements.indexOf(_arg_1);
                if (_local_3 > -1){
                    this.m_effectElements.splice(_local_3, 1);
                };
            };
        }

        protected function freeElement(_arg_1:EffectElement):void
        {
            this.m_effectElements.push(_arg_1);
        }

        public function clear():void
        {
        }

        public /*  ©init. */ function _SafeStr_387()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_387 = " ThunderEffectManager" (String#14096)


