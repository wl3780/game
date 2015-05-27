// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SystemActivityArrowArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_157;

    public class SystemActivityArrowArg extends ScriptArg 
    {

        public var opreationType:String = "create";
        public var sceneID:int = 0;
        public var xPoint:int = 480;
        public var yPoint:int = 200;
        public var zPoint:int = 150;
        public var showTime:int = 0;
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
            this.zPoint = int(_arg_1.@zPoint);
            this.showTime = int(_arg_1.@showTime);
            this.sceneID = int(_arg_1.@sceneID);
            this.opreationType = String(_arg_1.@opreationType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@xPoint = ((this.xPoint) ? this.xPoint : 480);
            _local_1.@yPoint = ((this.yPoint) ? this.yPoint : (200));
            _local_1.@zPoint = ((this.zPoint) ? this.zPoint : 150);
            _local_1.@showTime = this.showTime;
            _local_1.@id = this.id;
            _local_1.@sceneID = this.sceneID;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SystemActivityArrowArg = (super.clone() as SystemActivityArrowArg);
            _local_1.xPoint = this.xPoint;
            _local_1.yPoint = this.yPoint;
            _local_1.zPoint = this.zPoint;
            _local_1.showTime = this.showTime;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_157()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_157 = " SystemActivityArrowArg" (String#15677)


