// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.BreakShadowScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.arg.script.FollowShadowArg;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1209;

    public class BreakShadowScript implements IScript 
    {

        protected var m_target:ITarget;
        protected var m_followShaowArg:FollowShadowArg;
        protected var m_listenStop:Boolean;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = (_arg_1 as ITarget);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (this.m_followShaowArg == null){
                this.m_followShaowArg = new FollowShadowArg();
                this.m_followShaowArg.colorTransform = new TingeInfo(1, 1, 1, 1, 0xFF, 0xFF, 0xFF);
                this.m_followShaowArg.scale = 1.2;
                this.m_followShaowArg.dScale = -0.03;
                this.m_followShaowArg.dAlpha = -0.05;
                this.m_followShaowArg.duration = 10;
            };
            if (!this.m_listenStop){
                this.m_listenStop = true;
                this.m_target.addLastRS(this);
            };
        }

        public function stop():void
        {
            this.m_listenStop = false;
            if (this.m_target.latestVKey != -1){
                this.m_target.onScript(ScriptCmdDef.SC_TARGET_FOLLOW_SHADOW, this.m_followShaowArg);
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_BREAK_SHADOW);
        }

        public /*  ©init. */ function _SafeStr_1209()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1209 = " BreakShadowScript" (String#17612)


