// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallMallPanelArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_182;

    public class CallMallPanelArg implements IXMLSerialize 
    {

        public var type:int = -1;


        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@type);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@type = this.type;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_182()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_182 = " CallMallPanelArg" (String#16352)


