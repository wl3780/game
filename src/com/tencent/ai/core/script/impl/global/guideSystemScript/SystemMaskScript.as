// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.guideSystemScript.SystemMaskScript

package com.tencent.ai.core.script.impl.global.guideSystemScript
{
    import com.tencent.ai.core.data.arg.script.SystemMaskArg;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import flash.geom.Rectangle;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1156;

    public class SystemMaskScript 
    {

        private var darg:SystemMaskArg;
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
            var _local_3:Rectangle;
            if (this.guideSystem == null){
                this.guideSystem = AICore.guideSystem;
            };
            this.darg = (_arg_2 as SystemMaskArg);
            if (this.darg.opreationType == "create"){
                _local_3 = new Rectangle(this.darg.xPoint, this.darg.yPoint, this.darg.width, this.darg.height);
                this.guideSystem.getAMask(_local_3, this.darg.data, this.callBack, this.darg.id);
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
            return (ScriptCmdDef.SC_SYSTEM_MASK);
        }

        public /*  ©init. */ function _SafeStr_1156()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.guideSystemScript

// _SafeStr_1156 = " SystemMaskScript" (String#17348)


