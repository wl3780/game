// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.ParticleInfo

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_62;

    public class ParticleInfo implements IXMLSerialize 
    {

        public var id:int;
        public var name:String = "";
        public var offsetX:Number = 0;
        public var offsetY:Number = 0;
        public var offsetZ:Number = 0;
        public var offsetXVar:Number = 0;
        public var offsetYVar:Number = 0;
        public var offsetZVar:Number = 0;
        public var frameTime:int = 600;
        public var frameVar:uint = 0;
        public var deadOffsetX:Number = -1;
        public var deadOffsetY:Number = -1;
        public var deadOffsetZ:Number = -1;
        public var deadGlobalX:Number = -1;
        public var deadGlobalY:Number = -1;
        public var deadGlobalZ:Number = -1;
        public var xMode:int = 0;
        public var yMode:int = 0;
        public var zMode:int = 0;
        public var size:Number = 1;
        public var sizeVar:Number = 0.1;
        public var sizeEndMode:int = 0;
        public var sizeEnd:Number = 1;
        public var sizeEndVar:Number = 0.1;
        public var sizeEndFrames:int = 1;
        public var angle:Number = 90;
        public var angleVar:Number = 40;
        public var isAngleXZ:Boolean = true;
        public var rotationMode:int = 0;
        public var lineSpeed:Number = 15;
        public var lineSpeedVar:Number = 1;
        public var angleSpeed:Number = 12;
        public var angleSpeedVar:Number = 1;
        public var startAlpha:Number = 0.9;
        public var startAlphaVar:Number = 0.1;
        public var endAlpha:Number = 0;
        public var endAlphaVar:Number = 0;
        public var gravityX:Number = 1;
        public var gravityY:Number = 0;
        public var gravityZ:Number = 1;
        public var radialAccel:Number = 0;
        public var radialAccelVar:Number = 0;
        public var tangentialAccel:Number = 0;
        public var tangentialAccelVar:Number = 0;
        public var radiusCenterOffsetX:Number = 0;
        public var radiusCenterOffsetY:Number = 0;
        public var radiusCenterOffsetZ:Number = 0;
        public var startRadius:Number = 0;
        public var startRadiusVar:Number = 0;
        public var endRadius:Number = 50;
        public var endRadiusVar:Number = 10;


        public function decode(_arg_1:XML):void
        {
            this.offsetX = Number(_arg_1.Position.@offsetX);
            this.offsetY = Number(_arg_1.Position.@offsetY);
            this.offsetZ = Number(_arg_1.Position.@offsetZ);
            this.offsetXVar = Number(_arg_1.Position.@offsetXVar);
            this.offsetYVar = Number(_arg_1.Position.@offsetYVar);
            this.offsetZVar = Number(_arg_1.Position.@offsetZVar);
            this.frameTime = int(_arg_1.LifeTime.@frameTime);
            this.frameVar = uint(_arg_1.LifeTime.@frameVar);
            this.deadOffsetX = Number(_arg_1.LifeTime.@deadOffsetX);
            this.deadOffsetY = Number(_arg_1.LifeTime.@deadOffsetY);
            this.deadOffsetZ = Number(_arg_1.LifeTime.@deadOffsetZ);
            this.deadGlobalX = Number(_arg_1.LifeTime.@deadGlobalX);
            this.deadGlobalY = Number(_arg_1.LifeTime.@deadGlobalY);
            this.deadGlobalZ = Number(_arg_1.LifeTime.@deadGlobalZ);
            this.xMode = int(_arg_1.LifeTime.@xMode);
            this.yMode = int(_arg_1.LifeTime.@yMode);
            this.zMode = int(_arg_1.LifeTime.@zMode);
            this.size = Number(_arg_1.Size.@size);
            this.sizeVar = Number(_arg_1.Size.@sizeVar);
            this.sizeEndMode = Number(_arg_1.Size.@sizeEndMode);
            this.sizeEnd = Number(_arg_1.Size.@sizeEnd);
            this.sizeEndVar = Number(_arg_1.Size.@sizeEndVar);
            this.sizeEndFrames = Number(_arg_1.Size.@sizeEndFrames);
            this.angle = Number(_arg_1.Angle.@angle);
            this.angleVar = Number(_arg_1.Angle.@angleVar);
            this.isAngleXZ = (1 == int(_arg_1.Angle.@isAngleXZ));
            this.rotationMode = int(_arg_1.Angle.@rotationMode);
            this.lineSpeed = Number(_arg_1.Speed.@lineSpeed);
            this.lineSpeedVar = Number(_arg_1.Speed.@lineSpeedVar);
            this.angleSpeed = Number(_arg_1.Speed.@angleSpeed);
            this.angleSpeedVar = Number(_arg_1.Speed.@angleSpeedVar);
            this.startAlpha = Number(_arg_1.Alpha.@startAlpha);
            this.startAlphaVar = Number(_arg_1.Alpha.@startAlphaVar);
            this.endAlpha = Number(_arg_1.Alpha.@endAlpha);
            this.endAlphaVar = Number(_arg_1.Alpha.@endAlphaVar);
            this.gravityX = Number(_arg_1.Gravity.@x);
            this.gravityY = Number(_arg_1.Gravity.@y);
            this.gravityZ = Number(_arg_1.Gravity.@z);
            this.radialAccel = Number(_arg_1.Acceleration.@radialAccel);
            this.radialAccelVar = Number(_arg_1.Acceleration.@radialAccelVar);
            this.tangentialAccel = Number(_arg_1.Acceleration.@tangentialAccel);
            this.tangentialAccelVar = Number(_arg_1.Acceleration.@tangentialAccelVar);
            this.radiusCenterOffsetX = Number(_arg_1.Radius.@offsetX);
            this.radiusCenterOffsetY = Number(_arg_1.Radius.@offsetY);
            this.radiusCenterOffsetZ = Number(_arg_1.Radius.@offsetZ);
            this.startRadius = Number(_arg_1.Radius.@startRadius);
            this.startRadiusVar = Number(_arg_1.Radius.@startRadiusVar);
            this.endRadius = Number(_arg_1.Radius.@endRadius);
            this.endRadiusVar = Number(_arg_1.Radius.@endRadiusVar);
        }

        public function encode()
        {
            var _local_1:XML = <ParticleInfo/>
            ;
            _local_1.@id = this.id;
            var _local_2:XML = <Position/>
            ;
            _local_2.@offsetX = this.offsetX;
            _local_2.@offsetY = this.offsetY;
            _local_2.@offsetZ = this.offsetZ;
            _local_2.@offsetXVar = this.offsetXVar;
            _local_2.@offsetYVar = this.offsetYVar;
            _local_2.@offsetZVar = this.offsetZVar;
            _local_1.appendChild(_local_2);
            _local_2 = <LifeTime/>
            ;
            _local_2.@frameTime = this.frameTime;
            _local_2.@frameVar = this.frameVar;
            _local_2.@deadOffsetX = this.deadOffsetX;
            _local_2.@deadOffsetY = this.deadOffsetY;
            _local_2.@deadOffsetZ = this.deadOffsetZ;
            _local_2.@deadGlobalX = this.deadGlobalX;
            _local_2.@deadGlobalY = this.deadGlobalY;
            _local_2.@deadGlobalZ = this.deadGlobalZ;
            _local_2.@xMode = this.xMode;
            _local_2.@yMode = this.yMode;
            _local_2.@zMode = this.zMode;
            _local_1.appendChild(_local_2);
            _local_2 = <Size/>
            ;
            _local_2.@size = this.size;
            _local_2.@sizeVar = this.sizeVar;
            _local_2.@sizeEndMode = this.sizeEndMode;
            _local_2.@sizeEnd = this.sizeEnd;
            _local_2.@sizeEndVar = this.sizeEndVar;
            _local_2.@sizeEndFrames = this.sizeEndFrames;
            _local_1.appendChild(_local_2);
            _local_2 = <Angle/>
            ;
            _local_2.@angle = this.angle;
            _local_2.@angleVar = this.angleVar;
            _local_2.@isAngleXZ = int(this.isAngleXZ);
            _local_2.@rotationMode = this.rotationMode;
            _local_1.appendChild(_local_2);
            _local_2 = <Speed/>
            ;
            _local_2.@lineSpeed = this.lineSpeed;
            _local_2.@lineSpeedVar = this.lineSpeedVar;
            _local_2.@angleSpeed = this.angleSpeed;
            _local_2.@angleSpeedVar = this.angleSpeedVar;
            _local_1.appendChild(_local_2);
            _local_2 = <Alpha/>
            ;
            _local_2.@startAlpha = this.startAlpha;
            _local_2.@startAlphaVar = this.startAlphaVar;
            _local_2.@endAlpha = this.endAlpha;
            _local_2.@endAlphaVar = this.endAlphaVar;
            _local_1.appendChild(_local_2);
            _local_2 = <Gravity/>
            ;
            _local_2.@x = this.gravityX;
            _local_2.@y = this.gravityY;
            _local_2.@z = this.gravityZ;
            _local_1.appendChild(_local_2);
            _local_2 = <Acceleration/>
            ;
            _local_2.@radialAccel = this.radialAccel;
            _local_2.@radialAccelVar = this.radialAccelVar;
            _local_2.@tangentialAccel = this.tangentialAccel;
            _local_2.@tangentialAccelVar = this.tangentialAccelVar;
            _local_1.appendChild(_local_2);
            _local_2 = <Radius/>
            ;
            _local_2.@offsetX = this.radiusCenterOffsetX;
            _local_2.@offsetY = this.radiusCenterOffsetY;
            _local_2.@offsetZ = this.radiusCenterOffsetZ;
            _local_2.@startRadius = this.startRadius;
            _local_2.@startRadiusVar = this.startRadiusVar;
            _local_2.@endRadius = this.endRadius;
            _local_2.@endRadiusVar = this.endRadiusVar;
            _local_1.appendChild(_local_2);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_62()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_62 = " ParticleInfo" (String#17789)


