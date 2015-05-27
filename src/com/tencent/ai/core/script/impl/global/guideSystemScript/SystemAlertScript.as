// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemAlertScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.SystemAlertArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import flash.geom.Point;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1150;

    public class SystemAlertScript implements IScript 
    {

        private var darg:SystemAlertArg;
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
            this.darg = (_arg_2 as SystemAlertArg);
            if (this.darg.opreationType == "create"){
                _local_3 = new Point(this.darg.xPoint, this.darg.yPoint);
                this.guideSystem.openASystemAlert(_local_3, this.darg.data, this.callBack, this.darg.showTime, "normal", this.darg.id);
            } else {
                this.guideSystem.deleteSystemAlertById(this.darg.id);
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
            return (ScriptCmdDef.SC_SYSTEM_ALERT);
        }

        public /*  ©init. */ function _SafeStr_1150()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1150 = " SystemAlertScript" (String#14906)


