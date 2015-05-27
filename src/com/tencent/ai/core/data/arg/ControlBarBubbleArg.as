// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.ControlBarBubbleArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_195;

    public class ControlBarBubbleArg implements IXMLSerialize 
    {

        public static const NEED_BUBBLE:int = 1;

        public var bubbleID:uint;
        public var time:int;
        public var type:int;

        public function ControlBarBubbleArg(_arg_1:int=0, _arg_2:int=0, _arg_3:int=0)
        {
            this.type = _arg_1;
            this.bubbleID = _arg_2;
            this.time = _arg_3;
        }

        public function decode(_arg_1:XML):void
        {
            this.bubbleID = int(_arg_1.@bubbleID);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@bubbleID = this.bubbleID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_195()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_195 = " ControlBarBubbleArg" (String#17153)


