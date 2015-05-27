// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.FoundFlashScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.utils.Rectangle3D;
    import com.tencent.ai.core.data.arg.script.SearchElementScriptArg;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1220;
    import __AS3__.vec.*;

    public class FoundFlashScript extends VirgationScript implements IScript 
    {

        protected var m_resArray:Vector.<InteractElement>;


        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_6:Array;
            var _local_12:Rectangle3D;
            var _local_15:int;
            var _local_16:int;
            var _local_17:int;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_3:SearchElementScriptArg = SearchElementScriptArg(_arg_2);
            var _local_4:ICombatScene = ICombatScene(m_target.scene);
            var _local_5:HasActionElement = m_target.target;
            if (this.m_resArray == null){
                this.m_resArray = new Vector.<InteractElement>();
            };
            var _local_7:int = _local_5.groupID;
            var _local_8:int = _local_3.targetGroup;
            if (_local_8 == 0){
                _local_6 = [_local_7];
            } else {
                _local_6 = ElementGroupDef.IGNORE_GID_MAP[_local_7];
            };
            var _local_9:int = _local_5.getDirection();
            var _local_10:int = (_local_5.mapX + (_local_3.searchOffsetX * _local_9));
            var _local_11:int = (_local_5.mapZ + _local_3.searchOffsetZ);
            if (_local_9 == Direction.RIGHT){
                _local_12 = new Rectangle3D(_local_10, 0, _local_11, _local_3.searchX, 0x1000, _local_3.searchZ);
            } else {
                _local_12 = new Rectangle3D((_local_10 - _local_3.searchX), 0, _local_11, _local_3.searchX, 0x1000, _local_3.searchZ);
            };
            var _local_13:InteractElement;
            var _local_14:int = _local_3.searchType;
            if (_local_14 == 2){
                _local_13 = ITargetHasSkill(m_target).getAttackDelegate().currentAim;
            } else {
                if (_local_3.searchType == 3){
                    _local_13 = BaseActor(m_target.target).getMaster();
                };
            };
            if (_local_14 == 1){
                _local_13 = Battle.Current.findElementNearestInRectangle(_local_10, 0, _local_11, _local_12, _local_6, ElementType.ET_INTERACT);
            } else {
                if ((((_local_13 == null)) && (!((_local_14 == 3))))){
                    Battle.Current.findElementsInRectangle(this.m_resArray, _local_12, _local_6, ElementType.ET_INTERACT);
                    _local_15 = this.m_resArray.length;
                    if (_local_15 > 0){
                        _local_16 = (DEFINE.RANDOM_FLOAT() * _local_15);
                        _local_13 = this.m_resArray[_local_16];
                        this.m_resArray.length = 0;
                    };
                };
            };
            if (_local_13 != null){
                _local_17 = _local_13.getDirection();
                _local_18 = (_local_13.mapX + (_local_3.offsetX * _local_17));
                _local_19 = (_local_13.mapZ + _local_3.offsetZ);
                _local_20 = (((_local_3.useElementY) ? _local_13.mapY : 0) + _local_3.offsetY);
                if (!_local_4.isWalkable(_local_18, _local_19)){
                    _local_18 = _local_13.mapX;
                    _local_19 = _local_13.mapZ;
                };
                _local_5.setMapXZY(_local_18, _local_19, _local_20);
                _local_5.setDirection((_local_17 * _local_3.targetDir));
                execVirgation(_local_3.argCmd, int(_local_3.argStr));
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_FOUND_FLASH);
        }

        public /*  ©init. */ function _SafeStr_1220()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1220 = " FoundFlashScript" (String#16799)


