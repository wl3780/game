// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.PrepareResourceArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_142;

    public class PrepareResourceArg extends ScriptArg 
    {

        public var ptype:int;
        public var pid:int;
        public var atype:int;
        public var aid:String;
        public var aidArr:Array;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.ptype = _arg_1.@ptype;
            this.pid = _arg_1.@pid;
            this.atype = _arg_1.@atype;
            this.aid = _arg_1.@aid;
            this.aidArr = this.aid.split(",");
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@ptype = this.ptype;
            _local_1.@pid = this.pid;
            _local_1.@atype = this.atype;
            _local_1.@aid = this.aid;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:PrepareResourceArg = (super.clone() as PrepareResourceArg);
            _local_1.ptype = this.ptype;
            _local_1.pid = this.pid;
            _local_1.atype = this.atype;
            _local_1.aid = this.aid;
            _local_1.aidArr = this.aidArr.slice();
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_142()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_142 = " PrepareResourceArg" (String#15122)


