// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.shadow.ShadowPools

package com.tencent.ai.core.element.shadow
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.enum.ShadowType;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_393;
    import __AS3__.vec.*;

    public class ShadowPools 
    {

        private static var _INSTANCE:ShadowPools;

        private var _elements:Dictionary;
        private var _elementClasses:Dictionary;

        public function ShadowPools()
        {
            this.initThis();
        }

        public static function getInstance():ShadowPools
        {
            if (_INSTANCE == null){
                _INSTANCE = new (ShadowPools)();
            };
            return (_INSTANCE);
        }

        public static function createShadowElement(_arg_1:int=0):ShadowElement
        {
            return (getInstance().createShadowElement(_arg_1));
        }

        public static function returnShadowElement(_arg_1:ShadowElement):void
        {
            getInstance().returnShadowElement(_arg_1);
        }


        private function initThis():void
        {
            this._elements = new Dictionary();
            this._elementClasses = new Dictionary();
            this._elementClasses[ShadowType.NORMAL] = ShadowElementNormal;
            this._elementClasses[ShadowType.EFFECT_ASSET] = ShadowElementEffect;
        }

        public function createShadowElement(_arg_1:int=0):ShadowElement
        {
            var _local_3:ShadowElement;
            var _local_4:Class;
            var _local_2:Vector.<ShadowElement> = this._elements[_arg_1];
            if (_local_2 == null){
                _local_2 = new Vector.<ShadowElement>();
                this._elements[_arg_1] = _local_2;
            };
            if (_local_2.length == 0){
                _local_4 = this._elementClasses[_arg_1];
                _local_3 = (new (_local_4)() as ShadowElement);
            } else {
                _local_3 = _local_2.pop();
            };
            return (_local_3);
        }

        public function returnShadowElement(_arg_1:ShadowElement):void
        {
            var _local_2:Vector.<ShadowElement> = this._elements[_arg_1.getShadowType()];
            _local_2.push(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_393()
        {
        }


    }
}//package com.tencent.ai.core.element.shadow

// _SafeStr_393 = " ShadowPools" (String#15194)


