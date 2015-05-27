// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.OpNumerical

package com.tencent.ai.core.actor.model
{
    import  ©init._SafeStr_40;

    public class OpNumerical extends OpAttribItem 
    {

        public var fixZero:Boolean;
        public var rate:Number;
        public var value:Number;

        public function OpNumerical(_arg_1:String="", _arg_2:Boolean=true, _arg_3:Number=0, _arg_4:Number=0, _arg_5:int=0, _arg_6:int=0)
        {
            super(_arg_1, _arg_5, _arg_6);
            this.fixZero = _arg_2;
            this.rate = _arg_3;
            this.value = _arg_4;
        }

        override public function op(_arg_1:Attribute, _arg_2:Object):void
        {
            super.op(_arg_1, _arg_2);
            var _local_3:Number = _arg_1[name];
            var _local_4:Number = 0;
            if (this.fixZero){
                this.value = (0 - _local_3);
            };
            if (this.rate != 0){
                _local_4 = Number(_arg_2);
            };
            _arg_1.setValueByName(name, ((_local_3 + (_local_4 * this.rate)) + this.value));
        }

        public /*  ©init. */ function _SafeStr_40()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_40 = " OpNumerical" (String#16658)


