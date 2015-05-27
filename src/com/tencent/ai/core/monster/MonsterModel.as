// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.MonsterModel

package com.tencent.ai.core.monster
{
    import com.tencent.ai.core.actor.model.ActorModel;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.events.MonsterModelEvent;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.ActionState;
    import com.tencent.ai.core.data.ActionInfo;
    import com.tencent.ai.core.enum.ActionType;
    import com.tencent.ai.core.data.SkillGroup;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.MonsterAISkillParam;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.actor.model.SkillModel;
    import com.tencent.ai.core.data.AttributeInfo;
    import  ©init._SafeStr_789;

    public class MonsterModel extends ActorModel 
    {

        private static var _ACTIONINFOS:Dictionary;

        public var currentLifeTime:int = 0;
        public var maxLifeTime:int = 0;
        protected var m_isServerDead:Boolean = false;
        private var _serverDeadEvent:MonsterModelEvent;
        private var _actionChangeEvent:ActorModelEvent;


        override protected function initThis():void
        {
            super.initThis();
            type = ElementType.MT_MONSTER;
            this._serverDeadEvent = new MonsterModelEvent(MonsterModelEvent.ON_SERVER_DEAD, this);
            this._actionChangeEvent = new ActorModelEvent(ActorModelEvent.ON_ACTION_CHANGE, this);
        }

        protected function createActionInfo(_arg_1:Dictionary, _arg_2:int, _arg_3:int, _arg_4:SkillGroup=null):void
        {
            var _local_9:ActionState;
            var _local_5:ActionInfo = new ActionInfo();
            _local_5.id = _arg_2;
            _local_5.actionType = (((_arg_4)!=null) ? ActionType.ATTACK : ActionType.NULL);
            var _local_6:Dictionary = new Dictionary();
            var _local_7:int = (((_arg_4 == null)) ? 1 : _arg_4.skillInfos.length);
            var _local_8:int;
            while (_local_8 < _local_7) {
                _local_9 = new ActionState();
                _local_9.frameIndex = (((_arg_4 == null)) ? 0 : _arg_4.skillInfos[_local_8].frameIndex);
                _local_9.motionID = _arg_3;
                _local_6[_local_8] = _local_9;
                _local_8++;
            };
            _local_5.actionStates = _local_6;
            _arg_1[_arg_2] = _local_5;
        }

        override public function copyValues(_arg_1:AttributeInfo):void
        {
            var _local_4:Vector.<MonsterAISkillParam>;
            var _local_5:int;
            var _local_6:int;
            var _local_7:MonsterAISkillParam;
            var _local_8:SkillGroup;
            var _local_9:int;
            super.copyValues(_arg_1);
            var _local_2:MonsterInfo = (_arg_1 as MonsterInfo);
            this.maxLifeTime = _local_2.maxLifeTime;
            this.currentLifeTime = _local_2.currentLifeTime;
            var _local_3:MonsterAIInfo = _local_2.aiInfo;
            m_actionInfos = new Dictionary();
            this.createActionInfo(m_actionInfos, BaseActionIDDef.IDLE, MotionDef.MT_IDLE);
            this.createActionInfo(m_actionInfos, BaseActionIDDef.WALK, MotionDef.MT_WALK);
            this.createActionInfo(m_actionInfos, BaseActionIDDef.APPEAR, BaseActionIDDef.APPEAR);
            if (_local_3 != null){
                _local_4 = _local_3.skillParams;
                _local_5 = (((_local_4)!=null) ? _local_4.length : 0);
                _local_6 = 0;
                while (_local_6 < _local_5) {
                    _local_7 = _local_4[_local_6];
                    if (!_local_7.skill){
                        throw (new Error((("怪物技能，ID 为 " + _local_7.skillID) + " 的 skillGroup 为空。")));
                    };
                    _local_8 = _local_7.skill;
                    addSkillModel(new SkillModel(_local_8));
                    _local_9 = _local_8.actionID;
                    this.createActionInfo(m_actionInfos, _local_9, _local_9, _local_8);
                    _local_6++;
                };
            };
        }

        public function get isServerDead():Boolean
        {
            return (this.m_isServerDead);
        }

        public function set isServerDead(_arg_1:Boolean):void
        {
            if (this.m_isServerDead != _arg_1){
                this.m_isServerDead = _arg_1;
                if (this.m_isServerDead){
                    dispatchEvent(this._serverDeadEvent);
                };
            };
        }

        override public function updateActionID(_arg_1:int):Boolean
        {
            if (super.updateActionID(_arg_1)){
                this._actionChangeEvent.data = m_actionInfos[_arg_1];
                dispatchEvent(this._actionChangeEvent);
                return (true);
            };
            return (false);
        }

        override public function reset():void
        {
            this.maxLifeTime = 0;
            this.currentLifeTime = 0;
            this.m_isServerDead = false;
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_789()
        {
        }


    }
}//package com.tencent.ai.core.monster

// _SafeStr_789 = " MonsterModel" (String#16793)


