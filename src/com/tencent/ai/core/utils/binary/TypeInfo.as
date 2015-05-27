// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.TypeInfo

package com.tencent.ai.core.utils.binary
{
    import flash.utils.Dictionary;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getDefinitionByName;
    import flash.utils.describeType;
    import com.tencent.ai.core.utils.binary.compare.IRecord;
    import com.tencent.ai.core.utils.binary.compare.IntRecord;
    import com.tencent.ai.core.utils.binary.compare.UintRecord;
    import com.tencent.ai.core.utils.binary.compare.NumberRecord;
    import com.tencent.ai.core.utils.binary.compare.StringRecord;
    import com.tencent.ai.core.utils.binary.compare.ArrayRecord;
    import  ©init._SafeStr_1366;

    public class TypeInfo 
    {

        private static var typeCache:Object = {};

        private var typeDescription:XML;
        private var _publicPropertyNames:Array;
        private var _variableMap:Dictionary;
        private var _isDynamic:Boolean;

        public function TypeInfo(_arg_1:XML)
        {
            this.typeDescription = _arg_1;
            this._isDynamic = Boolean(_arg_1.@dynamic);
        }

        public static function describeType(_arg_1:*):TypeInfo
        {
            var _local_2:String;
            var _local_3:XML;
            var _local_4:TypeInfo;
            if ((_arg_1 is String)){
                _local_2 = _arg_1;
            } else {
                _local_2 = getQualifiedClassName(_arg_1);
            };
            if ((_local_2 in typeCache)){
                return (typeCache[_local_2]);
            };
            if ((_arg_1 is String)){
                _arg_1 = getDefinitionByName(_arg_1);
            };
            _local_3 = describeType(_arg_1);
            _local_4 = new (TypeInfo)(_local_3);
            typeCache[_local_2] = _local_4;
            return (_local_4);
        }

        public static function outputAllTypeInfoStatistics():void
        {
            var _local_1:TypeInfo;
            for each (_local_1 in typeCache) {
                _local_1.outputStatistics();
            };
        }


        public function getPublicPropertyNames():Array
        {
            var variables:XMLList;
            var i:int;
            var l:int;
            var accessors:XMLList;
            if (!this._publicPropertyNames){
                this._publicPropertyNames = [];
                variables = this.typeDescription.variable;
                l = variables.length();
                i = 0;
                while (i < l) {
                    this._publicPropertyNames.push(String(variables[i].@name));
                    i = (i + 1);
                };
                var _local_3:int;
                var _local_4:* = this.typeDescription.accessor;
                var _local_2 = new (XMLList)("");
                for each (var _local_5 in this.typeDescription.accessor) {
                    var _local_6 = _local_5;
                    with (_local_6) {
                        if ((((@access == "readwrite")) || ((@access == "readonly")))){
                            _local_2[_local_3] = _local_5;
                        };
                    };
                };
                accessors = _local_2;
                l = accessors.length();
                i = 0;
                while (i < l) {
                    this._publicPropertyNames.push(String(accessors[i].@name));
                    i = (i + 1);
                };
            };
            return (this._publicPropertyNames);
        }

        public function statistics(name:String, value:Object):Boolean
        {
            var variables:XMLList;
            var accessors:XMLList;
            var record:IRecord;
            if (!this._variableMap){
                this._variableMap = new Dictionary();
                variables = this.typeDescription.variable;
                this.createRecord(variables);
                var _local_5:int;
                var _local_6:* = this.typeDescription.accessor;
                var _local_4 = new (XMLList)("");
                for each (var _local_7 in this.typeDescription.accessor) {
                    var _local_8 = _local_7;
                    with (_local_8) {
                        if ((@access == "readwrite")){
                            _local_4[_local_5] = _local_7;
                        };
                    };
                };
                accessors = _local_4;
                this.createRecord(accessors);
            };
            if ((name in this._variableMap)){
                record = (this._variableMap[name] as IRecord);
                record.statistics(value);
                return (true);
            };
            return (false);
        }

        private function createRecord(_arg_1:XMLList):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:String;
            var _local_5:String;
            _local_3 = _arg_1.length();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = String(_arg_1[_local_2].@type);
                _local_5 = String(_arg_1[_local_2].@name);
                if (_local_4 == "int"){
                    this._variableMap[_local_5] = new IntRecord();
                } else {
                    if (_local_4 == "uint"){
                        this._variableMap[_local_5] = new UintRecord();
                    } else {
                        if (_local_4 == "Number"){
                            this._variableMap[_local_5] = new NumberRecord();
                        } else {
                            if (_local_4 != "Boolean"){
                                if (_local_4 == "String"){
                                    this._variableMap[_local_5] = new StringRecord();
                                } else {
                                    if (_local_4 == "Array"){
                                        this._variableMap[_local_5] = new ArrayRecord();
                                    };
                                };
                            };
                        };
                    };
                };
                _local_2++;
            };
        }

        public function outputStatistics():void
        {
            var children:XMLList;
            var info:XML;
            var variables:XMLList;
            var accessors:XMLList;
            info = <type/>
            ;
            info.@name = this.typeDescription.@name;
            variables = this.typeDescription.variable;
            children = this.outputRecord(variables);
            info.appendChild(children);
            accessors = this.typeDescription.accessor.(@access == "readwrite");
            children = this.outputRecord(accessors);
            info.appendChild(children);
        }

        private function outputRecord(_arg_1:XMLList):XMLList
        {
            var _local_2:int;
            var _local_3:int;
            var _local_5:String;
            var _local_6:XML;
            _local_3 = _arg_1.length();
            var _local_4:XMLList = new XMLList();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = String(_arg_1[_local_2].@name);
                if ((_local_5 in this._variableMap)){
                    _local_6 = <accessor/>
                    ;
                    _local_6.@name = _local_5;
                    _local_6.@type = _arg_1[_local_2].@type;
                    this._variableMap[_local_5].dump(_local_6);
                    _local_4 = (_local_4 + _local_6);
                };
                _local_2++;
            };
            return (_local_4);
        }

        public function isDynamic():Boolean
        {
            return (this._isDynamic);
        }

        public /*  ©init. */ function _SafeStr_1366()
        {
        }


    }
}//package com.tencent.ai.core.utils.binary

// _SafeStr_1366 = " TypeInfo" (String#15329)


