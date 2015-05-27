// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.MoveFlowArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_101;

    public class MoveFlowArg extends PropertyArg 
    {

        public var speed:int;
        public var gap:int;
        public var fullScreen:Boolean = true;
        public var start:int;
        public var end:int;


        override public function decode(_arg_1:XML):void
        {
            this.type = String(_arg_1.@type);
            this.speed = int(_arg_1.@speed);
            this.gap = int(_arg_1.@gap);
            this.fullScreen = ((_arg_1.hasOwnProperty("@fullScreen")) ? (int(_arg_1.@fullScreen) == 1) : true);
            this.start = int(_arg_1.@start);
            this.end = int(_arg_1.@end);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@speed = this.speed;
            _local_1.@gap = this.gap;
            _local_1.@fullScreen = int(this.fullScreen);
            _local_1.@start = this.start;
            _local_1.@end = this.end;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:MoveFlowArg = new MoveFlowArg();
            _local_1.type = this.type;
            _local_1.speed = this.speed;
            _local_1.gap = this.gap;
            _local_1.fullScreen = this.fullScreen;
            _local_1.start = this.start;
            _local_1.end = this.end;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_101()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_101 = " MoveFlowArg" (String#14654)


