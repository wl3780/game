// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ImageRefInfo

package com.tencent.ai.core.effect.impl
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.effect.impl.ImageElement;
    import com.tencent.free.utils.CFunction;
    import  ©init._SafeStr_371;
    import __AS3__.vec.*;
    import com.tencent.ai.core.effect.impl.*;

    class ImageRefInfo 
    {

        public var ref:Object;
        public var maxCount:int;
        public var effects:Vector.<ImageElement>;
        public var effectDisposeFunc:CFunction;
        protected var m_manager:Object;

        public function ImageRefInfo(_arg_1:Object, _arg_2:int, _arg_3:Object)
        {
            this.ref = _arg_1;
            this.maxCount = _arg_2;
            this.m_manager = _arg_3;
            this.effects = new Vector.<ImageElement>();
            this.effectDisposeFunc = new CFunction(this.onEffectEnd, this);
        }

        protected function onEffectEnd(_arg_1:ImageElement):void
        {
            if (this.effects == null){
                return;
            };
            var _local_2:int = this.effects.indexOf(_arg_1);
            if (_local_2 != -1){
                this.effects.splice(_local_2, 1);
            };
            if ((((this.effects.length == 0)) && (!((this.ref == null))))){
                if (this.ref != this.m_manager){
                    this.m_manager.imgEffectsDisappear(this);
                    this.ref.imgEffectsDisappear();
                    this.ref = null;
                };
            };
        }

        public function push(_arg_1:ImageElement):void
        {
            _arg_1.setEndHandler(this.effectDisposeFunc);
            this.effects.push(_arg_1);
            if (((!((this.maxCount == -1))) && ((this.effects.length > this.maxCount)))){
                this.effects.shift().end();
            };
        }

        public function dispose():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:Vector.<ImageElement> = this.effects;
            this.effects = null;
            if (_local_1 != null){
                _local_2 = _local_1.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_1[_local_3].end();
                    _local_3++;
                };
            };
            this.ref = null;
        }

        public /*  ©init. */ function _SafeStr_371()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_371 = " ImageRefInfo" (String#16394)


