// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.VariableScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.data.arg.script.VariableScriptArg;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1250;

    public class VariableScript extends VirgationScript implements IScript 
    {


        private function getTargetVar(_arg_1:int):int
        {
            var _local_3:Variable;
            var _local_2:int;
            if (_arg_1 == VariableScriptArg.VAR_ID_MAPY){
                _local_2 = m_target.target.mapY;
            } else {
                if (_arg_1 == VariableScriptArg.VAR_ID_RIDETYPE){
                    _local_2 = BaseActor(m_target.target).getRideType();
                } else {
                    _local_3 = m_target.getVariable(_arg_1);
                    _local_2 = ((_local_3) ? _local_3.value : 0);
                };
            };
            return (_local_2);
        }

        protected function modifyVariable(_arg_1:VariableScriptArg):int
        {
            var _local_3:Variable;
            var _local_4:int;
            var _local_2:int = _arg_1.variableID;
            if (_arg_1.modifyType == 0){
                _local_3 = m_target.getVariable(_local_2);
                _local_4 = ((_local_3) ? _local_3.value : 0);
            } else {
                _local_3 = m_target.getVariable(_local_2, true);
                if (_arg_1.modifyUseType == 0){
                    _local_4 = _arg_1.modifyValue;
                } else {
                    _local_4 = this.getTargetVar(_arg_1.modifyValue);
                };
                if (_arg_1.modifyType == 2){
                    _local_4 = (_local_4 + _local_3.value);
                };
                _local_3.setValue(_local_4);
            };
            return (_local_4);
        }

        protected function checkVariable(_arg_1:int, _arg_2:VariableScriptArg):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            if (_arg_2.virgationType != 0){
                _local_4 = _arg_2.virgationUseType;
                if (_local_4 == 0){
                    _local_3 = _arg_2.virgationValue;
                } else {
                    if (_local_4 == 1){
                        _local_3 = this.getTargetVar(_arg_2.virgationValue);
                    };
                };
                switch (_arg_2.virgationType){
                    case 1:
                        return ((_arg_1 == _local_3));
                    case 2:
                        return ((_arg_1 > _local_3));
                    case 3:
                        return ((_arg_1 < _local_3));
                };
            };
            return (false);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:VariableScriptArg = (_arg_2 as VariableScriptArg);
            if (_local_3 != null){
                if (this.checkVariable(this.modifyVariable(_local_3), _local_3)){
                    execVirgation(_local_3.argCmd, int(_local_3.argStr));
                };
            };
        }

        public function stop():void
        {
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_VARIABLE);
        }

        public /*  ©init. */ function _SafeStr_1250()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1250 = " VariableScript" (String#13712)


