// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.timeline.frame.LF_DupKillMonstersFrame

package com.tencent.ai.core.timeline.frame
{
    import com.tencent.ai.core.timeline.ILogicFrame;
    import com.tencent.ai.core.monster.IMonsterManager;
    import com.tencent.ai.core.enum.ElementGroupDef;
    import com.tencent.ai.core.events.MonsterEvent;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.LogicFrameType;
    import  ©init._SafeStr_1296;

    public class LF_DupKillMonstersFrame extends LF_DupBaseFrame implements ILogicFrame 
    {

        public static var FRAME:LF_DupKillMonstersFrame = new (LF_DupKillMonstersFrame)();

        protected var m_monsterm:IMonsterManager;


        protected function onMonsterRemoved(_arg_1:MonsterEvent):void
        {
            if (this.m_monsterm.isEmpty(ElementGroupDef.PVE_MONSTER)){
                fireComplete();
            };
        }

        override public function enter(_arg_1:Object):void
        {
            var _local_2:IScene = (_arg_1 as IScene);
            this.m_monsterm = AICore.Runtime.currentContext.getMonsterManager();
            this.m_monsterm.addEventListener(MonsterEvent.ON_MONSTER_REMOVED, this.onMonsterRemoved);
            this.onMonsterRemoved(null);
        }

        override public function exit():void
        {
            this.m_monsterm.removeEventListener(MonsterEvent.ON_MONSTER_REMOVED, this.onMonsterRemoved);
            this.m_monsterm = null;
        }

        override public function getType():int
        {
            return (LogicFrameType.LFT_DUP_KILL_MONSTERS);
        }

        public /*  ©init. */ function _SafeStr_1296()
        {
        }


    }
}//package com.tencent.ai.core.timeline.frame

// _SafeStr_1296 = " LF_DupKillMonstersFrame" (String#14549)


