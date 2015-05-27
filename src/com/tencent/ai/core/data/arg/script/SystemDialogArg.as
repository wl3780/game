// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SystemDialogArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_161;

    public class SystemDialogArg extends ScriptArg 
    {

        public var opreationType:String = "create";
        public var data:String = "";
        public var showTime:int = 150;
        public var id:int = 0;


        public function setId(_arg_1:int):void
        {
            this.id = _arg_1;
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.data = String(_arg_1.@data);
            this.showTime = int(_arg_1.@showTime);
            this.id = int(_arg_1.@id);
            this.opreationType = String(_arg_1.@opreationType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@data = this.data;
            _local_1.@showTime = ((this.showTime) ? (this.showTime) : 150);
            _local_1.@id = this.id;
            _local_1.@opreationType = this.opreationType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SystemDialogArg = (super.clone() as SystemDialogArg);
            _local_1.data = this.data;
            _local_1.showTime = this.showTime;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_161()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_161 = " SystemDialogArg" (String#16217)


