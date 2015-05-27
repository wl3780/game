// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.PlaySoundScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_141;

    public class PlaySoundScriptArg extends ScriptArg 
    {

        public var soundIDType:int = 0;
        public var soundPackageID:int;
        public var howMany:int = 1;
        public var startTime:int = 0;
        public var volume:int = 50;
        public var actionStop:Boolean = false;
        public var delayFrames:int = 0;
        public var followSource:Boolean;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.soundIDType = int(_arg_1.@soundIDType);
            this.soundPackageID = int(_arg_1.@soundPackageID);
            this.howMany = ((_arg_1.hasOwnProperty("@howMany")) ? int(_arg_1.@howMany) : 1);
            this.startTime = ((_arg_1.hasOwnProperty("@startTime")) ? (int(_arg_1.@startTime)) : 0);
            this.volume = ((_arg_1.hasOwnProperty("@volume")) ? int(_arg_1.@volume) : 100);
            this.actionStop = (int(_arg_1.@actionStop) == 1);
            this.delayFrames = int(_arg_1.@delayFrames);
            this.followSource = (String(_arg_1.@followSource) == "true");
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@soundIDType = this.soundIDType;
            _local_1.@soundPackageID = this.soundPackageID;
            _local_1.@howMany = this.howMany;
            _local_1.@startTime = this.startTime;
            _local_1.@volume = this.volume;
            _local_1.@actionStop = ((this.actionStop) ? 1 : 0);
            _local_1.@delayFrames = this.delayFrames;
            _local_1.@followSource = this.followSource.toString();
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:PlaySoundScriptArg = (super.clone() as PlaySoundScriptArg);
            _local_1.soundIDType = this.soundIDType;
            _local_1.soundPackageID = this.soundPackageID;
            _local_1.howMany = this.howMany;
            _local_1.startTime = this.startTime;
            _local_1.volume = this.volume;
            _local_1.actionStop = this.actionStop;
            _local_1.delayFrames = this.delayFrames;
            _local_1.followSource = this.followSource;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_141()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_141 = " PlaySoundScriptArg" (String#17765)


