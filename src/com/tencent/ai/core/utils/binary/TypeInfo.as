package com.tencent.ai.core.utils.binary
{
    import com.tencent.ai.core.utils.binary.compare.ArrayRecord;
    import com.tencent.ai.core.utils.binary.compare.IRecord;
    import com.tencent.ai.core.utils.binary.compare.IntRecord;
    import com.tencent.ai.core.utils.binary.compare.NumberRecord;
    import com.tencent.ai.core.utils.binary.compare.StringRecord;
    import com.tencent.ai.core.utils.binary.compare.UintRecord;
    
    import flash.utils.Dictionary;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;

    public class TypeInfo 
    {

        private static var typeCache:Object = {}

        private var typeDescription:XML;
        private var _publicPropertyNames:Array;
        private var _variableMap:Dictionary;
        private var _isDynamic:Boolean;

        public function TypeInfo(xml:XML)
        {
            this.typeDescription = xml;
            _isDynamic = Boolean(xml.@dynamic);
        }

        public static function describeType(target:*):TypeInfo
        {
            var className:String;
            if (target is String) {
                className = target;
            } else {
                className = getQualifiedClassName(target);
            }
            if (className in typeCache) {
                return typeCache[className];
            }
            if (target is String) {
                target = getDefinitionByName(target);
            }
            var xml:XML = describeType(target);
            var info:TypeInfo = new TypeInfo(xml);
            typeCache[className] = info;
            return info;
        }

        public static function outputAllTypeInfoStatistics():void
        {
            for each (var item:TypeInfo in typeCache) {
                item.outputStatistics();
            }
        }


        public function getPublicPropertyNames():Array
        {
            if (!_publicPropertyNames) {
                _publicPropertyNames = [];
	            var variables:XMLList = this.typeDescription.variable;
	            var l:int = variables.length();
	            var i:int = 0;
                while (i < l) {
                    _publicPropertyNames.push(String(variables[i].@name));
                    i = i + 1;
                }
                var idx:int;
                var tmpXML:XMLList = new XMLList("");
                for each (var item:XML in this.typeDescription.accessor) {
                    with (item) {
                        if (@access == "readwrite" || @access == "readonly") {
                            tmpXML[idx] = item;
							idx++;
                        }
                    }
                }
	            var accessors:XMLList = tmpXML;
                l = accessors.length();
                i = 0;
                while (i < l) {
                    _publicPropertyNames.push(String(accessors[i].@name));
                    i = i + 1;
                }
            }
            return _publicPropertyNames;
        }

        public function statistics(name:String, value:Object):Boolean
        {
            var record:IRecord;
            if (!_variableMap) {
                _variableMap = new Dictionary();
	            var variables:XMLList = this.typeDescription.variable;
                this.createRecord(variables);
				
                var idx:int;
                var tmpXML:XMLList = new XMLList("");
                for each (var item:XML in this.typeDescription.accessor) {
                    with (item) {
                        if (@access == "readwrite") {
                            tmpXML[idx] = item;
							idx++;
                        }
                    }
                }
	            var accessors:XMLList;
                accessors = tmpXML;
                this.createRecord(accessors);
            }
            if (name in _variableMap) {
                record = _variableMap[name] as IRecord;
                record.statistics(value);
                return true;
            }
            return false;
        }

        private function createRecord(xml:XMLList):void
        {
            var len:int = xml.length();
            var idx:int = 0;
            while (idx < len) {
	            var type:String = String(xml[idx].@type);
	            var name:String = String(xml[idx].@name);
                if (type == "int") {
                    _variableMap[name] = new IntRecord();
                } else if (type == "uint") {
                    _variableMap[name] = new UintRecord();
                } else if (type == "Number") {
                    _variableMap[name] = new NumberRecord();
                } else if (type == "Boolean") {
					
				} else if (type == "String") {
                    _variableMap[name] = new StringRecord();
                } else if (type == "Array") {
                    _variableMap[name] = new ArrayRecord();
                }
                idx++;
            }
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

        private function outputRecord(xml:XMLList):XMLList
        {
            var ret:XMLList = new XMLList();
            var len:int = xml.length();
            var idx:int = 0;
            while (idx < len) {
	            var name:String = String(xml[idx].@name);
                if (name in _variableMap) {
		            var item:XML = <accessor/>;
                    item.@name = name;
                    item.@type = xml[idx].@type;
                    _variableMap[name].dump(item);
                    ret = ret + item;
                }
                idx++;
            }
            return ret;
        }

        public function isDynamic():Boolean
        {
            return _isDynamic;
        }

    }
}
