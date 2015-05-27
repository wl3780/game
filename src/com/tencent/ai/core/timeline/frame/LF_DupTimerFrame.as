// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LF_DupTimerFrame

package com.tencent.ai.core.timeline.frame
{
    import com.tencent.ai.core.timeline.ILogicFrame;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.timeline.LFParam;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.events.MonsterEvent;
    import com.tencent.ai.core.enum.LogicFrameType;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.data.FrameData;
    import  ©init._SafeStr_1298;

    public class LF_DupTimerFrame extends LF_DupBaseFrame implements ILogicFrame, ILogicObject 
    {

        private var targetInterval:int;
        private var totalInterval:int;
        private var scene:IScene;
        private var monsterManager:IMonsterManager;


        override public function setParams(_arg_1:LFParam):void
        {
            this.targetInterval = _arg_1.value;
        }

        override public function enter(_arg_1:Object):void
        {
            this.scene = (_arg_1 as IScene);
            Battle.Current.addLogicObject(this);
            this.monsterManager = (this.scene.getFactory(ElementType.ET_MONSTER) as IMonsterManager);
            this.monsterManager.addEventListener(MonsterEvent.ON_MONSTER_REMOVED, this.onMonsterRemoved);
            this.onMonsterRemoved();
        }

        override public function exit():void
        {
            Battle.Current.removeLogicObject(this);
            this.monsterManager.removeEventListener(MonsterEvent.ON_MONSTER_REMOVED, this.onMonsterRemoved);
            this.scene = null;
            this.monsterManager = null;
        }

        override public function getType():int
        {
            return (LogicFrameType.LFT_DUP_TIMER);
        }

        private function onMonsterRemoved(_arg_1:MonsterEvent=null):void
        {
            if (this.monsterManager.isEmpty(ElementGroupDef.PVE_MONSTER)){
                fireComplete();
            };
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
            return (this.totalInterval);
        }

        public function enterframe(_arg_1:int):void
        {
            this.totalInterval++;
            if (this.totalInterval >= this.targetInterval){
                fireComplete();
            };
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public /*  ©init. */ function _SafeStr_1298()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1298 = " LF_DupTimerFrame" (String#16526)


