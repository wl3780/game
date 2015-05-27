// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.CallFamilyPluginArg

package com.tencent.ai.core.data.arg
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_179;

    public class CallFamilyPluginArg implements IXMLSerialize 
    {

        public static const CALL_NAME:String = "callFamily";
        public static const FAMILY_OPEN:int = 0;
        public static const FAMILY_LOOK:int = 1;
        public static const FAMILY_JOIN:int = 2;
        public static const FAMILY_CREATE:int = 3;
        public static const FAMILY_NOTIFY:int = 4;
        public static const FAMILY_CLOSE:int = 5;

        public var callType:int;
        public var data:Object;

        public function CallFamilyPluginArg(_arg_1:int=0)
        {
            this.callType = _arg_1;
        }

        public function decode(_arg_1:XML):void
        {
            this.callType = _arg_1.@callType;
        }

        public function encode()
        {
            return ("");
        }

        public /*  ©init. */ function _SafeStr_179()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_179 = " CallFamilyPluginArg" (String#16841)


