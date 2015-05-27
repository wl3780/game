// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemActivityArrowScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.SystemActivityArrowArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1149;

    public class SystemActivityArrowScript implements IScript 
    {

        private var darg:SystemActivityArrowArg;
        protected var guideSystem:IGuideSystemManager;


        public function setTarget(_arg_1:Object):void
        {
        }

        public function getTarget():Object
        {
            return (null);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:IScene;
            if (this.guideSystem == null){
                this.guideSystem = AICore.guideSystem;
            };
            this.darg = (_arg_2 as SystemActivityArrowArg);
            if (this.darg.opreationType == "create"){
                _local_3 = AICore.Runtime.currentScene;
                if (((_local_3) && ((((this.darg.sceneID == 0)) || ((_local_3.getSceneInfo().sceneID == this.darg.sceneID)))))){
                    this.guideSystem.getAActivityArrow(this.darg.xPoint, this.darg.yPoint, this.darg.zPoint, this.callBack, this.darg.showTime, this.darg.id);
                } else {
                    AICore.addAIEventListener(AIEvent.ON_ENTER_CITY_SCENE, this.onEnterCityScene);
                    AICore.addAIEventListener(AIEvent.ON_ENTER_HOMESTEAD, this.onEnterHomeStead);
                };
            } else {
                this.guideSystem.deleteElementById(this.darg.id);
            };
        }

        private function onEnterCityScene(_arg_1:AIEvent):void
        {
            AICore.removeAIEventListener(AIEvent.ON_ENTER_CITY_SCENE, this.onEnterCityScene);
            AICore.removeAIEventListener(AIEvent.ON_ENTER_HOMESTEAD, this.onEnterHomeStead);
            var _local_2:IScene = AICore.Runtime.currentScene;
            if (((_local_2) && ((((this.darg.sceneID == 0)) || ((_local_2.getSceneInfo().sceneID == this.darg.sceneID)))))){
                this.guideSystem.getAActivityArrow(this.darg.xPoint, this.darg.yPoint, this.darg.zPoint, this.callBack, this.darg.showTime, this.darg.id);
            } else {
                AICore.addAIEventListener(AIEvent.ON_ENTER_CITY_SCENE, this.onEnterCityScene);
            };
        }

        private function onEnterHomeStead(_arg_1:AIEvent):void
        {
            AICore.removeAIEventListener(AIEvent.ON_ENTER_HOMESTEAD, this.onEnterHomeStead);
            AICore.removeAIEventListener(AIEvent.ON_ENTER_CITY_SCENE, this.onEnterCityScene);
            var _local_2:IScene = AICore.Runtime.currentScene;
            if (_local_2){
                this.guideSystem.getAActivityArrow(this.darg.xPoint, this.darg.yPoint, this.darg.zPoint, this.callBack, this.darg.showTime, this.darg.id);
            };
        }

        private function callBack():void
        {
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_SYSTEM_ACTIVITY_ARROW);
        }

        public /*  ©init. */ function _SafeStr_1149()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1149 = " SystemActivityArrowScript" (String#16004)


