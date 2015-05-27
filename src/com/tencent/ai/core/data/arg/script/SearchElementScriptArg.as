// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SearchElementScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_148;

    public class SearchElementScriptArg extends ScriptArg 
    {

        public var targetGroup:int = 0;
        public var targetDir:int = -1;
        public var searchType:int = 0;
        public var searchX:int = 100;
        public var searchZ:int = 20;
        public var searchY:int = 2147483647;
        public var searchOffsetX:int = 0;
        public var searchOffsetZ:int = 0;
        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;
        public var offsetDeep:int = 0;
        public var useElementY:Boolean = false;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.targetGroup = int(_arg_1.@targetGroup);
            this.targetDir = int(_arg_1.@targetDir);
            this.searchType = int(_arg_1.@st);
            this.searchX = int(_arg_1.@sx);
            this.searchZ = int(_arg_1.@sz);
            this.searchY = int(_arg_1.@sy);
            if (this.searchY == 0){
                this.searchY = int.MAX_VALUE;
            };
            this.searchOffsetX = int(_arg_1.@offsetX);
            this.searchOffsetZ = int(_arg_1.@offsetZ);
            this.offsetX = int(_arg_1.@x);
            this.offsetY = int(_arg_1.@y);
            this.offsetZ = int(_arg_1.@z);
            this.offsetDeep = int(_arg_1.@deep);
            this.useElementY = (int(_arg_1.@useElementY) == 1);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@targetGroup = this.targetGroup;
            _local_1.@targetDir = this.targetDir;
            _local_1.@st = this.searchType;
            _local_1.@sx = this.searchX;
            _local_1.@sz = this.searchZ;
            _local_1.@sy = this.searchY;
            _local_1.@offsetX = this.searchOffsetX;
            _local_1.@offsetZ = this.searchOffsetZ;
            _local_1.@x = this.offsetX;
            _local_1.@y = this.offsetY;
            _local_1.@z = this.offsetZ;
            _local_1.@deep = this.offsetDeep;
            _local_1.@useElementY = ((this.useElementY) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SearchElementScriptArg = (super.clone() as SearchElementScriptArg);
            _local_1.targetGroup = this.targetGroup;
            _local_1.targetDir = this.targetDir;
            _local_1.searchType = this.searchType;
            _local_1.searchOffsetX = this.searchOffsetX;
            _local_1.searchOffsetZ = this.searchOffsetZ;
            _local_1.searchX = this.searchX;
            _local_1.searchZ = this.searchZ;
            _local_1.searchY = this.searchY;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetY = this.offsetY;
            _local_1.offsetZ = this.offsetZ;
            _local_1.offsetDeep = this.offsetDeep;
            _local_1.useElementY = this.useElementY;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_148()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_148 = " SearchElementScriptArg" (String#15926)


