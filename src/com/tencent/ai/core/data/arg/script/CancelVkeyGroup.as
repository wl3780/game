// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CancelVkeyGroup

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_117;

    public class CancelVkeyGroup implements IXMLSerialize 
    {

        public var vKey:int;
        public var limitStep:int;


        public function decode(_arg_1:XML):void
        {
            this.vKey = int(_arg_1.@vKey);
            this.limitStep = int(_arg_1.@limitStep);
        }

        public function encode()
        {
            var _local_1:XML = <CancelVkeyGroup/>
            ;
            _local_1.@vKey = this.vKey;
            _local_1.@limitStep = this.limitStep;
            return (_local_1);
        }

        public function toString():String
        {
            return ((((("虚拟键(" + this.vKey) + ")  层级(") + this.limitStep) + ")"));
        }

        public /*  ©init. */ function _SafeStr_117()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_117 = " CancelVkeyGroup" (String#17384)


