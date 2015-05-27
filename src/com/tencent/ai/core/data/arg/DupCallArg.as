// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.DupCallArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_196;

    public class DupCallArg implements IXMLSerialize 
    {

        public static const LOGIN:int = 1;
        public static const LOGOUT:int = 2;
        public static const REPLAY:int = 3;
        public static const RESELECT:int = 4;
        public static const ENTER_STRAIGHT:int = 5;
        public static const ENTER_DIFFICULTY_SELECT:int = 6;
        public static const TEAM_BEINVITE_TO_DUP:int = 7;
        public static const TEAM_ENTER_SPECIAL_DUP:int = 8;

        public var type:int;
        public var data:int;
        public var extraData:Object;

        public function DupCallArg(_arg_1:int=0, _arg_2:*=null)
        {
            this.type = _arg_1;
            this.data = _arg_2;
        }

        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@type);
            this.data = int(_arg_1.@data);
        }

        public function encode()
        {
            var _local_1:XML = <PluginArg/>
            ;
            _local_1.@type = this.type;
            _local_1.@data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_196()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_196 = " DupCallArg" (String#14537)


