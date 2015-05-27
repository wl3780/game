// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.RandomScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.data.arg.script.RandomScriptArg;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1228;

    public class RandomScript extends VirgationScript implements IScript 
    {


        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:RandomScriptArg = (_arg_2 as RandomScriptArg);
            if (_local_3 != null){
                if (DEFINE.RANDOM_FLOAT() < _local_3.value){
                    execVirgation(_local_3.argCmd, int(_local_3.argStr));
                };
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_RANDOM);
        }

        public /*  ©init. */ function _SafeStr_1228()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1228 = " RandomScript" (String#15155)


