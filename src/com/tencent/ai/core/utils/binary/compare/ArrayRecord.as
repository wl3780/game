// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.compare.ArrayRecord

package com.tencent.ai.core.utils.binary.compare
{
    import  ©init._SafeStr_1361;

    public class ArrayRecord implements IRecord 
    {

        private var _isSimpleData:Boolean = true;
        private var _type:String = "";
        private var _numberRecord:IRecord;
        public var max:uint = 0;
        public var min:uint = 0xFFFFFFFF;


        public function statistics(_arg_1:Object):void
        {
            if (_arg_1 === null){
                return;
            };
            var _local_2:Array = (_arg_1 as Array);
            if (this.isSimpleData(_local_2)){
            };
            if (_local_2.length > this.max){
                this.max = _local_2.length;
            };
            if (_local_2.length < this.min){
                this.min = _local_2.length;
            };
        }

        private function isSimpleData(_arg_1:Array):Boolean
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:String;
            if (!this._isSimpleData){
                return (this._isSimpleData);
            };
            _local_3 = _arg_1.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = typeof(_arg_1[_local_2]);
                if ((((((_local_4 === "number")) || ((_local_4 === "boolean")))) || ((_local_4 === "string")))){
                    if (!this._type){
                        this.setType(_local_4);
                    };
                    this._numberRecord.statistics(_arg_1);
                    if (this._type != _local_4){
                        this._isSimpleData = false;
                        break;
                    };
                } else {
                    this._isSimpleData = false;
                    break;
                };
                _local_2++;
            };
            return (this._isSimpleData);
        }

        private function setType(_arg_1:String):void
        {
            this._type = _arg_1;
            if (_arg_1 == "int"){
                this._numberRecord = new IntRecord();
            } else {
                if (_arg_1 == "uint"){
                    this._numberRecord = new UintRecord();
                } else {
                    if (_arg_1 == "Number"){
                        this._numberRecord = new NumberRecord();
                    };
                };
            };
        }

        public function dump(_arg_1:XML):void
        {
            if (this._isSimpleData){
                if (this._numberRecord){
                    _arg_1.@simpleType = this._type;
                    this._numberRecord.dump(_arg_1);
                } else {
                    _arg_1.@simpleType = "simple";
                };
            } else {
                _arg_1.@simpleType = "complex";
            };
        }

        public /*  ©init. */ function _SafeStr_1361()
        {
        }


    }
}//package com.tencent.ai.core.utils.binary.compare

// _SafeStr_1361 = " ArrayRecord" (String#16595)


