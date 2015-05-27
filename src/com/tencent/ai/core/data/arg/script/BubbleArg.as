// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.BubbleArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_114;

    public class BubbleArg extends ScriptArg 
    {

        public var eleType:String = "npc";
        public var eleID:int = 0;
        public var url:String = "res/assets/icon/110.png";
        public var time:int = 1000;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.eleType = String(_arg_1.@eleType);
            this.eleID = int(_arg_1.@eleID);
            this.url = String(_arg_1.@url);
            this.time = int(_arg_1.@time);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@eleType = this.eleType;
            _local_1.@eleID = this.eleID;
            _local_1.@url = this.url;
            _local_1.@time = this.time;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_114()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_114 = " BubbleArg" (String#16211)


