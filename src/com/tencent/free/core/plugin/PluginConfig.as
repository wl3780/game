// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.PluginConfig

package com.tencent.free.core.plugin
{
    import __AS3__.vec.Vector;
    import com.tencent.free.core.lib.CLASS;
    import  ©init._SafeStr_32;
    import __AS3__.vec.*;

    public class PluginConfig 
    {

        public var className:String;
        public var label:String;
        public var url:String;
        public var hash:String;
        public var cmdType:String;
        public var arg:Object;
        public var requires:Vector.<RequireInfo>;
        public var loadType:int;
        public var domain:int = 0;
        public var domainCls:CLASS;


        public function decodeXML(_arg_1:XML):void
        {
            var _local_3:XMLList;
            var _local_4:int;
            var _local_5:int;
            var _local_6:RequireInfo;
            if (_arg_1 == null){
                return;
            };
            this.className = String(_arg_1.@className);
            this.label = String(_arg_1.@label);
            this.url = String(_arg_1.@url);
            this.hash = String(_arg_1.@hash);
            this.cmdType = String(_arg_1.@cmdType);
            this.loadType = int(_arg_1.@loadType);
            this.domain = int(_arg_1.@domain);
            this.arg = _arg_1.Arg[0];
            var _local_2:XML = _arg_1.Requires[0];
            if (_local_2 != null){
                _local_3 = _local_2.Require;
                _local_4 = _local_3.length();
                if (_local_4 > 0){
                    this.requires = new Vector.<RequireInfo>();
                    _local_5 = 0;
                    while (_local_5 < _local_4) {
                        _local_6 = new RequireInfo();
                        _local_6.decodeXML(_local_3[_local_5]);
                        this.requires.push(_local_6);
                        _local_5++;
                    };
                };
            };
        }

        public function encodeXML():String
        {
            return ("");
        }

        public /*  ©init. */ function _SafeStr_32()
        {
        }


    }
}//package com.tencent.free.core.plugin

// _SafeStr_32 = " PluginConfig" (String#1556)


