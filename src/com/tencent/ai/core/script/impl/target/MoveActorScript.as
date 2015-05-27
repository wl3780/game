// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.MoveActorScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.script.ITarget;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.element.InteractElement;
    import com.tencent.ai.core.utils.Rectangle3D;
    import com.tencent.ai.core.data.arg.script.MoveActorScriptArg;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.combat.ICombatScene;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.enum.Direction;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.FrameData;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.monster.BaseMonster;
    import com.tencent.ai.core.AICore;
    import  ©init._SafeStr_1224;
    import __AS3__.vec.*;

    public class MoveActorScript implements IScript, ILogicObject 
    {

        protected var m_target:ITarget;
        protected var m_resArray:Vector.<InteractElement>;
        protected var m_rect:Rectangle3D;
        protected var m_ignoreGIDs:Array;
        protected var m_vx:int;
        protected var m_vy:int;
        protected var m_vz:int;
        protected var m_times:int;
        private var _moveType:int;
        private var _aoeArg:MoveActorScriptArg;


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
            var _local_7:int;
            var _local_8:int;
            this._aoeArg = (_arg_2 as MoveActorScriptArg);
            this._moveType = this._aoeArg.moveType;
            var _local_3:HasActionElement = (this.m_target.target as HasActionElement);
            var _local_4:ICombatScene = ICombatScene(this.m_target.scene);
            if (this.m_resArray == null){
                this.m_resArray = new Vector.<InteractElement>();
            };
            var _local_5:int = _local_3.groupID;
            if (this._aoeArg.targetGroup == 0){
                this.m_ignoreGIDs = [_local_5];
            } else {
                this.m_ignoreGIDs = ElementGroupDef.IGNORE_GID_MAP[_local_5];
            };
            var _local_6:int = _local_3.getDirection();
            if (this._moveType == MoveActorScriptArg.MOVE_TYPE_TRANS_CHAIN){
                _local_7 = (_local_3.mapX + (this._aoeArg.searchOffsetX * _local_6));
                _local_8 = (_local_3.mapZ + this._aoeArg.searchOffsetZ);
                if (_local_6 == Direction.RIGHT){
                    this.m_rect = new Rectangle3D(_local_7, 0, _local_8, this._aoeArg.searchX, this._aoeArg.searchY, this._aoeArg.searchZ);
                } else {
                    this.m_rect = new Rectangle3D((_local_7 - this._aoeArg.searchX), 0, _local_8, this._aoeArg.searchX, this._aoeArg.searchY, this._aoeArg.searchZ);
                };
                this.m_vx = (this._aoeArg.vx * _local_6);
            } else {
                if (this._moveType == MoveActorScriptArg.MOVE_TYPE_ADSORB){
                    _local_7 = _local_3.mapX;
                    _local_8 = _local_3.mapZ;
                    this.m_rect = new Rectangle3D((_local_7 - this._aoeArg.searchX), 0, (_local_8 - this._aoeArg.searchZ), (this._aoeArg.searchX * 2), this._aoeArg.searchY, (this._aoeArg.searchZ * 2));
                    this.m_vx = this._aoeArg.vx;
                };
            };
            this.m_vy = this._aoeArg.vy;
            this.m_vz = this._aoeArg.vz;
            this.m_times = this._aoeArg.times;
            Battle.Current.addLogicObject(this);
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_MOVE_ACTOR);
        }

        public function stop():void
        {
        }

        public function setFrameData(_arg_1:FrameData):void
        {
        }

        public function getFrameData():FrameData
        {
            return (null);
        }

        public function getCurrentFrameIndex():int
        {
            return (-1);
        }

        public function enterframe(_arg_1:int):void
        {
            var _local_4:BaseActor;
            if (this._moveType == MoveActorScriptArg.MOVE_TYPE_ADSORB){
                this.m_rect = new Rectangle3D((this.m_target.target.mapX - this._aoeArg.searchX), 0, (this.m_target.target.mapZ - this._aoeArg.searchZ), (this._aoeArg.searchX * 2), this._aoeArg.searchY, (this._aoeArg.searchZ * 2));
            };
            Battle.Current.findElementsInRectangle(this.m_resArray, this.m_rect, this.m_ignoreGIDs, ElementType.ET_INTERACT);
            var _local_2:int = this.m_resArray.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = (this.m_resArray[_local_3] as BaseActor);
                if (this._moveType == MoveActorScriptArg.MOVE_TYPE_TRANS_CHAIN){
                    if ((((((_local_4 is BaseMonster)) && (_local_4.getModel()))) && (!(_local_4.getModel().canBeCaught)))){
                        _local_4 = null;
                    };
                } else {
                    if (this._moveType == MoveActorScriptArg.MOVE_TYPE_ADSORB){
                        this.m_vx = (Math.abs(this.m_vx) * (((_local_4.mapX)>this.m_target.target.mapX) ? -1 : 1));
                        this.m_vz = (Math.abs(this.m_vz) * (((_local_4.mapZ)>this.m_target.target.mapZ) ? -1 : 1));
                        if ((((((_local_4 is BaseMonster)) && (_local_4.getModel()))) && (!(_local_4.getModel().canBeCaught)))){
                            _local_4 = null;
                        };
                    };
                };
                if (((_local_4) && (AICore.Runtime.currentScene.isWalkable((_local_4.mapX + this.m_vx), (_local_4.mapZ + this.m_vz))))){
                    _local_4.setMapXZY((_local_4.mapX + this.m_vx), (_local_4.mapZ + this.m_vz), (_local_4.mapY + this.m_vy));
                };
                _local_3++;
            };
            this.m_resArray.length = 0;
            if (--this.m_times < 0){
                Battle.Current.removeLogicObject(this);
            };
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public /*  ©init. */ function _SafeStr_1224()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1224 = " MoveActorScript" (String#17498)


