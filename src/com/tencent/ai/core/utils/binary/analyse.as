package com.tencent.ai.core.utils.binary
{
    import flash.utils.getQualifiedClassName;

    public function analyse(value:Object):void
    {
        var type = typeof(value);
        if (type == "object") {
	        var kName:String = getQualifiedClassName(value);
	        var idx:int;
	        var len:int;
            if (kName == "Array" || kName.substr(0, 21) == "__AS3__.vec::Vector.<") {
                len = value.length;
                idx = 0;
                while (idx < len) {
                    analyse(value[idx]);
                    idx++;
                }
                return;
            }
			
	        var typeInfo:TypeInfo = TypeInfo.describeType(value);
	        var propNames:Array = typeInfo.getPublicPropertyNames();
            len = propNames.length;
            idx = 0;
            while (idx < len) {
		        var propName:String = propNames[idx];
		        var propValue:Object = value[propName];
                if (!typeInfo.statistics(propName, propValue)) {
                    analyse(propValue);
                }
                idx++;
            }
			
            if (typeInfo.isDynamic()) {
		        var dynProps:Array = [];
                for (var item:Object in value) {
                    dynProps.push(item);
                }
                dynProps.sort();
                analyse(dynProps);
                len = dynProps.length;
                idx = 0;
                while (idx < len) {
                    analyse(value[dynProps[idx]]);
                    idx++;
                }
                return;
            }
        }
    }

}
