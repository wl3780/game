package com.tencent.ai.core.utils.binary.compare
{

    public class StringRecord implements IRecord 
    {

        public var name:String;
        public var max:uint = 0;
        public var min:uint = 0xFFFFFFFF;

        public function statistics(value:Object):void
        {
            if (value === null) {
                return;
            }
            var strVal:String = value as String;
            if (strVal.length > this.max) {
                this.max = strVal.length;
            }
            if (strVal.length < this.min) {
                this.min = strVal.length;
            }
        }

        public function dump(xml:XML):void
        {
            xml.@maxLength = this.max;
            xml.@minLength = this.min;
        }

    }
}
