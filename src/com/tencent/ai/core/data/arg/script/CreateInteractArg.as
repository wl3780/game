// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.CreateInteractArg

package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.actor.model.ActorModel;
    import  ©init._SafeStr_128;

    public class CreateInteractArg extends ScriptArg 
    {

        public var id:int = 0;
        public var interactItemID:int = 0;
        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var offsetZ:int = 0;
        public var offsetDeep:int = 0;
        public var groupID:int = 0;
        public var dir:int = 0;
        public var delayFrames:int = 0;
        public var rotation:int = 0;
        public var rRotation:int = 0;
        public var tingeInfo:TingeInfo;
        public var bfollowTarget:Boolean = false;
        public var bRelativeScene:Boolean = false;
        public var bDisappearOnDead:Boolean = false;
        public var bDisappearOnOwnerActionEnd:Boolean = false;
        public var useWeaponArg:Boolean = false;
        public var weaponArgID:int = 0;
        public var reflashDeep:Boolean = false;
        public var bindGroupID:int = -1;
        public var bindSkillGroup:SkillGroup = null;
        public var bindModel:ActorModel = null;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.id = int(_arg_1.@iid);
            this.interactItemID = int(_arg_1.@id);
            this.offsetX = int(_arg_1.@x);
            this.offsetY = int(_arg_1.@y);
            this.offsetZ = int(_arg_1.@z);
            this.offsetDeep = int(_arg_1.@deep);
            this.groupID = int(_arg_1.@groupID);
            this.delayFrames = int(_arg_1.@delayFrames);
            this.rotation = int(_arg_1.@rotation);
            this.rRotation = int(_arg_1.@rRotation);
            this.bfollowTarget = (int(_arg_1.@follow) == 1);
            this.bRelativeScene = (int(_arg_1.@bRelativeScene) == 1);
            this.bDisappearOnDead = (int(_arg_1.@bDisappearOnDead) == 1);
            this.bDisappearOnOwnerActionEnd = (int(_arg_1.@bDisappearOnOwnerActionEnd) == 1);
            if (_arg_1.hasOwnProperty("@dir")){
                this.dir = _arg_1.@dir;
            };
            var _local_2:XML = _arg_1.Tinge[0];
            if (_local_2 != null){
                this.tingeInfo = new TingeInfo();
                this.tingeInfo.decode(_local_2);
            };
            this.useWeaponArg = (int(_arg_1.@useWeaponArg) == 1);
            this.weaponArgID = int(_arg_1.@weaponArgID);
            this.reflashDeep = (int(_arg_1.@rDeep) == 1);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@iid = this.id;
            _local_1.@id = this.interactItemID;
            _local_1.@x = this.offsetX;
            _local_1.@y = this.offsetY;
            _local_1.@z = this.offsetZ;
            _local_1.@deep = this.offsetDeep;
            _local_1.@groupID = this.groupID;
            _local_1.@dir = this.dir;
            _local_1.@delayFrames = this.delayFrames;
            _local_1.@rotation = this.rotation;
            _local_1.@rRotation = this.rRotation;
            _local_1.@follow = ((this.bfollowTarget) ? 1 : 0);
            _local_1.@bRelativeScene = ((this.bRelativeScene) ? 1 : 0);
            _local_1.@bDisappearOnDead = ((this.bDisappearOnDead) ? 1 : 0);
            _local_1.@bDisappearOnOwnerActionEnd = ((this.bDisappearOnOwnerActionEnd) ? 1 : 0);
            if (this.tingeInfo != null){
                _local_1.appendChild(this.tingeInfo.encode());
            };
            _local_1.@useWeaponArg = ((this.useWeaponArg) ? 1 : 0);
            _local_1.@weaponArgID = this.weaponArgID;
            _local_1.@rDeep = ((this.reflashDeep) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:CreateInteractArg = (super.clone() as CreateInteractArg);
            _local_1.id = this.id;
            _local_1.interactItemID = this.interactItemID;
            _local_1.offsetX = this.offsetX;
            _local_1.offsetY = this.offsetY;
            _local_1.offsetZ = this.offsetZ;
            _local_1.offsetDeep = this.offsetDeep;
            _local_1.groupID = this.groupID;
            _local_1.dir = this.dir;
            _local_1.delayFrames = this.delayFrames;
            _local_1.rotation = this.rotation;
            _local_1.rRotation = this.rRotation;
            _local_1.tingeInfo = (((this.tingeInfo)!=null) ? this.tingeInfo.clone() : null);
            _local_1.useWeaponArg = this.useWeaponArg;
            _local_1.weaponArgID = this.weaponArgID;
            _local_1.reflashDeep = this.reflashDeep;
            _local_1.bfollowTarget = this.bfollowTarget;
            _local_1.bRelativeScene = this.bRelativeScene;
            _local_1.bindGroupID = this.bindGroupID;
            _local_1.bindSkillGroup = this.bindSkillGroup;
            _local_1.bindModel = this.bindModel;
            _local_1.bDisappearOnDead = this.bDisappearOnDead;
            _local_1.bDisappearOnOwnerActionEnd = this.bDisappearOnOwnerActionEnd;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_128()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_128 = " CreateInteractArg" (String#14636)


