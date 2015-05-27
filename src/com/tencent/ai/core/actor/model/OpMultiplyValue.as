// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.OpMultiplyValue

package com.tencent.ai.core.actor.model
{
    import  ©init._SafeStr_39;

    public class OpMultiplyValue extends OpAttribItem 
    {

        public var value:Number;

        public function OpMultiplyValue(_arg_1:String="", _arg_2:Number=0, _arg_3:int=0, _arg_4:int=0)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.value = _arg_2;
        }

        override public function op(_arg_1:Attribute, _arg_2:Object):void
        {
            super.op(_arg_1, _arg_2);
            var _local_3:Number = _arg_1[name];
            _arg_1.setValueByName(name, (_local_3 * this.value));
        }

        public /*  ©init. */ function _SafeStr_39()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_39 = " OpMultiplyValue" (String#14642)


