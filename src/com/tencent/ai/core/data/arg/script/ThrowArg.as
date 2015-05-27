// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.ThrowArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.actor.model.ActorModel;
    import  ©init._SafeStr_170;

    public class ThrowArg extends ScriptArg 
    {

        public var vx:int = 0;
        public var vy:int = 0;
        public var dirValue:int = 1;
        public var offsetX:int = 0;
        public var offsetZ:int = 0;
        public var offsetY:int = 0;
        public var useMotionID2:Boolean = false;
        public var useLandDmg:Boolean = false;
        public var deliver:Boolean = false;
        public var bindGoupID:int = -1;
        public var bindAttackActor:InteractElement = null;
        public var bindSkill:SkillInfo = null;
        public var bindModel:ActorModel = null;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.vx = int(_arg_1.@x);
            this.vy = int(_arg_1.@y);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetZ = int(_arg_1.@offsetZ);
            this.offsetY = int(_arg_1.@offsetY);
            this.useMotionID2 = (int(_arg_1.@useMotionID2) == 1);
            this.useLandDmg = (int(_arg_1.@useLandDmg) == 1);
            this.deliver = (int(_arg_1.@deliver) == 1);
            this.dirValue = int(_arg_1.@dirValue);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@x = this.vx;
            _local_1.@y = this.vy;
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetZ = this.offsetZ;
            _local_1.@offsetY = this.offsetY;
            _local_1.@useMotionID2 = ((this.useMotionID2) ? (1) : 0);
            _local_1.@useLandDmg = ((this.useLandDmg) ? 1 : 0);
            _local_1.@deliver = ((this.deliver) ? 1 : 0);
            _local_1.@dirValue = this.dirValue;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:ThrowArg = (super.clone() as ThrowArg);
            _local_1.vx = this.vx;
            _local_1.vy = this.vy;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetZ = this.offsetZ;
            _local_1.offsetY = this.offsetY;
            _local_1.useMotionID2 = this.useMotionID2;
            _local_1.useLandDmg = this.useLandDmg;
            _local_1.dirValue = this.dirValue;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_170()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_170 = " ThrowArg" (String#14696)


