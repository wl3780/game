// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.InervalTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.element.ILogicObject;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.combat.Battle;
    import com.tencent.ai.core.data.FrameData;
    import  ©init._SafeStr_1331;

    public class InervalTriggerEvent extends BaseTriggerEvent implements ILogicObject 
    {

        public var interval:int;
        public var times:int;
        private var m_curCount:int;
        private var m_curTimes:int;
        private var m_curScene:IScene;
        private var m_sceneID:int = -1;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1, _arg_2);
            this.interval = int(_arg_1.args[0]);
            if (((_arg_1.args[1]) && (!((_arg_1.args[1] == ""))))){
                this.times = int(_arg_1.args[1]);
            } else {
                this.times = 1;
            };
            this.m_curCount = 0;
            this.m_curTimes = 0;
        }

        override public function activate():void
        {
            var _local_1:IScene = AICore.Runtime.currentScene;
            if (((((!(m_isActive)) || (!((this.m_curScene == _local_1))))) || (!((this.m_sceneID == _local_1.getSceneInfo().sceneID))))){
                super.activate();
                this.m_curScene = _local_1;
                this.m_sceneID = this.m_curScene.getSceneInfo().sceneID;
                Battle.Current.addLogicObject(this);
            };
        }

        override public function inactivate():void
        {
            if (m_isActive){
                if (((this.m_curScene) && ((this.m_curScene == AICore.Runtime.currentScene)))){
                    Battle.Current.removeLogicObject(this);
                };
                this.m_curScene = null;
                this.m_sceneID = -1;
                super.inactivate();
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
            return (0);
        }

        public function enterframe(_arg_1:int):void
        {
            if (this.m_curCount++ > this.interval){
                var _local_2 = this;
                var _local_3 = (_local_2.m_curTimes + 1);
                _local_2.m_curTimes = _local_3;
                if (((!((this.times == -1))) && ((this.times <= this.m_curTimes)))){
                    this.inactivate();
                };
                this.m_curCount = 0;
                fireEvent();
            };
        }

        public function freeze(_arg_1:int):void
        {
        }

        public function resetFreeze():void
        {
        }

        public /*  ©init. */ function _SafeStr_1331()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1331 = " InervalTriggerEvent" (String#14249)


