// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetSearchMaxYScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.utils.Rectangle3D;
    import com.tencent.ai.core.data.arg.script.SearchMaxYArg;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.utils.RectArea;
    import  ©init._SafeStr_1243;

    public class TargetSearchMaxYScript implements IScript 
    {

        protected var m_target:ITargetHasSkill;


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
            return (ScriptCmdDef.SC_TARGET_SEARCH_MAX_Y);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_6:Array;
            var _local_11:Rectangle3D;
            var _local_14:Array;
            var _local_3:SearchMaxYArg = SearchMaxYArg(_arg_2);
            var _local_4:ICombatScene = ICombatScene(this.m_target.scene);
            var _local_5:HasActionElement = this.m_target.target;
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
                _local_11 = new Rectangle3D(_local_9, 0, _local_10, _local_3.searchX, 0x1000, _local_3.searchZ);
            } else {
                _local_11 = new Rectangle3D((_local_9 - _local_3.searchX), 0, _local_10, _local_3.searchX, 0x1000, _local_3.searchZ);
            };
            var _local_12:InteractElement = Battle.Current.findElementNearestInRectangle(_local_9, 0, _local_10, _local_11, _local_6, ElementType.ET_INTERACT);
            var _local_13:Variable = this.m_target.getVariable(_local_3.saveVIndex, true);
            if (_local_12 == null){
                _local_13.value = 0x1000;
            } else {
                _local_14 = _local_12.getHurtRects();
                if ((((_local_14 == null)) || ((_local_14.length == 0)))){
                    _local_13.value = 0x1000;
                } else {
                    _local_13.value = (RectArea(_local_14[0]).height + _local_12.mapY);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1243()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1243 = " TargetSearchMaxYScript" (String#16412)


