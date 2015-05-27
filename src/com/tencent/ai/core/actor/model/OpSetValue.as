// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.OpSetValue

package com.tencent.ai.core.actor.model
{
    import  ©init._SafeStr_41;

    public class OpSetValue extends OpAttribItem 
    {

        public var value:Object;

        public function OpSetValue(_arg_1:String="", _arg_2:Object=null, _arg_3:int=0, _arg_4:int=0)
        {
            super(_arg_1, _arg_3, _arg_4);
            this.value = _arg_2;
        }

        override public function op(_arg_1:Attribute, _arg_2:Object):void
        {
            super.op(_arg_1, _arg_2);
            _arg_1.setValueByName(name, this.value);
        }

        public /*  ©init. */ function _SafeStr_41()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_41 = " OpSetValue" (String#16580)


