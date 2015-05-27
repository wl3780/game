// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemArrowScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.SystemArrowArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import flash.geom.Point;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1151;

    public class SystemArrowScript implements IScript 
    {

        private var darg:SystemArrowArg;
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
            this.darg = (_arg_2 as SystemArrowArg);
            if (this.darg.opreationType == "create"){
                _local_3 = new Point(this.darg.xPoint, this.darg.yPoint);
                this.guideSystem.getAArrow(_local_3, this.callBack, this.darg.direction, this.darg.showTime, "normal", this.darg.id);
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
            return (ScriptCmdDef.SC_SYSTEM_ARROW);
        }

        public /*  ©init. */ function _SafeStr_1151()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1151 = " SystemArrowScript" (String#14963)


