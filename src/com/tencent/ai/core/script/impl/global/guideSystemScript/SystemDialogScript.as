// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemDialogScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.SystemDialogArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1153;

    public class SystemDialogScript implements IScript 
    {

        private var darg:SystemDialogArg;
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
            if (this.guideSystem == null){
                this.guideSystem = AICore.guideSystem;
            };
            var _local_3:SystemDialogArg = (_arg_2 as SystemDialogArg);
            if (_local_3.opreationType == "create"){
                this.guideSystem.openASystemDialog(_local_3.data, this.callBack, _local_3.showTime, "normal", _local_3.id);
            } else {
                this.guideSystem.deleteSystemDialogById(_local_3.id);
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
            return (ScriptCmdDef.SC_SYSTEM_DIALOG);
        }

        public /*  ©init. */ function _SafeStr_1153()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1153 = " SystemDialogScript" (String#16673)


