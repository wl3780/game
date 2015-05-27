// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.MoveFollowItemArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_103;

    public class MoveFollowItemArg extends PropertyArg 
    {

        public var followID:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.followID = int(_arg_1.@followID);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@followID = this.followID;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:MoveFollowItemArg = new MoveFollowItemArg();
            _local_1.followID = this.followID;
            _local_1.type = this.type;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_103()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_103 = " MoveFollowItemArg" (String#15851)


