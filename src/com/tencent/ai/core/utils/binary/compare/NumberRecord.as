package com.tencent.ai.core.utils.binary.compare
{

    public class NumberRecord implements IRecord 
    {

        public var name:String;
        public var max:Number = 4.94065645841247E-324;
        public var min:Number = 1.79769313486232E308;

        public function statistics(value:Object):void
        {
            var numVal:Number = value as Number;
            if (numVal > this.max) {
                this.max = numVal;
            }
            if (numVal < this.min) {
                this.min = numVal;
            }
        }

        public function dump(xml:XML):void
        {
            xml.@max = this.max;
            xml.@min = this.min;
        }

    }
}
