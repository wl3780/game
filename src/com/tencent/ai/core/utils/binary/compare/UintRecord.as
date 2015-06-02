package com.tencent.ai.core.utils.binary.compare
{

    public class UintRecord implements IRecord 
    {

        public var name:String;
        public var max:uint = 0;
        public var min:uint = 0xFFFFFFFF;

        public function statistics(value:Object):void
        {
            var uintValue:uint = value as uint;
            if (uintValue > this.max) {
                this.max = uintValue;
            }
            if (uintValue < this.min) {
                this.min = uintValue;
            }
        }

        public function dump(xml:XML):void
        {
            xml.@max = this.max;
            xml.@min = this.min;
            var len:uint = this.max - this.min;
            xml.@length = len;
            xml.@recommand = len <= 0xFF ? "unsigned byte" : (len <= 0xFFFF ? "unsigned short" : "unsigned int");
        }

    }
}
