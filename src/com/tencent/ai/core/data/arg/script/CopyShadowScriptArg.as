// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CopyShadowScriptArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.TingeInfo;
    import  ©init._SafeStr_126;

    public class CopyShadowScriptArg extends ScriptArg 
    {

        public var colorTransform:TingeInfo;
        public var scale:Number = 1;
        public var alpha:Number = -0.05;
        public var duration:int = 20;
        public var cInterval:int = 5;
        public var cDuration:int = 300;
        public var maxCounts:int = 10;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.alpha = Number(_arg_1.@alpha);
            this.duration = int(_arg_1.@duration);
            this.cInterval = int(_arg_1.@cInterval);
            this.cDuration = int(_arg_1.@cDuration);
            this.maxCounts = int(_arg_1.@maxCounts);
            var _local_2:XML = _arg_1.Tinge[0];
            if (_local_2 != null){
                this.colorTransform = new TingeInfo();
                this.colorTransform.decode(_local_2);
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@alpha = this.alpha;
            _local_1.@duration = this.duration;
            _local_1.@cInterval = this.cInterval;
            _local_1.@cDuration = this.cDuration;
            _local_1.@maxCounts = this.maxCounts;
            if (this.colorTransform != null){
                _local_1.appendChild(this.colorTransform.encode());
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CopyShadowScriptArg = (super.clone() as CopyShadowScriptArg);
            _local_1.alpha = this.alpha;
            _local_1.duration = this.duration;
            _local_1.cInterval = this.cInterval;
            _local_1.maxCounts = this.maxCounts;
            if (this.colorTransform != null){
                _local_1.colorTransform = this.colorTransform.clone();
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_126()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_126 = " CopyShadowScriptArg" (String#15338)


