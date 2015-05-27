// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SystemArrowArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_159;

    public class SystemArrowArg extends ScriptArg 
    {

        public var opreationType:String = "create";
        public var xPoint:int = 480;
        public var yPoint:int = 200;
        public var direction:String = "E";
        public var showTime:int = 90;
        public var id:int = 0;


        public function setId(_arg_1:int):void
        {
            this.id = _arg_1;
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.xPoint = int(_arg_1.@xPoint);
            this.yPoint = int(_arg_1.@yPoint);
            this.direction = String(_arg_1.@direction);
            this.showTime = int(_arg_1.@showTime);
            this.id = int(_arg_1.@id);
            this.opreationType = String(_arg_1.@opreationType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@xPoint = ((this.xPoint) ? this.xPoint : 480);
            _local_1.@yPoint = ((this.yPoint) ? this.yPoint : (200));
            _local_1.@direction = ((this.direction) ? this.direction : "E");
            _local_1.@showTime = this.showTime;
            _local_1.@id = this.id;
            _local_1.@opreationType = this.opreationType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SystemArrowArg = (super.clone() as SystemArrowArg);
            _local_1.xPoint = this.xPoint;
            _local_1.yPoint = this.yPoint;
            _local_1.direction = this.direction;
            _local_1.showTime = this.showTime;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_159()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_159 = " SystemArrowArg" (String#16727)


