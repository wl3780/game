// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CallPluginArg

package com.tencent.ai.core.data.arg.script
{
    import flash.utils.Dictionary;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_115;

    public class CallPluginArg extends ScriptArg 
    {

        public static var PLUGIN_ARG_CLS_MAP:Dictionary = new Dictionary();

        public var pluginCmdType:String;
        public var pluginArg:Object;


        override public function decode(_arg_1:XML):void
        {
            var _local_3:Class;
            var _local_4:IXMLSerialize;
            super.decode(_arg_1);
            this.pluginCmdType = String(_arg_1.@cmdType);
            var _local_2:XML = _arg_1.PluginArg[0];
            if (_local_2 != null){
                _local_3 = PLUGIN_ARG_CLS_MAP[this.pluginCmdType];
                if (_local_3 != null){
                    _local_4 = (new (_local_3)() as IXMLSerialize);
                    if (_local_4 != null){
                        _local_4.decode(_local_2);
                        this.pluginArg = _local_4;
                    };
                } else {
                    this.pluginArg = _local_2;
                };
            } else {
                this.pluginArg = _arg_1.toString();
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@cmdType = this.pluginCmdType;
            var _local_2:IXMLSerialize = (this.pluginArg as IXMLSerialize);
            if (_local_2){
                _local_1.appendChild(_local_2.encode());
            } else {
                _local_1.appendChild(XML(this.pluginArg));
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_115()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_115 = " CallPluginArg" (String#16505)


