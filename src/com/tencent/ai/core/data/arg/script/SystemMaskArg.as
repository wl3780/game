// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SystemMaskArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_164;

    public class SystemMaskArg extends ScriptArg 
    {

        public var opreationType:String = "create";
        public var xPoint:int = 100;
        public var yPoint:int = 100;
        public var width:int = 36;
        public var height:int = 37;
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
            this.xPoint = int(_arg_1.@xPoint);
            this.yPoint = int(_arg_1.@yPoint);
            this.width = int(_arg_1.@width);
            this.height = int(_arg_1.@height);
            this.data = String(_arg_1.@data);
            this.opreationType = String(_arg_1.@opreationType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@xPoint = ((this.xPoint) ? this.xPoint : 100);
            _local_1.@yPoint = ((this.yPoint) ? this.yPoint : 100);
            _local_1.@width = ((this.width) ? this.width : 36);
            _local_1.@height = ((this.height) ? this.height : 37);
            _local_1.@data = ((this.data) ? this.data : "");
            _local_1.@id = this.id;
            _local_1.@opreationType = this.opreationType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SystemMaskArg = (super.clone() as SystemMaskArg);
            _local_1.xPoint = this.xPoint;
            _local_1.yPoint = this.yPoint;
            _local_1.width = this.width;
            _local_1.height = this.height;
            _local_1.data = this.data;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_164()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_164 = " SystemMaskArg" (String#16631)


