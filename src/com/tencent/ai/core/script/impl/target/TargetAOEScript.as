// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetAOEScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.status.ISpecialStatusManager;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.arg.script.CreateEffectArg;
    import com.tencent.ai.core.data.arg.script.CreateInteractArg;
    import com.tencent.ai.core.data.arg.script.TargetAOEScriptArg;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.status.impl.RemoveSS;
    import com.tencent.ai.core.utils.Rectangle3D;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1230;
    import __AS3__.vec.*;

    public class TargetAOEScript implements IScript 
    {

        private static var _SSM:ISpecialStatusManager;

        protected var m_target:ITargetHasSkill;
        protected var m_resArray:Vector.<InteractElement>;
        protected var m_handle_map:Dictionary;
        protected var m_effect_arg:CreateEffectArg;
        protected var m_interact_arg:CreateInteractArg;

        public function TargetAOEScript()
        {
            this.m_handle_map = new Dictionary();
            this.m_handle_map[TargetAOEScriptArg.AOET_EFFECT] = this.handleEffect;
            this.m_handle_map[TargetAOEScriptArg.AOET_INTERACT] = this.handleInteract;
            this.m_handle_map[TargetAOEScriptArg.AOET_SF] = this.handleSF;
            this.m_handle_map[TargetAOEScriptArg.AOET_SS] = this.handleSS;
            this.m_handle_map[TargetAOEScriptArg.AOET_REMOVE_SS] = this.handleRemoveSS;
        }

        protected function handleEffect(_arg_1:TargetAOEScriptArg, _arg_2:Vector.<InteractElement>):void
        {
            if (this.m_effect_arg == null){
                this.m_effect_arg = new CreateEffectArg();
            };
            this.m_effect_arg.effectID = _arg_1.id;
            this.m_effect_arg.bind = _arg_1.bind;
            this.m_effect_arg.offsetX = _arg_1.offsetX;
            this.m_effect_arg.offsetY = _arg_1.offsetY;
            this.m_effect_arg.offsetZ = _arg_1.offsetZ;
            this.m_effect_arg.offsetDeep = _arg_1.offsetDeep;
            var _local_3:int = (_arg_2.length - 1);
            while (_local_3 >= 0) {
                BaseActor(_arg_2[_local_3]).onScript(ScriptCmdDef.SC_CREATE_EFFECT, this.m_effect_arg);
                _local_3--;
            };
        }

        protected function handleInteract(_arg_1:TargetAOEScriptArg, _arg_2:Vector.<InteractElement>):void
        {
            if (this.m_interact_arg == null){
                this.m_interact_arg = new CreateInteractArg();
            };
            this.m_interact_arg.interactItemID = _arg_1.id;
            this.m_interact_arg.offsetX = _arg_1.offsetX;
            this.m_interact_arg.offsetY = _arg_1.offsetY;
            this.m_interact_arg.offsetZ = _arg_1.offsetZ;
            this.m_interact_arg.offsetDeep = _arg_1.offsetDeep;
            this.m_interact_arg.bindGroupID = this.m_target.target.groupID;
            this.m_interact_arg.bindSkillGroup = this.m_target.getSkillModel().group;
            this.m_interact_arg.bindModel = this.m_target.model;
            var _local_3:int = (_arg_2.length - 1);
            while (_local_3 >= 0) {
                BaseActor(_arg_2[_local_3]).onScript(ScriptCmdDef.SC_CREATE_INTERACT, this.m_interact_arg);
                _local_3--;
            };
        }

        protected function handleSF(_arg_1:TargetAOEScriptArg, _arg_2:Vector.<InteractElement>):void
        {
            var _local_3:int = (_arg_2.length - 1);
            var _local_4:Array = [_arg_1.id];
            var _local_5:Object = {"source":this.m_target.target};
            while (_local_3 >= 0) {
                BaseActor(_arg_2[_local_3]).applySFs(_local_4, _local_5);
                _local_3--;
            };
        }

        protected function handleSS(_arg_1:TargetAOEScriptArg, _arg_2:Vector.<InteractElement>):void
        {
            if (_SSM == null){
                _SSM = AICore.combatSystem.getSpecialStatusManager();
            };
            var _local_3:int = (_arg_2.length - 1);
            var _local_4:int = _arg_1.id;
            var _local_5:Object = {"source":this.m_target.target};
            while (_local_3 >= 0) {
                _SSM.applyStatus(BaseActor(_arg_2[_local_3]), _local_4, null, true, _local_5);
                _local_3--;
            };
        }

        protected function handleRemoveSS(_arg_1:TargetAOEScriptArg, _arg_2:Vector.<InteractElement>):void
        {
            if (_SSM == null){
                _SSM = AICore.combatSystem.getSpecialStatusManager();
            };
            var _local_3:int = (_arg_2.length - 1);
            RemoveSS.INSTANCE.removeSSType = _arg_1.id;
            while (_local_3 >= 0) {
                BaseActor(_arg_2[_local_3]).addStatus(RemoveSS.INSTANCE);
                _local_3--;
            };
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_6:Array;
            var _local_11:Rectangle3D;
            var _local_13:int;
            var _local_14:Function;
            var _local_3:TargetAOEScriptArg = TargetAOEScriptArg(_arg_2);
            var _local_4:ICombatScene = ICombatScene(this.m_target.scene);
            var _local_5:HasActionElement = this.m_target.target;
            if (this.m_resArray == null){
                this.m_resArray = new Vector.<InteractElement>();
            };
            var _local_7:int = _local_5.groupID;
            if (_local_3.targetGroup == 0){
                _local_6 = [_local_7];
            } else {
                _local_6 = ElementGroupDef.IGNORE_GID_MAP[_local_7];
            };
            var _local_8:int = _local_5.getDirection();
            var _local_9:int = (_local_5.mapX + (_local_3.searchOffsetX * _local_8));
            var _local_10:int = (_local_5.mapZ + _local_3.searchOffsetZ);
            if (_local_8 == Direction.RIGHT){
                _local_11 = new Rectangle3D(_local_9, 0, _local_10, _local_3.searchX, _local_3.searchY, _local_3.searchZ);
            } else {
                _local_11 = new Rectangle3D((_local_9 - _local_3.searchX), 0, _local_10, _local_3.searchX, _local_3.searchY, _local_3.searchZ);
            };
            Battle.Current.findElementsInRectangle(this.m_resArray, _local_11, _local_6, ElementType.ET_INTERACT);
            var _local_12:int = this.m_resArray.length;
            if (_local_12 != 0){
                _local_13 = _local_3.limitCount;
                if (((!((_local_13 == 0))) && ((_local_12 > _local_13)))){
                    this.m_resArray.length = _local_13;
                };
                _local_14 = this.m_handle_map[_local_3.type];
                if (_local_14 != null){
                    (_local_14(_local_3, this.m_resArray));
                };
                this.m_resArray.length = 0;
            };
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITargetHasSkill(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_AOE);
        }

        public /*  ©init. */ function _SafeStr_1230()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1230 = " TargetAOEScript" (String#14690)


