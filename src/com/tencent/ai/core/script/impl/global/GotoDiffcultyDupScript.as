// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.global.GotoDiffcultyDupScript

package com.tencent.ai.core.script.impl.global
{
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.AICommandType;
    import com.tencent.ai.core.data.arg.DupCallArg;
    import  ©init._SafeStr_1195;

    public class GotoDiffcultyDupScript extends GlobalScript 
    {

        public function GotoDiffcultyDupScript()
        {
            m_cmds = ScriptCmdDef.SC_CALL_GOTO_DUP_DIFFCULTY;
        }

        override public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_3:String = (_arg_2.argStr as String);
            if (_local_3.indexOf(",") != -1){
                _local_6 = ",";
            } else {
                if (_local_3.indexOf("，") != -1){
                    _local_6 = "，";
                } else {
                    if (_local_3.indexOf("_") != -1){
                        _local_6 = "_";
                    } else {
                        if (_local_3.indexOf("-") != -1){
                            _local_6 = "-";
                        } else {
                            AICore.cmdCall(AICommandType.CALL_DUPLICATE, new DupCallArg(DupCallArg.LOGIN, int(_local_3)));
                            return;
                        };
                    };
                };
            };
            var _local_7:Array = _local_3.split(_local_6);
            if (int(_local_7[0]) < int(_local_7[1])){
                this.gotoDiffDup(int(_local_7[0]), int(_local_7[1]));
            } else {
                this.gotoDiffDup(int(_local_7[1]), int(_local_7[0]));
            };
        }

        private function gotoDiffDup(_arg_1:int, _arg_2:int):void
        {
            var _local_3:DupCallArg = new DupCallArg();
            _local_3.type = DupCallArg.ENTER_DIFFICULTY_SELECT;
            _local_3.data = _arg_2;
            _local_3.extraData = _arg_1;
            AICore.cmdCall(AICommandType.CALL_DUPLICATE, _local_3);
        }

        public /*  ©init. */ function _SafeStr_1195()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.global

// _SafeStr_1195 = " GotoDiffcultyDupScript" (String#14777)


