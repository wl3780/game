// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CreateEffectArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.TingeInfo;
    import  ©init._SafeStr_127;

    public class CreateEffectArg extends ScriptArg 
    {

        public var clear:Boolean = false;
        public var effectID:int = 0;
        public var motionID:int = 0;
        public var bind:Boolean = false;
        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;
        public var offsetDeep:int = 0;
        public var dir:int = 0;
        public var scaleX:Number = 1;
        public var scaleY:Number = 1;
        public var rotation:int = 0;
        public var fRotation:Boolean = false;
        public var tingeInfo:TingeInfo;
        public var useWeaponArg:Boolean = false;
        public var weaponArgID:int = 0;
        public var reflashDeep:Boolean = false;
        public var effectType:int;
        public var otherArg:Object;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.clear = (int(_arg_1.@clear) == 1);
            this.effectID = int(_arg_1.@id);
            this.motionID = int(_arg_1.@motionID);
            this.offsetX = int(_arg_1.@x);
            this.offsetY = int(_arg_1.@y);
            this.offsetZ = int(_arg_1.@z);
            this.offsetDeep = int(_arg_1.@deep);
            this.bind = !((int(_arg_1.@bind) == 0));
            if (_arg_1.hasOwnProperty("@dir")){
                this.dir = int(_arg_1.@dir);
            };
            if (_arg_1.hasOwnProperty("@scaleX")){
                this.scaleX = Number(_arg_1.@scaleX);
                this.scaleY = Number(_arg_1.@scaleY);
            };
            if (_arg_1.hasOwnProperty("@rotation")){
                this.rotation = int(_arg_1.@rotation);
            };
            if (_arg_1.hasOwnProperty("@fRotation")){
                this.fRotation = (int(_arg_1.@fRotation) == 1);
            };
            var _local_2:XML = _arg_1.Tinge[0];
            if (_local_2 != null){
                this.tingeInfo = new TingeInfo();
                this.tingeInfo.decode(_local_2);
            };
            this.useWeaponArg = (int(_arg_1.@useWeaponArg) == 1);
            this.weaponArgID = int(_arg_1.@weaponArgID);
            this.reflashDeep = (int(_arg_1.@rDeep) == 1);
            this.effectType = int(_arg_1.@effectType);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@clear = ((this.clear) ? 1 : 0);
            _local_1.@id = this.effectID;
            _local_1.@motionID = this.motionID;
            _local_1.@x = this.offsetX;
            _local_1.@y = this.offsetY;
            _local_1.@z = this.offsetZ;
            _local_1.@deep = this.offsetDeep;
            _local_1.@bind = ((this.bind) ? 1 : 0);
            _local_1.@dir = this.dir;
            _local_1.@scaleX = this.scaleX;
            _local_1.@scaleY = this.scaleY;
            _local_1.@rotation = this.rotation;
            if (this.fRotation){
                _local_1.@fRotation = 1;
            };
            if (this.tingeInfo != null){
                _local_1.appendChild(this.tingeInfo.encode());
            };
            _local_1.@useWeaponArg = ((this.useWeaponArg) ? 1 : 0);
            _local_1.@weaponArgID = this.weaponArgID;
            _local_1.@rDeep = ((this.reflashDeep) ? 1 : 0);
            _local_1.@effectType = this.effectType;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CreateEffectArg = (super.clone() as CreateEffectArg);
            _local_1.clear = this.clear;
            _local_1.effectID = this.effectID;
            _local_1.motionID = this.motionID;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetY = this.offsetY;
            _local_1.offsetZ = this.offsetZ;
            _local_1.bind = this.bind;
            _local_1.dir = this.dir;
            _local_1.scaleX = this.scaleX;
            _local_1.scaleY = this.scaleY;
            _local_1.rotation = this.rotation;
            _local_1.fRotation = this.fRotation;
            _local_1.tingeInfo = (((this.tingeInfo)!=null) ? this.tingeInfo.clone() : null);
            _local_1.useWeaponArg = this.useWeaponArg;
            _local_1.weaponArgID = this.weaponArgID;
            _local_1.reflashDeep = this.reflashDeep;
            _local_1.effectType = this.effectType;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_127()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_127 = " CreateEffectArg" (String#16181)


