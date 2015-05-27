// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.enum.KeynoteDef

package com.tencent.ai.core.enum
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ScriptInfo;
    import  ©init._SafeStr_451;
    import __AS3__.vec.*;

    public class KeynoteDef 
    {

        public var mode:int;
        public var interval:int;
        public var offsetX:int;
        public var offsetY:int;
        public var imagesOffsetXs:Array;
        public var imagesOffsetYs:Array;
        public var imagesURL:Array;
        public var imagesScript:Vector.<ScriptInfo>;
        public var imagesSecondScript:Vector.<ScriptInfo>;

        public function KeynoteDef()
        {
            this.imagesOffsetXs = [];
            this.imagesOffsetYs = [];
            this.imagesURL = [];
            this.imagesScript = new Vector.<ScriptInfo>();
            this.imagesSecondScript = new Vector.<ScriptInfo>();
            super();
        }

        public /*  ©init. */ function _SafeStr_451()
        {
        }


    }
}//package com.tencent.ai.core.enum

// _SafeStr_451 = " KeynoteDef" (String#15227)


