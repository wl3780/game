// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ChangeCameraScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_120;

    public class ChangeCameraScriptArg extends ScriptArg 
    {

        public var mapX:int = 0;
        public var mapZ:int = 0;
        public var isFollowFocus:Boolean = false;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.mapX = int(_arg_1.@mapX);
            this.mapZ = int(_arg_1.@mapZ);
            this.isFollowFocus = (((int(_arg_1.@isFollowFocus) == 1)) ? true : false);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@mapX = this.mapX;
            _local_1.@mapZ = this.mapZ;
            _local_1.@isFollowFocus = ((this.isFollowFocus) ? 1 : 0);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_120()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_120 = " ChangeCameraScriptArg" (String#14309)


