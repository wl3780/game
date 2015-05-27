// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ParticleEffertElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.EffectElement;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.data.arg.script.CreateParticleScriptArg;
    import com.tencent.ai.core.asset.config.ParticleInfo;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.enum.ParticleEmitterMode;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.IScene;
    import  ©init._SafeStr_372;

    public class ParticleEffertElement extends EffectElement 
    {

        protected var m_effectInfo:EffectInfo;
        protected var m_particleInfo:CreateParticleScriptArg;
        protected var m_particleData:ParticleInfo;
        protected var m_emitterParent:EmitterElement;
        protected var updateFuncArray:Array;
        protected var m_pAngle:Number = 0.20943951023932;
        protected var m_isAngleXZ:Boolean = true;
        protected var m_angleSpeed:Number = 1.5707963267949;
        protected var m_currentLife:int = 0;
        protected var m_gravityX:Number = 0;
        protected var m_gravityY:Number = 0;
        protected var m_gravityZ:Number = 0;
        protected var m_radialAccel:Number = 0;
        protected var m_tangentialAccel:Number = 0;
        protected var m_speed:Number = 0;
        protected var m_deadX:Number = -1;
        protected var m_deadY:Number = -1;
        protected var m_deadZ:Number = 0;
        protected var m_isNeedDeadX:int = 0;
        protected var m_isNeedDeadY:int = 0;
        protected var m_isNeedDeadZ:int = 0;
        protected var m_needDeadEffert:Boolean = false;
        protected var m_startAlpha:Number = 0;
        protected var m_endAlpha:Number = 0;
        protected var m_alphaVar:Number;
        protected var m_centerX:Number = 0;
        protected var m_centerY:Number = 0;
        protected var m_centerZ:Number = 0;
        protected var m_circleX:Number = 50;
        protected var m_circleY:Number = 0;
        protected var m_circleZ:Number = 20;
        protected var m_circleAcc:Number = 0;
        protected var m_circleAngleSpeed:Number = 0.20943951023932;

        public function ParticleEffertElement(_arg_1:int)
        {
            super(_arg_1);
        }

        public function setParticleInfo(_arg_1:EffectInfo, _arg_2:Dictionary):void
        {
            this.clearAll();
            this.m_effectInfo = _arg_1;
            this.m_particleInfo = (_arg_1.otherArg as CreateParticleScriptArg);
            this.m_particleData = _arg_2[this.m_particleInfo.particleInfoID];
            this.m_emitterParent = this.m_particleInfo.emitterParents;
            if (this.m_particleData == null){
                error("找不到粒子配置ID", "", " m_particleInfo.particleInfoID=", this.m_particleInfo.particleInfoID);
                return;
            };
            if (((((((!((this.m_effectInfo == null))) && (!((this.m_particleInfo == null))))) && (!((this.m_particleData == null))))) && (!((this.m_emitterParent == null))))){
                this.setOffset();
                this.setLifetime();
                this.setpScale();
                this.setpAlpha();
                this.setAngle();
                if (this.m_particleInfo.emitterMode == ParticleEmitterMode.EMITTER_GRAVITY_MODE){
                    this.setGravity();
                } else {
                    if (this.m_particleInfo.emitterMode == ParticleEmitterMode.EMITTER_RADIATION_MODE){
                        this.setRadiation();
                    } else {
                        error("粒子配置有问题", "", " m_particleArg.emitterMode=", this.m_particleInfo.emitterMode);
                    };
                };
                this.updateFuncArray.push(this.updateOutGame);
            } else {
                error("粒子系统出错！");
            };
        }

        protected function clearAll():void
        {
            this.m_effectInfo = null;
            this.m_particleInfo = null;
            this.m_particleData = null;
            this.m_emitterParent = null;
            this.m_pAngle = (Math.PI / 15);
            this.m_angleSpeed = (Math.PI / 2);
            this.m_currentLife = 0;
            this.updateFuncArray = new Array();
            this.m_gravityX = 0;
            this.m_gravityY = 0;
            this.m_gravityZ = 0;
            this.m_radialAccel = 0;
            this.m_tangentialAccel = 0;
            this.m_speed = 0;
            this.m_deadX = -1;
            this.m_deadY = -1;
            this.m_deadZ = 0;
            this.m_isNeedDeadX = 0;
            this.m_isNeedDeadY = 0;
            this.m_isNeedDeadZ = 0;
            this.m_needDeadEffert = false;
            this.m_centerX = 0;
            this.m_centerY = 0;
            this.m_centerZ = 0;
            this.m_circleX = 50;
            this.m_circleY = 0;
            this.m_circleZ = 20;
            this.m_circleAngleSpeed = 0;
            this.m_alphaVar = 0;
        }

        private function setOffset():void
        {
            var _local_1:MapPosition;
            var _local_2:int;
            this.setScale(this.m_effectInfo.scaleX, this.m_effectInfo.scaleY);
            this.setRotation(this.m_effectInfo.rotation);
            if (this.m_particleInfo.emitterMode == ParticleEmitterMode.EMITTER_GRAVITY_MODE){
                _local_1 = this.getMapPosition();
                _local_1.x = (_local_1.x + this.m_particleData.offsetX);
                _local_1.y = (_local_1.y + this.m_particleData.offsetY);
                _local_1.z = (_local_1.z + this.m_particleData.offsetZ);
                if (this.m_particleData.offsetXVar > 0){
                    _local_1.x = this.getRandomNumber((_local_1.x - this.m_particleData.offsetXVar), (_local_1.x + this.m_particleData.offsetXVar));
                };
                if (this.m_particleData.offsetYVar > 0){
                    _local_1.y = this.getRandomNumber((_local_1.y - this.m_particleData.offsetYVar), (_local_1.y + this.m_particleData.offsetYVar));
                };
                if (this.m_particleData.offsetZVar > 0){
                    _local_1.z = this.getRandomNumber((_local_1.z - this.m_particleData.offsetZVar), (_local_1.z + this.m_particleData.offsetZVar));
                };
                this.setMapPosition(_local_1);
                if (this.m_particleInfo.dir != 0){
                    _local_2 = this.m_particleInfo.target.target.getDirection();
                    if (_local_2 != this.m_particleInfo.dir){
                        _local_1.x = (_local_1.x - this.m_particleData.offsetX);
                        _local_1.x = (_local_1.x - this.m_particleData.offsetX);
                    };
                };
            };
        }

        private function setLifetime():void
        {
            if (this.m_particleInfo.frameTime == -1){
                this.m_currentLife = this.getRandomNumber((this.m_particleData.frameTime - this.m_particleData.frameVar), (this.m_particleData.frameTime + this.m_particleData.frameVar));
                this.updateFuncArray.push(this.updateLifetime);
            } else {
                this.m_currentLife = this.getRandomNumber((this.m_particleInfo.frameTime - this.m_particleInfo.frameVar), (this.m_particleInfo.frameTime + this.m_particleInfo.frameVar));
                this.updateFuncArray.push(this.updateLifetime);
            };
        }

        private function setpAlpha():void
        {
            var _local_1:Number = this.getRandomNumber((this.m_particleData.startAlpha - this.m_particleData.startAlphaVar), (this.m_particleData.startAlpha + this.m_particleData.startAlphaVar), true, 1, 0);
            this.alpha = _local_1;
            var _local_2:Number = this.getRandomNumber((this.m_particleData.endAlpha - this.m_particleData.endAlphaVar), (this.m_particleData.endAlpha + this.m_particleData.endAlphaVar), true, 1, 0);
            this.m_alphaVar = ((_local_2 - _local_1) / this.m_currentLife);
            this.updateFuncArray.push(this.updateAlpha);
        }

        private function setpScale():void
        {
            var _local_1:Number = 1;
            _local_1 = this.getRandomNumber((this.m_particleData.size - this.m_particleData.sizeVar), (this.m_particleData.size + this.m_particleData.sizeVar), true, int.MAX_VALUE, 0);
            this.setScale((_local_1 * this.m_scaleX), (_local_1 * this.m_scaleY));
        }

        private function setAngle():void
        {
            var _local_1:int;
            this.m_pAngle = this.translateAnglefromRadian(this.getRandomNumber((this.m_particleData.angle - this.m_particleData.angleVar), (this.m_particleData.angle + this.m_particleData.angleVar)));
            this.m_isAngleXZ = this.m_particleData.isAngleXZ;
            if (this.m_particleInfo.dir != 0){
                _local_1 = this.m_particleInfo.target.target.getDirection();
                if (_local_1 != this.m_particleInfo.dir){
                    this.m_pAngle = (this.m_pAngle + Math.PI);
                };
            };
            if (this.m_particleData.rotationMode != 0){
                this.updateFuncArray.push(this.updateRotation);
            };
        }

        private function setGravity():void
        {
            var _local_1:int;
            this.m_gravityX = this.m_particleData.gravityX;
            this.m_gravityY = this.m_particleData.gravityY;
            this.m_gravityZ = this.m_particleData.gravityZ;
            if (this.m_particleInfo.dir != 0){
                _local_1 = this.m_particleInfo.target.target.getDirection();
                if (_local_1 != this.m_particleInfo.dir){
                    this.m_gravityX = -(this.m_gravityX);
                };
            };
            this.m_radialAccel = this.getRandomNumber((this.m_particleData.radialAccel - this.m_particleData.radialAccelVar), (this.m_particleData.radialAccel + this.m_particleData.radialAccelVar));
            this.m_tangentialAccel = this.getRandomNumber((this.m_particleData.tangentialAccel - this.m_particleData.tangentialAccelVar), (this.m_particleData.tangentialAccel + this.m_particleData.tangentialAccelVar));
            this.m_speed = this.getRandomNumber((this.m_particleData.lineSpeed - this.m_particleData.lineSpeedVar), (this.m_particleData.lineSpeed + this.m_particleData.lineSpeedVar));
            this.m_deadX = this.m_particleData.deadOffsetX;
            this.m_deadY = this.m_particleData.deadOffsetY;
            this.m_deadZ = this.m_particleData.deadOffsetZ;
            this.m_isNeedDeadX = this.m_particleData.xMode;
            this.m_isNeedDeadY = this.m_particleData.yMode;
            this.m_isNeedDeadZ = this.m_particleData.zMode;
            this.updateFuncArray.push(this.updateGravity);
            this.updateFuncArray.push(this.updateidDead);
        }

        private function setRadiation():void
        {
            this.m_centerX = (this.getMapPosition().x + this.m_particleData.radiusCenterOffsetX);
            this.m_centerY = (this.getMapPosition().y + this.m_particleData.radiusCenterOffsetY);
            this.m_centerZ = (this.getMapPosition().z + this.m_particleData.radiusCenterOffsetZ);
            var _local_1:MapPosition = this.getMapPosition();
            _local_1.x = this.m_centerX;
            _local_1.y = this.m_centerY;
            _local_1.z = this.m_centerZ;
            this.setMapPosition(_local_1);
            this.m_circleX = this.getRandomNumber((this.m_particleData.startRadius - this.m_particleData.startRadiusVar), (this.m_particleData.startRadius + this.m_particleData.startRadiusVar));
            if (this.m_particleData.endRadius != -1){
                this.m_circleZ = this.getRandomNumber((this.m_particleData.endRadius - this.m_particleData.endRadiusVar), (this.m_particleData.endRadius + this.m_particleData.endRadiusVar));
                this.m_circleAcc = ((this.m_circleZ - this.m_circleX) / this.m_currentLife);
            } else {
                this.m_circleAcc = 0;
            };
            if (this.m_isAngleXZ){
                this.m_circleX = this.m_circleX;
                this.m_circleY = 0;
                this.m_circleZ = this.m_circleX;
            } else {
                this.m_circleX = this.m_circleX;
                this.m_circleY = this.m_circleX;
                this.m_circleZ = 0;
            };
            _local_1 = this.getMapPosition();
            var _local_2:Number = this.translateAnglefromRadian(this.getRandomNumber(0, this.m_particleData.angle));
            this.m_pAngle = _local_2;
            if (this.m_isAngleXZ){
                _local_1.x = (_local_1.x + (this.m_circleX * Math.cos(_local_2)));
                _local_1.z = (_local_1.z + (this.m_circleZ * Math.sin(_local_2)));
            } else {
                _local_1.x = (_local_1.x + (this.m_circleX * Math.cos(_local_2)));
                _local_1.y = (_local_1.y + (this.m_circleY * Math.sin(_local_2)));
            };
            this.setMapPosition(_local_1);
            this.m_circleAngleSpeed = this.getRandomNumber(this.translateAnglefromRadian((this.m_particleData.angleSpeed - this.m_particleData.angleSpeedVar)), this.translateAnglefromRadian((this.m_particleData.angleSpeed + this.m_particleData.angleSpeedVar)));
            this.updateFuncArray.push(this.updateCircle);
        }

        private function translateAnglefromRadian(_arg_1:Number):Number
        {
            return ((((2 * Math.PI) * _arg_1) / 360));
        }

        private function getRandomNumber(_arg_1:Number, _arg_2:Number, _arg_3:Boolean=false, _arg_4:Number=0, _arg_5:Number=0):Number
        {
            var _local_6:Number = _arg_1;
            var _local_7:Number = _arg_2;
            if (_arg_1 > _arg_2){
                _local_6 = _arg_2;
                _local_7 = _arg_1;
            };
            if (_arg_3){
                if (_local_6 < _arg_5){
                    _local_6 = _arg_5;
                };
                if (_local_7 > _arg_4){
                    _local_7 = _arg_4;
                };
            };
            _local_6 = (_local_6 + ((_local_7 - _local_6) * Math.random()));
            return (_local_6);
        }

        private function getAngle(_arg_1:Number, _arg_2:Number):Number
        {
            var _local_3:Number;
            if (_arg_1 == 0){
                if (_arg_2 > 0){
                    _local_3 = (Math.PI / 2);
                } else {
                    _local_3 = (-(Math.PI) / 2);
                };
            } else {
                if (_arg_2 == 0){
                    if (_arg_1 > 0){
                        _local_3 = 0;
                    } else {
                        _local_3 = Math.PI;
                    };
                } else {
                    _local_3 = Math.atan2(_arg_2, _arg_1);
                };
            };
            return (_local_3);
        }

        private function updateLifetime():Boolean
        {
            this.m_currentLife--;
            if (this.m_currentLife <= 0){
                return (true);
            };
            return (false);
        }

        protected function updateGravity():Boolean
        {
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_1:MapPosition = this.getMapPosition();
            if (this.m_isAngleXZ){
                _local_1.x = (_local_1.x + Math.ceil((this.m_speed * Math.cos(this.m_pAngle))));
                _local_1.y = (_local_1.y + 0);
                _local_5 = -(_local_1.z);
                _local_5 = (_local_5 + Math.ceil((this.m_speed * Math.sin(this.m_pAngle))));
                _local_1.z = -(_local_5);
                _local_2 = ((this.m_gravityX + (this.m_radialAccel * Math.cos(this.m_pAngle))) + (this.m_tangentialAccel * Math.cos(((Math.PI / 2) - this.m_pAngle))));
                _local_4 = ((this.m_gravityZ + (this.m_radialAccel * Math.sin(this.m_pAngle))) + (this.m_tangentialAccel * Math.sin(((Math.PI / 2) - this.m_pAngle))));
                _local_6 = ((this.m_speed * Math.cos(this.m_pAngle)) + _local_2);
                _local_7 = ((this.m_speed * Math.sin(this.m_pAngle)) + _local_4);
                this.m_speed = Math.sqrt(((_local_6 * _local_6) + (_local_7 * _local_7)));
                this.m_pAngle = this.getAngle(_local_6, _local_7);
                this.setMapPosition(_local_1);
            } else {
                _local_1.x = (_local_1.x + Math.ceil((this.m_speed * Math.cos(this.m_pAngle))));
                _local_1.z = (_local_1.z + 0);
                _local_1.y = (_local_1.y + Math.ceil((this.m_speed * Math.sin(this.m_pAngle))));
                _local_2 = ((this.m_gravityX + (this.m_radialAccel * Math.cos(this.m_pAngle))) + (this.m_tangentialAccel * Math.cos(((Math.PI / 2) - this.m_pAngle))));
                _local_3 = ((this.m_gravityY + (this.m_radialAccel * Math.sin(this.m_pAngle))) + (this.m_tangentialAccel * Math.sin(((Math.PI / 2) - this.m_pAngle))));
                _local_8 = ((this.m_speed * Math.cos(this.m_pAngle)) + _local_2);
                _local_9 = ((this.m_speed * Math.sin(this.m_pAngle)) + _local_3);
                this.m_speed = Math.sqrt(((_local_8 * _local_8) + (_local_9 * _local_9)));
                this.m_pAngle = this.getAngle(_local_8, _local_9);
                this.setMapPosition(_local_1);
            };
            return (false);
        }

        protected function updateAlpha():Boolean
        {
            var _local_1:Number = this.alpha;
            _local_1 = (_local_1 + this.m_alphaVar);
            if (_local_1 >= 1){
                _local_1 = 1;
            } else {
                if (_local_1 <= 0){
                    return (true);
                };
            };
            this.alpha = _local_1;
            return (false);
        }

        protected function updateCircle():Boolean
        {
            var _local_1:MapPosition = this.getMapPosition();
            if (this.m_isAngleXZ){
                _local_1.x = (this.m_centerX + (this.m_circleX * Math.cos(this.m_pAngle)));
                _local_1.z = (this.m_centerZ + (this.m_circleZ * Math.sin(this.m_pAngle)));
            } else {
                _local_1.x = (this.m_centerX + (this.m_circleX * Math.cos(this.m_pAngle)));
                _local_1.y = (this.m_centerY + (this.m_circleY * Math.sin(this.m_pAngle)));
            };
            this.m_circleX = (this.m_circleX + this.m_circleAcc);
            this.m_circleY = (this.m_circleY + this.m_circleAcc);
            this.m_circleZ = (this.m_circleZ + this.m_circleAcc);
            this.setMapPosition(_local_1);
            this.m_pAngle = (this.m_pAngle + this.m_circleAngleSpeed);
            return (false);
        }

        protected function updateidDead():Boolean
        {
            var _local_1:MapPosition = this.getMapPosition();
            if (this.m_isNeedDeadX != 0){
                if ((((this.m_isNeedDeadX == 1)) && ((_local_1.x <= this.m_deadX)))){
                    return (true);
                };
                if ((((this.m_isNeedDeadX == 2)) && ((_local_1.x >= this.m_deadX)))){
                    return (true);
                };
            };
            if (this.m_isNeedDeadY != 0){
                if ((((this.m_isNeedDeadY == 1)) && ((_local_1.y <= this.m_deadY)))){
                    return (true);
                };
                if ((((this.m_isNeedDeadY == 2)) && ((_local_1.y >= this.m_deadY)))){
                    return (true);
                };
            };
            if (this.m_isNeedDeadZ != 0){
                if ((((this.m_isNeedDeadZ == 1)) && ((_local_1.z <= this.m_deadZ)))){
                    return (true);
                };
                if ((((this.m_isNeedDeadZ == 2)) && ((_local_1.z >= this.m_deadZ)))){
                    return (true);
                };
            };
            return (false);
        }

        protected function updateOutGame():Boolean
        {
            var _local_1:MapPosition = this.getMapPosition();
            var _local_2:IScene = AICore.Runtime.currentScene;
            if (_local_2 != null){
                if ((((_local_1.x > _local_2.mapWidth)) || ((_local_1.x < -(_local_2.mapWidth))))){
                    return (true);
                };
                if ((((_local_1.y > _local_2.mapHeight)) || ((_local_1.y < -(_local_2.mapHeight))))){
                    return (true);
                };
                if ((((_local_1.z > _local_2.mapHeight)) || ((_local_1.z < -(_local_2.mapHeight))))){
                    return (true);
                };
            };
            return (false);
        }

        protected function updateRotation():Boolean
        {
            var _local_1:int;
            if (this.m_particleData.rotationMode == 1){
                _local_1 = (360 * this.m_pAngle);
                _local_1 = (_local_1 % 360);
                _local_1 = (_local_1 + 360);
                _local_1 = (_local_1 % 360);
                setRotation(_local_1);
            } else {
                if (this.m_particleData.rotationMode == 2){
                };
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_372()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_372 = " ParticleEffertElement" (String#13787)


