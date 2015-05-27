// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LF_DupSpawnFrame

package com.tencent.ai.core.timeline.frame
{
    import com.tencent.ai.core.timeline.ILogicFrame;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.SpawnInfo;
    import com.tencent.ai.core.monster.ISpawnManager;
    import com.tencent.ai.core.events.MonsterEvent;
    import com.tencent.ai.core.enum.SpawnType;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.timeline.LFParam;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.enum.LogicFrameType;
    import com.tencent.ai.core.timeline.LogicTimeline;
    import __AS3__.vec.Vector;
    import  ©init._SafeStr_1297;

    public class LF_DupSpawnFrame extends LF_DupBaseFrame implements ILogicFrame 
    {

        protected var m_scene:IScene;
        protected var m_spawnInfo:SpawnInfo;
        protected var m_spawnManager:ISpawnManager;


        protected function onSpawnComplete(_arg_1:MonsterEvent):void
        {
            if (_arg_1.data == this.m_spawnInfo){
                fireComplete();
            };
        }

        override public function setParams(_arg_1:LFParam):void
        {
            this.m_spawnInfo = new SpawnInfo(SpawnType.SPAWN_REASON_WAVE);
            this.m_spawnInfo.packID = _arg_1.value;
            this.m_spawnInfo.spawnData1 = _arg_1.value1;
            this.m_spawnInfo.localMapPos = new MapPosition();
        }

        override public function enter(_arg_1:Object):void
        {
            this.m_scene = (_arg_1 as IScene);
            this.m_spawnManager = AICore.monsterSystem.getSpawnManager();
            this.m_spawnManager.addEventListener(MonsterEvent.ON_SPAWN_MONSTER_COMPLETE, this.onSpawnComplete);
            this.m_spawnManager.spawnMonsters(this.m_spawnInfo);
            this.checkMonsterLevel();
        }

        override public function exit():void
        {
            if (this.m_spawnManager != null){
                this.m_spawnManager.removeEventListener(MonsterEvent.ON_SPAWN_MONSTER_COMPLETE, this.onSpawnComplete);
                this.m_spawnManager = null;
            };
            this.m_scene = null;
            this.m_spawnInfo = null;
        }

        private function checkMonsterLevel():void
        {
            var _local_2:AIEvent;
            var _local_1:int = this.getValue1();
            if (_local_1 >= 1){
                _local_2 = new AIEvent(AIEvent.ON_SHOW_MONSTER_TIP);
                _local_2.data = {
                    "index":(_local_1 + 1),
                    "total":this.getTotalLevel()
                };
                AICore.dispatchAIEvent(_local_2);
            };
        }

        override public function getType():int
        {
            return (LogicFrameType.LFT_DUP_SPAWN);
        }

        public function getValue1():int
        {
            return (this.m_spawnInfo.spawnData1);
        }

        private function getTotalLevel():int
        {
            var _local_3:int;
            var _local_4:ILogicFrame;
            var _local_1:int = this.getValue1();
            var _local_2:Vector.<ILogicFrame> = LogicTimeline.Current.getLogicFrames();
            for each (_local_4 in _local_2) {
                if (_local_4.getType() == this.getType()){
                    _local_3 = LF_DupSpawnFrame(_local_4).getValue1();
                    _local_1 = (((_local_1)<_local_3) ? _local_3 : _local_1);
                };
            };
            return ((_local_1 + 1));
        }

        public /*  ©init. */ function _SafeStr_1297()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1297 = " LF_DupSpawnFrame" (String#15425)


