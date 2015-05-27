// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SSTypeInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_338;

    public class SSTypeInfo implements IXMLSerialize 
    {

        public static const COMPARE_CODE_NO:int = -1;
        public static const COMPARE_CODE_EXIST:int = 0;
        public static const COMPARE_CODE_YES:int = 1;

        public var type:int;
        public var classID:int;
        public var name:String;
        public var yesTypes:String;
        public var noTypes:String;
        public var effectID:int;
        public var soundIn:int;
        public var soundOut:int;


        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@type);
            this.classID = int(_arg_1.@classID);
            this.name = String(_arg_1.@name);
            this.yesTypes = String(_arg_1.@yesTypes);
            this.noTypes = String(_arg_1.@noTypes);
            this.effectID = int(_arg_1.@effectID);
            this.soundIn = int(_arg_1.@soundIn);
            this.soundOut = int(_arg_1.@soundOut);
        }

        public function encode()
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_338()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_338 = " SSTypeInfo" (String#17369)


