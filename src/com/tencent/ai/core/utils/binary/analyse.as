// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.binary.analyse

package com.tencent.ai.core.utils.binary
{
    import flash.utils.getQualifiedClassName;

    public function analyse(_arg_1:Object):void
    {
        var _local_2:int;
        var _local_3:int;
        var _local_4:Object;
        var _local_6:String;
        var _local_7:TypeInfo;
        var _local_8:Array;
        var _local_9:String;
        var _local_10:Object;
        var _local_11:Array;
        var _local_5 = typeof(_arg_1);
        if (_local_5 == "object"){
            _local_6 = getQualifiedClassName(_arg_1);
            if ((((_local_6 == "Array")) || ((_local_6.substr(0, 21) == "__AS3__.vec::Vector.<")))){
                _local_3 = _arg_1.length;
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    analyse(_arg_1[_local_2]);
                    _local_2++;
                };
                return;
            };
            _local_7 = TypeInfo.describeType(_arg_1);
            _local_8 = _local_7.getPublicPropertyNames();
            _local_3 = _local_8.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_9 = _local_8[_local_2];
                _local_10 = _arg_1[_local_9];
                if (!_local_7.statistics(_local_9, _local_10)){
                    analyse(_local_10);
                };
                _local_2++;
            };
            if (_local_7.isDynamic()){
                _local_11 = [];
                for (_local_4 in _arg_1) {
                    _local_11.push(_local_4);
                };
                _local_11.sort();
                analyse(_local_11);
                _local_3 = _local_11.length;
                _local_2 = 0;
                while (_local_2 < _local_3) {
                    analyse(_arg_1[_local_11[_local_2]]);
                    _local_2++;
                };
                return;
            };
        };
    }

}//package com.tencent.ai.core.utils.binary

