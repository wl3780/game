// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.sys.EnterCitySceneScript

package com.tencent.ai.core.script.impl.global.sys
{
    import com.tencent.ai.core.script.impl.global.GlobalScript;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.data.arg.CallChangeSceneArg;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.free.utils.asynInvoke;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import  ©init._SafeStr_1166;

    public class EnterCitySceneScript extends GlobalScript 
    {

        public function EnterCitySceneScript()
        {
            m_cmds = ScriptCmdDef.SC_ENTER_CITY_SCENE;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_6:CallChangeSceneArg;
            var _local_3:ScriptArg = (_arg_2 as ScriptArg);
            var _local_4:Array = _local_3.argStr.split(",");
            var _local_5:int = int(_local_4[0]);
            if (_local_4.length < 3){
                asynInvoke(new CFunction(AICore.cmdCall, null, [AICommandType.CALL_CITY, _local_5]));
            } else {
                _local_6 = new CallChangeSceneArg();
                _local_6.sceneID = _local_5;
                _local_6.posX = int(_local_4[1]);
                _local_6.posY = int(_local_4[2]);
                asynInvoke(new CFunction(AICore.cmdCall, null, [AICommandType.CALL_CITY, _local_6]));
            };
        }

        public /*  ©init. */ function _SafeStr_1166()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global.sys

// _SafeStr_1166 = " EnterCitySceneScript" (String#13667)


