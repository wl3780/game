// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ParticleEffectScriptArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.TingeInfo;
    import  ©init._SafeStr_140;

    public class ParticleEffectScriptArg extends ScriptArg 
    {

        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;
        public var offsetDeep:int = 0;
        public var iconEffectId:int = 0;
        public var iconFrameIds:String = "";
        public var emissAngle:int = 0;
        public var emissVelocity:int = 0;
        public var numGeneration:int = 0;
        public var deltaRotation:int = 0;
        public var pauseFrames:int = 0;
        public var fadeFrames:int = 0;
        public var slowFactor:int = 0;
        public var tinge:TingeInfo;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetY = int(_arg_1.@offsetY);
            this.offsetZ = int(_arg_1.@offsetZ);
            this.offsetDeep = int(_arg_1.@offsetDeep);
            this.iconEffectId = int(_arg_1.@iconEffectId);
            this.iconFrameIds = String(_arg_1.@iconFrameIds);
            this.numGeneration = int(_arg_1.@numGeneration);
            this.deltaRotation = int(_arg_1.@deltaRotation);
            this.emissAngle = int(_arg_1.@emissAngle);
            this.emissVelocity = int(_arg_1.@emissVelocity);
            this.pauseFrames = int(_arg_1.@pauseFrames);
            this.fadeFrames = int(_arg_1.@fadeFrames);
            this.slowFactor = int(_arg_1.@slowFactor);
            var _local_2:XML = _arg_1.Tinge[0];
            if (_local_2 != null){
                this.tinge = new TingeInfo();
                this.tinge.decode(_local_2);
            };
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetY = this.offsetY;
            _local_1.@offsetZ = this.offsetZ;
            _local_1.@offsetDeep = this.offsetDeep;
            _local_1.@iconEffectId = this.iconEffectId;
            _local_1.@iconFrameIds = this.iconFrameIds;
            _local_1.@numGeneration = this.numGeneration;
            _local_1.@deltaRotation = this.deltaRotation;
            _local_1.@emissAngle = this.emissAngle;
            _local_1.@emissVelocity = this.emissVelocity;
            _local_1.@pauseFrames = this.pauseFrames;
            _local_1.@fadeFrames = this.fadeFrames;
            _local_1.@slowFactor = this.slowFactor;
            if (this.tinge != null){
                _local_1.appendChild(this.tinge.encode());
            };
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ParticleEffectScriptArg = (super.clone() as ParticleEffectScriptArg);
            _local_1.offsetX = this.offsetX;
            _local_1.offsetY = this.offsetY;
            _local_1.offsetZ = this.offsetZ;
            _local_1.offsetDeep = this.offsetDeep;
            _local_1.iconEffectId = this.iconEffectId;
            _local_1.iconFrameIds = this.iconFrameIds.concat();
            _local_1.numGeneration = this.numGeneration;
            _local_1.deltaRotation = this.deltaRotation;
            _local_1.emissAngle = this.emissAngle;
            _local_1.emissVelocity = this.emissVelocity;
            _local_1.pauseFrames = this.pauseFrames;
            _local_1.fadeFrames = this.fadeFrames;
            _local_1.slowFactor = this.slowFactor;
            _local_1.tinge = (((this.tinge)!=null) ? this.tinge.clone() : null);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_140()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_140 = " ParticleEffectScriptArg" (String#16280)


