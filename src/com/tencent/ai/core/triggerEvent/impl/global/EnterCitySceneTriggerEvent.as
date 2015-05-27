// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.triggerEvent.impl.global.EnterCitySceneTriggerEvent

package com.tencent.ai.core.triggerEvent.impl.global
{
    import com.tencent.ai.core.triggerEvent.impl.BaseTriggerEvent;
    import com.tencent.ai.core.data.TriggerEventInfo;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AIContextType;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.data.SceneInfo;
    import  ©init._SafeStr_1325;

    public class EnterCitySceneTriggerEvent extends BaseTriggerEvent 
    {

        protected var m_sceneid:int;


        override public function initialize(_arg_1:TriggerEventInfo, _arg_2:Object=null):void
        {
            super.initialize(_arg_1);
            if (((_arg_1.args) && ((_arg_1.args.length == 1)))){
                this.m_sceneid = int(_arg_1.args[0]);
            };
        }

        override public function activate():void
        {
            var _local_1:int;
            super.activate();
            if (null != AICore.Runtime.currentScene){
                _local_1 = AICore.Runtime.currentScene.getSceneInfo().sceneID;
                if (AICore.Runtime.currentContext.getType() == AIContextType.CT_CITY){
                    if ((((-1 == this.m_sceneid)) || ((_local_1 == this.m_sceneid)))){
                        fireEvent();
                    };
                };
            };
            AICore.addAIEventListener(AIEvent.ON_ENTER_CITY_SCENE, this.onSceneChange);
        }

        override public function inactivate():void
        {
            super.inactivate();
            AICore.removeAIEventListener(AIEvent.ON_ENTER_CITY_SCENE, this.onSceneChange);
        }

        private function onSceneChange(_arg_1:AIEvent):void
        {
            var _local_3:int;
            var _local_2:SceneInfo = (_arg_1.data as SceneInfo);
            if (_local_2){
                _local_3 = _local_2.sceneID;
                if ((((-1 == this.m_sceneid)) || ((_local_3 == this.m_sceneid)))){
                    fireEvent();
                };
            };
        }

        public /*  ©init. */ function _SafeStr_1325()
        {
        }


    }
}//package com.tencent.ai.core.triggerEvent.impl.global

// _SafeStr_1325 = " EnterCitySceneTriggerEvent" (String#15572)


