// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SearchMaxYArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_149;

    public class SearchMaxYArg extends ScriptArg 
    {

        public var targetGroup:int = 0;
        public var searchX:int = 100;
        public var searchZ:int = 20;
        public var searchOffsetX:int = 0;
        public var searchOffsetZ:int = 0;
        public var saveVIndex:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.targetGroup = int(_arg_1.@targetGroup);
            this.searchX = int(_arg_1.@x);
            this.searchZ = int(_arg_1.@z);
            this.searchOffsetX = int(_arg_1.@offsetX);
            this.searchOffsetZ = int(_arg_1.@offsetZ);
            this.saveVIndex = int(_arg_1.@saveVIndex);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@targetGroup = this.targetGroup;
            _local_1.@x = this.searchX;
            _local_1.@z = this.searchZ;
            _local_1.@offsetX = this.searchOffsetX;
            _local_1.@offsetZ = this.searchOffsetZ;
            _local_1.@saveVIndex = this.saveVIndex;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SearchMaxYArg = (super.clone() as SearchMaxYArg);
            _local_1.targetGroup = this.targetGroup;
            _local_1.searchX = this.searchX;
            _local_1.searchZ = this.searchZ;
            _local_1.searchOffsetX = this.searchOffsetX;
            _local_1.searchOffsetZ = this.searchOffsetZ;
            _local_1.saveVIndex = this.saveVIndex;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_149()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_149 = " SearchMaxYArg" (String#13688)


