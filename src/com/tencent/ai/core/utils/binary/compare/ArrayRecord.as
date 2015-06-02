package com.tencent.ai.core.utils.binary.compare
{
    
    public class ArrayRecord implements IRecord 
    {

        public var max:uint = 0;
        public var min:uint = 0xFFFFFFFF;
		
        private var _isSimpleData:Boolean = true;
        private var _type:String = "";
        private var _numberRecord:IRecord;

        public function statistics(value:Object):void
        {
            if (value === null) {
                return;
            }
            var arrValue:Array = value as Array;
            if (this.isSimpleData(arrValue)) {
            }
            if (arrValue.length > this.max) {
                this.max = arrValue.length;
            }
            if (arrValue.length < this.min) {
                this.min = arrValue.length;
            }
        }

        private function isSimpleData(arr:Array):Boolean
        {
            if (!_isSimpleData) {
                return _isSimpleData;
            }
            var len:int = arr.length;
            var idx:int = 0;
            while (idx < len) {
	            var type:String = typeof(arr[idx]);
                if (type === "number" || type === "boolean" || type === "string") {
                    if (!_type) {
                        this.setType(type);
                    }
                    _numberRecord.statistics(arr);
                    if (_type != type) {
                        _isSimpleData = false;
                        break;
                    }
                } else {
                    _isSimpleData = false;
                    break;
                }
                idx++;
            }
            return _isSimpleData;
        }

        private function setType(type:String):void
        {
            _type = type;
            if (type == "int") {
                _numberRecord = new IntRecord();
            } else if (type == "uint") {
                _numberRecord = new UintRecord();
            } else if (type == "Number") {
                _numberRecord = new NumberRecord();
            }
        }

        public function dump(xml:XML):void
        {
            if (_isSimpleData) {
                if (_numberRecord) {
                    xml.@simpleType = _type;
                    _numberRecord.dump(xml);
                } else {
                    xml.@simpleType = "simple";
                }
            } else {
                xml.@simpleType = "complex";
            }
        }

    }
}
