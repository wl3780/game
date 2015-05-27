// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.plugin.PluginRequest

package com.tencent.free.core.plugin
{
    import flash.utils.ByteArray;
    import  ©init._SafeStr_35;

    public class PluginRequest 
    {

        public static const CODE_OPEN:int = 100;
        public static const CODE_PROGRESS:int = 113;
        public static const CODE_COMPLETE:int = 200;
        public static const CODE_ERROR:int = 404;

        public var key:String;
        public var url:String;
        public var hash:String;
        public var state:Function;
        public var progress:Function;
        public var bytes:ByteArray;
        public var config:PluginConfig;
        public var initCommands:Array;
        public var loadType:int = 1;

        public function PluginRequest(_arg_1:PluginConfig, _arg_2:Function=null, _arg_3:Function=null)
        {
            this.config = _arg_1;
            this.url = _arg_1.url;
            this.loadType = _arg_1.loadType;
            this.key = (((((this.key == "")) || ((this.key == null)))) ? this.url : this.key);
            this.hash = _arg_1.hash;
            this.state = _arg_2;
            this.progress = _arg_3;
        }

        public function isNull():Boolean
        {
            if (this.config == null){
                return (true);
            };
            return ((((this.url == null)) || ((this.url == ""))));
        }

        public /*  ©init. */ function _SafeStr_35()
        {
        }


    }
}//package com.tencent.free.core.plugin

// _SafeStr_35 = " PluginRequest" (String#1424)


