// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CreateParticleScriptArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.effect.impl.EmitterElement;
    import com.tencent.ai.core.data.TingeInfo;
    import  ©init._SafeStr_130;

    public class CreateParticleScriptArg extends ScriptArg 
    {

        public var emitterMode:int = 0;
        public var effectID:int = 0;
        public var particleInfoID:int = 1;
        public var sourceMode:int = 2;
        public var framesIDs:Array;
        public var maxParticleNumber:int = 10;
        public var minParticleNumber:int = 5;
        public var frameTime:int = 30;
        public var frameVar:uint = 0;
        public var rotation:int = 0;
        public var shootTime:int = 1;
        public var bind:Boolean = false;
        public var emitterBind:Boolean = false;
        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;
        public var offsetDeep:int = -1;
        public var startFrames:Array;
        public var target:ITarget = null;
        public var emitterParents:EmitterElement = null;
        public var clear:Boolean = false;
        public var dir:int = 0;
        public var fRotation:Boolean = false;
        public var tingeInfo:TingeInfo;
        public var useWeaponArg:Boolean = false;
        public var weaponArgID:int = 0;
        public var reflashDeep:Boolean = false;

        public function CreateParticleScriptArg()
        {
            this.framesIDs = new Array();
            this.startFrames = [];
            super();
        }

        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.emitterMode = int(_arg_1.@emitterMode);
            this.effectID = int(_arg_1.@effectID);
            this.particleInfoID = int(_arg_1.@particleInfoID);
            this.sourceMode = int(_arg_1.@sourceMode);
            var _local_2:String = _arg_1.@framesIDs.toString();
            this.framesIDs.splice(0);
            var _local_3:Array = _local_2.split(",");
            var _local_4:int;
            while (_local_4 < _local_3.length) {
                this.framesIDs.push(int(_local_3[_local_4]));
                _local_4++;
            };
            this.maxParticleNumber = int(_arg_1.@maxParticleNumber);
            this.minParticleNumber = int(_arg_1.@minParticleNumber);
            this.frameTime = int(_arg_1.@frameTime);
            this.frameVar = int(_arg_1.@frameVar);
            if (_arg_1.hasOwnProperty("@rotation")){
                this.rotation = int(_arg_1.@rotation);
            };
            this.shootTime = int(_arg_1.@shootTime);
            this.bind = !((int(_arg_1.@bind) == 0));
            this.emitterBind = !((int(_arg_1.@emitterBind) == 0));
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetY = int(_arg_1.@offsetY);
            this.offsetZ = int(_arg_1.@offsetZ);
            this.offsetDeep = int(_arg_1.@offsetDeep);
            this.clear = (int(_arg_1.@clear) == 1);
            if (_arg_1.hasOwnProperty("@dir")){
                this.dir = int(_arg_1.@dir);
            };
            if (_arg_1.hasOwnProperty("@fRotation")){
                this.fRotation = (int(_arg_1.@fRotation) == 1);
            };
            var _local_5:XML = _arg_1.Tinge[0];
            if (_local_5 != null){
                this.tingeInfo = new TingeInfo();
                this.tingeInfo.decode(_local_5);
            };
            this.useWeaponArg = (int(_arg_1.@useWeaponArg) == 1);
            this.weaponArgID = int(_arg_1.@weaponArgID);
            this.reflashDeep = (int(_arg_1.@rDeep) == 1);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@emitterMode = this.emitterMode;
            _local_1.@effectID = this.effectID;
            _local_1.@particleInfoID = this.particleInfoID;
            _local_1.@sourceMode = this.sourceMode;
            var _local_2 = "";
            var _local_3:int;
            while (_local_3 < this.framesIDs.length) {
                _local_2 = (_local_2 + (this.framesIDs[_local_3] + ","));
                _local_3++;
            };
            _local_2 = _local_2.substring(0, (_local_2.length - 1));
            _local_1.@framesIDs = _local_2;
            _local_1.@maxParticleNumber = this.maxParticleNumber;
            _local_1.@minParticleNumber = this.minParticleNumber;
            _local_1.@frameTime = this.frameTime;
            _local_1.@frameVar = this.frameVar;
            if (this.fRotation){
                _local_1.@fRotation = 1;
            };
            _local_1.@shootTime = this.shootTime;
            _local_1.@bind = ((this.bind) ? (1) : 0);
            _local_1.@emitterBind = ((this.emitterBind) ? 1 : 0);
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetY = this.offsetY;
            _local_1.@offsetZ = this.offsetZ;
            _local_1.@offsetDeep = this.offsetDeep;
            _local_1.@clear = ((this.clear) ? 1 : 0);
            _local_1.@dir = this.dir;
            if (this.tingeInfo != null){
                _local_1.appendChild(this.tingeInfo.encode());
            };
            _local_1.@rotation = this.rotation;
            _local_1.@useWeaponArg = ((this.useWeaponArg) ? 1 : 0);
            _local_1.@weaponArgID = this.weaponArgID;
            _local_1.@rDeep = ((this.reflashDeep) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CreateParticleScriptArg = (super.clone() as CreateParticleScriptArg);
            _local_1.emitterMode = this.emitterMode;
            _local_1.sourceMode = this.sourceMode;
            _local_1.effectID = this.effectID;
            _local_1.particleInfoID = this.particleInfoID;
            _local_1.minParticleNumber = this.minParticleNumber;
            _local_1.maxParticleNumber = this.maxParticleNumber;
            _local_1.frameTime = this.frameTime;
            _local_1.frameVar = this.frameVar;
            _local_1.shootTime = this.shootTime;
            _local_1.argCmd = this.argCmd;
            _local_1.argStr = this.argStr;
            _local_1.bind = this.bind;
            _local_1.emitterBind = this.emitterBind;
            _local_1.clear = this.clear;
            _local_1.dir = this.dir;
            _local_1.fRotation = this.fRotation;
            _local_1.offsetDeep = this.offsetDeep;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetY = this.offsetY;
            _local_1.offsetZ = this.offsetZ;
            _local_1.reflashDeep = this.reflashDeep;
            _local_1.rotation = this.rotation;
            _local_1.tingeInfo = this.tingeInfo;
            _local_1.useWeaponArg = this.useWeaponArg;
            _local_1.weaponArgID = this.weaponArgID;
            _local_1.tingeInfo = (((this.tingeInfo)!=null) ? this.tingeInfo.clone() : null);
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_130()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_130 = " CreateParticleScriptArg" (String#16754)


