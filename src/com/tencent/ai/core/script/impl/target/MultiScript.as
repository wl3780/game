// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.MultiScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1226;

    public class MultiScript extends VirgationScript implements IScript 
    {


        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:Array;
            var _local_6:ScriptArg;
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:int = int((((_local_3)!=null) ? _local_3.argStr : _arg_2));
            if (!execVirgation(_arg_1, _local_4)){
                switch (_arg_1){
                    case ScriptCmdDef.SC_EXE_ARG:
                        _local_5 = m_target.currentActionArgs;
                        if (_local_5 != null){
                            _local_6 = _local_5[_local_4];
                            if (_local_6 != null){
                                m_target.onScript(_local_6.argCmd, _local_6);
                            };
                        };
                        return;
                };
            };
        }

        public function getCmds():Object
        {
            return ([ScriptCmdDef.SC_NEXT_ACTION, ScriptCmdDef.SC_NEXT_ACTION_STATE, ScriptCmdDef.SC_EXE_ARG, ScriptCmdDef.SC_GOTOANDPLAY, ScriptCmdDef.SC_GOTOANDSTOP, ScriptCmdDef.SC_STOP, ScriptCmdDef.SC_PLAY]);
        }

        public function stop():void
        {
        }

        public /*  ©init. */ function _SafeStr_1226()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1226 = " MultiScript" (String#15299)


