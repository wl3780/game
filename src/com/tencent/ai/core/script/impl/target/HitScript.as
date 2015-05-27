// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.HitScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.enum.CatchValueDef;
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1221;

    public class HitScript extends VirgationScript implements IScript 
    {

        protected var hitScriptsFunc:CFunction;
        protected var invokeFunc:CFunction;
        protected var asynscript:CFunction;
        protected var asynExec:Boolean;
        protected var catchValue:int;
        protected var m_skillTarget:ITargetHasSkill;
        protected var m_attackDelegate:IAttackDelegate;


        override public function setTarget(_arg_1:Object):void
        {
            super.setTarget(_arg_1);
            this.m_skillTarget = ITargetHasSkill(_arg_1);
            this.m_attackDelegate = this.m_skillTarget.getAttackDelegate();
        }

        protected function onActorHurt(_arg_1:HasActionElement):Boolean
        {
            var _local_2:Boolean;
            if (((!((_arg_1 == null))) && ((this.catchValue >= CatchValueDef.ONLY)))){
                _local_2 = (this.catchValue == CatchValueDef.ONLY);
                if (((!(_arg_1.getIsDead())) && (_arg_1.getCanBeCaught()))){
                    this.asynExec = true;
                    this.m_attackDelegate.addCatchAim(_arg_1);
                    if (this.m_attackDelegate.cacthAims.length >= this.catchValue){
                        _local_2 = true;
                    };
                };
            };
            if (((!((this.asynscript == null))) && (this.asynExec))){
                m_target.target.execNextFrame(this.asynscript);
                this.asynscript = null;
            };
            return (_local_2);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            if (this.hitScriptsFunc == null){
                this.hitScriptsFunc = new CFunction(this.onActorHurt, this);
                this.invokeFunc = new CFunction(execVirgation, this, []);
            };
            this.asynscript = this.invokeFunc;
            this.catchValue = this.m_attackDelegate.catchValue;
            this.asynscript.params[0] = _local_3.argCmd;
            this.asynscript.params[1] = int(_local_3.argStr);
            if (this.catchValue == CatchValueDef.PRE_FRAME_HIT){
                if (this.m_attackDelegate.currentAim != null){
                    this.asynExec = true;
                    this.onActorHurt(null);
                } else {
                    this.asynscript = null;
                };
            } else {
                this.asynExec = (((this.catchValue == CatchValueDef.NORMAL)) ? true : false);
                this.m_attackDelegate.hitScriptFunc = this.hitScriptsFunc;
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_HIT_SCRIPT);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1221()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1221 = " HitScript" (String#17006)


