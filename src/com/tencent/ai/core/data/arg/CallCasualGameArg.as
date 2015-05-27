// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallCasualGameArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_175;

    public class CallCasualGameArg implements IXMLSerialize 
    {

        public static const SELECT_MODE:int = 0;
        public static const ENTER_STRAIGHT_MODE:int = 1;

        public var mode:int;
        public var gameID:int;

        public function CallCasualGameArg(_arg_1:int=0, _arg_2:int=0)
        {
            this.mode = _arg_1;
            this.gameID = _arg_2;
        }

        public function decode(_arg_1:XML):void
        {
            this.mode = int(_arg_1.@mode);
            this.gameID = int(_arg_1.@gameID);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@mode = this.mode;
            _local_1.@gameID = this.gameID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_175()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_175 = " CallCasualGameArg" (String#15995)


