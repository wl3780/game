// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.ParticleEffectArg

package com.tencent.ai.core.data.arg
{
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_200;
    import __AS3__.vec.*;

    public class ParticleEffectArg extends ImageEffectArg 
    {

        public var iconEffectId:int = 0;
        public var iconFrameIds:Vector.<int>;
        public var numGeneration:int = 0;
        public var deltaRotation:int = 0;
        public var emissAngle:int = 0;
        public var emissVelocity:int = 0;
        public var slowFactor:int = 0;
        public var pauseFrames:int = 0;
        public var fadeFrames:int = 0;
        public var randFactor:Number = 0;
        public var soundID:int = 0;

        public function ParticleEffectArg()
        {
            this.iconFrameIds = new Vector.<int>();
            super();
        }

        public function clone():ParticleEffectArg
        {
            var _local_1:ParticleEffectArg = new ParticleEffectArg();
            _local_1.iconEffectId = this.iconEffectId;
            _local_1.iconFrameIds = this.iconFrameIds;
            _local_1.numGeneration = this.numGeneration;
            _local_1.deltaRotation = this.deltaRotation;
            _local_1.emissAngle = this.emissAngle;
            _local_1.emissVelocity = this.emissVelocity;
            _local_1.slowFactor = this.slowFactor;
            _local_1.pauseFrames = this.pauseFrames;
            _local_1.fadeFrames = this.fadeFrames;
            _local_1.randFactor = this.randFactor;
            _local_1.soundID = this.soundID;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_200()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_200 = " ParticleEffectArg" (String#14297)


