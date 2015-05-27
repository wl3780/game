// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.MoveFollowCameraArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_102;

    public class MoveFollowCameraArg extends PropertyArg 
    {

        public var start:Number;
        public var end:Number;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.start = Number(_arg_1.@start);
            this.end = Number(_arg_1.@end);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@start = this.start;
            _local_1.@end = this.end;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:MoveFollowCameraArg = new MoveFollowCameraArg();
            _local_1.type = this.type;
            _local_1.start = this.start;
            _local_1.end = this.end;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_102()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_102 = " MoveFollowCameraArg" (String#14852)


