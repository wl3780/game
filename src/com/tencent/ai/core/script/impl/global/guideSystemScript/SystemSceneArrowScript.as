// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemSceneArrowScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.SystemSceneArrowArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1158;

    public class SystemSceneArrowScript implements IScript 
    {

        private var darg:SystemSceneArrowArg;
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
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if (this.guideSystem == null){
                this.guideSystem = AICore.guideSystem;
            };
            this.darg = (_arg_2 as SystemSceneArrowArg);
            if (this.darg.opreationType == "create"){
                _local_3 = this.darg.xPoint;
                _local_4 = this.darg.yPoint;
                _local_5 = this.darg.zPoint;
                this.guideSystem.getASceneArrow(_local_3, _local_4, _local_5, this.callBack, this.darg.direction, this.darg.showTime, "normal", this.darg.id);
            } else {
                this.guideSystem.deleteElementById(this.darg.id);
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
            return (ScriptCmdDef.SC_SYSTEM_SCENE_ARROW);
        }

        public /*  ©init. */ function _SafeStr_1158()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1158 = " SystemSceneArrowScript" (String#15083)


