// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.VirgationScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1251;

    public class VirgationScript 
    {

        protected var m_target:ITarget;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function execVirgation(_arg_1:String, _arg_2:int):Boolean
        {
            switch (_arg_1){
                case ScriptCmdDef.SC_NEXT_ACTION:
                    this.m_target.nextAction(_arg_2);
                    return (true);
                case ScriptCmdDef.SC_NEXT_ACTION_STATE:
                    this.m_target.setCurrentState(_arg_2);
                    return (true);
                case ScriptCmdDef.SC_GOTOANDPLAY:
                    this.m_target.view.gotoAndPlay(_arg_2);
                    return (true);
                case ScriptCmdDef.SC_GOTOANDSTOP:
                    this.m_target.view.gotoAndStop(_arg_2);
                    return (true);
                case ScriptCmdDef.SC_PLAY:
                    this.m_target.view.play();
                    return (true);
                case ScriptCmdDef.SC_STOP:
                    this.m_target.view.stop();
                    return (true);
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_1251()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1251 = " VirgationScript" (String#13709)


