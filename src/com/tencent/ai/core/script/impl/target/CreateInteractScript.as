// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.CreateInteractScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.InteractItemInfo;
    import com.tencent.ai.core.enum.WeaponArgDef;
    import com.tencent.ai.core.interact.BaseInteractItem;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.data.arg.script.CreateInteractArg;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.SceneLayerDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1218;

    public class CreateInteractScript implements IScript 
    {

        protected var m_target:ITarget;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_6:InteractItemInfo;
            var _local_12:WeaponArgDef;
            var _local_13:BaseInteractItem;
            var _local_14:ITargetHasSkill;
            var _local_15:SkillModel;
            var _local_3:CreateInteractArg = (_arg_2 as CreateInteractArg);
            if (_local_3.useWeaponArg){
                _local_12 = WeaponArgDef.ARG_DEF[this.m_target.model.weapon_create_id];
                if (_local_12 != null){
                    _local_3 = _local_12.interactScriptArgs[_local_3.weaponArgID];
                };
            };
            var _local_4:InteractElement = (this.m_target.target as InteractElement);
            var _local_5:MapPosition = _local_4.getMapPosition();
            _local_6 = new InteractItemInfo();
            _local_6.interactItemID = _local_3.interactItemID;
            _local_6.groupID = (((_local_3.groupID == -1)) ? _local_4.groupID : _local_3.groupID);
            _local_6.amityGroupID = (((_local_3.bindGroupID == -1)) ? _local_4.groupID : _local_3.bindGroupID);
            var _local_7:int = _local_3.dir;
            var _local_8:int = (((_local_7 == 0)) ? _local_4.getDirection() : (((_local_7 == 2)) ? (_local_4.getDirection() * -1) : _local_7));
            _local_6.direction = _local_8;
            _local_6.location = _local_5;
            _local_6.delayFrames = _local_3.delayFrames;
            _local_6.rotation = _local_3.rotation;
            _local_6.rRotation = _local_3.rRotation;
            _local_6.tingeInfo = _local_3.tingeInfo;
            _local_6.bfollowTarget = _local_3.bfollowTarget;
            _local_6.owner = this.m_target.target;
            _local_6.disappearOnOwnerDead = _local_3.bDisappearOnDead;
            _local_6.disappearOnOwnerActionEnd = _local_3.bDisappearOnOwnerActionEnd;
            if (((_local_6.bfollowTarget) || (_local_3.bRelativeScene))){
                _local_5.x = _local_3.offsetX;
                _local_5.y = _local_3.offsetY;
                _local_5.z = _local_3.offsetZ;
                _local_5.deepOffset = _local_3.offsetDeep;
            } else {
                _local_5.x = (_local_5.x + (_local_3.offsetX * _local_8));
                _local_5.y = (_local_5.y + _local_3.offsetY);
                _local_5.z = (_local_5.z + _local_3.offsetZ);
                _local_5.deepOffset = _local_3.offsetDeep;
            };
            var _local_9:SkillGroup = _local_3.bindSkillGroup;
            var _local_10:ActorModel = _local_3.bindModel;
            var _local_11:int;
            if (_local_9 == null){
                _local_10 = this.m_target.model;
                _local_13 = (_local_4 as BaseInteractItem);
                if (_local_13 != null){
                    _local_11 = _local_13.getInteractItemInfo().attachSkillIndex;
                    _local_9 = _local_13.getInteractItemInfo().attachSkillGroup;
                    _local_6.attachSkillInfo = _local_13.getInteractItemInfo().attachSkillInfo;
                    _local_10 = _local_13.getInteractItemInfo().attachActorModel;
                } else {
                    _local_14 = (this.m_target as ITargetHasSkill);
                    if (_local_14 != null){
                        _local_15 = _local_14.getSkillModel();
                        if (_local_15 != null){
                            _local_9 = _local_15.group;
                            _local_11 = _local_15.getCurrentIndex();
                            _local_6.attachSkillInfo = _local_9.skillInfos[_local_11];
                        };
                    };
                };
            };
            _local_6.attachSkillIndex = _local_11;
            _local_6.attachSkillGroup = _local_9;
            _local_6.attachActorModel = _local_10;
            this.m_target.scene.createElement(ElementType.ET_INTERACT, _local_6);
            if (_local_3.reflashDeep){
                this.m_target.scene.getLayer(SceneLayerDef.LAYER_GROUND).sort();
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_CREATE_INTERACT);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1218()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1218 = " CreateInteractScript" (String#13652)


