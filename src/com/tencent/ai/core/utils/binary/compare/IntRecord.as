package com.tencent.ai.core.utils.binary.compare
{

    public class IntRecord implements IRecord 
    {

        public var name:String;
        public var max:int = -2147483648;
        public var min:int = 2147483647;

        public function statistics(value:Object):void
        {
            var intValue:int = value as int;
            if (intValue > this.max) {
                this.max = intValue;
            }
            if (intValue < this.min) {
                this.min = intValue;
            }
        }

        public function dump(xml:XML):void
        {
            xml.@max = this.max;
            xml.@min = this.min;
            var len:int = this.max - this.min;
            xml.@length = len;
            if (this.min >= 0) {
                xml.@recommand = len <= 0xFF ? "unsigned byte" : (len <= 0xFFFF ? "unsigned short" : "unsigned int");
            } else {
                xml.@recommand = (this.max <= 143 && -this.min <= 143) ? "byte" : ((this.max <= 36863 && -this.min <= 36863) ? "short" : "int");
            }
        }

    }
}
