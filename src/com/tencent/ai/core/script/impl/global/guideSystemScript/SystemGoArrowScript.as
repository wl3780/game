// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemGoArrowScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.SystemGoArrowArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import flash.geom.Point;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1154;

    public class SystemGoArrowScript implements IScript 
    {

        private var darg:SystemGoArrowArg;
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
            var _local_3:Point;
            if (this.guideSystem == null){
                this.guideSystem = AICore.guideSystem;
            };
            this.darg = (_arg_2 as SystemGoArrowArg);
            if (this.darg.opreationType == "create"){
                _local_3 = new Point(this.darg.xPoint, this.darg.yPoint);
                this.guideSystem.getGoArrow(_local_3, this.callBack, this.darg.direction, this.darg.showTime, "normal", this.darg.id);
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
            return (ScriptCmdDef.SC_SYSTEM_GO_ARROW);
        }

        public /*  ©init. */ function _SafeStr_1154()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1154 = " SystemGoArrowScript" (String#17714)


