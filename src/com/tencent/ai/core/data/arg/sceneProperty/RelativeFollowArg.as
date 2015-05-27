// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.sceneProperty.RelativeFollowArg

package com.tencent.ai.core.data.arg.sceneProperty
{
    import  ©init._SafeStr_106;

    public class RelativeFollowArg extends PropertyArg 
    {

        public var layerID:int;
        public var followID:int;
        public var offsetX:int;
        public var offsetZ:int;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.layerID = int(_arg_1.@layerID);
            this.followID = int(_arg_1.@followID);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetZ = int(_arg_1.@offsetZ);
        }

        override public function encode():XML
        {
            var _local_1:XML = super.encode();
            _local_1.@layerID = this.layerID;
            _local_1.@followID = this.followID;
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetZ = this.offsetZ;
            return (_local_1);
        }

        override public function clone():PropertyArg
        {
            var _local_1:RelativeFollowArg = new RelativeFollowArg();
            _local_1.layerID = this.layerID;
            _local_1.followID = this.followID;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetZ = this.offsetZ;
            _local_1.type = this.type;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_106()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.sceneProperty

// _SafeStr_106 = " RelativeFollowArg" (String#13967)


