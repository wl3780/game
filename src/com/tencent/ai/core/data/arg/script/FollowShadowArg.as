// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.FollowShadowArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.TingeInfo;
    import  ©init._SafeStr_131;

    public class FollowShadowArg extends ScriptArg 
    {

        public var colorTransform:TingeInfo;
        public var scale:Number = 1;
        public var dAlpha:Number = -0.05;
        public var dScale:Number = 0;
        public var duration:int = 20;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.scale = Number(_arg_1.@scale);
            this.dAlpha = Number(_arg_1.@dAlpha);
            this.dScale = Number(_arg_1.@dScale);
            this.duration = int(_arg_1.@duration);
            var _local_2:XML = _arg_1.Tinge[0];
            if (_local_2 != null){
                this.colorTransform = new TingeInfo();
                this.colorTransform.decode(_local_2);
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@scale = this.scale;
            _local_1.@dAlpha = this.dAlpha;
            _local_1.@dScale = this.dScale;
            _local_1.@duration = this.duration;
            if (this.colorTransform != null){
                _local_1.appendChild(this.colorTransform.encode());
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:FollowShadowArg = (super.clone() as FollowShadowArg);
            _local_1.scale = this.scale;
            _local_1.dAlpha = this.dAlpha;
            _local_1.duration = this.duration;
            _local_1.dScale = this.dScale;
            if (this.colorTransform != null){
                _local_1.colorTransform = this.colorTransform.clone();
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_131()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_131 = " FollowShadowArg" (String#14480)


