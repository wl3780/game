// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.GlobalScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.script.IScript;
    import  ©init._SafeStr_1194;

    public class GlobalScript implements IScript 
    {

        protected var m_cmds:Object;
        protected var m_target:Object;


        public function setTarget(_arg_1:Object):void
        {
            this.m_target = _arg_1;
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (this.m_cmds);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
        }

        public /*  ©init. */ function _SafeStr_1194()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1194 = " GlobalScript" (String#13664)


