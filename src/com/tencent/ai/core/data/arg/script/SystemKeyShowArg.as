// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SystemKeyShowArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_163;

    public class SystemKeyShowArg extends ScriptArg 
    {

        public var opreationType:String = "create";
        public var type:int = 0;
        public var data:String = "";
        public var id:int = 0;


        public function setId(_arg_1:int):void
        {
            this.id = _arg_1;
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.id = int(_arg_1.@id);
            this.type = int(_arg_1.@type);
            this.data = String(_arg_1.@data);
            this.opreationType = String(_arg_1.@opreationType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@type = ((this.type) ? this.type : 0);
            _local_1.@data = ((this.data) ? this.data : "");
            _local_1.@id = this.id;
            _local_1.@opreationType = this.opreationType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SystemKeyShowArg = (super.clone() as SystemKeyShowArg);
            _local_1.type = this.type;
            _local_1.data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_163()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_163 = " SystemKeyShowArg" (String#13796)


