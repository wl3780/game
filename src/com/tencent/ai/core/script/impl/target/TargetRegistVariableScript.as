// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetRegistVariableScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.player.IVariableManager;
    import com.tencent.ai.core.script.ITarget;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.player.IMainPlayerModel;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.arg.script.RegistVariableScriptArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.free.logging.error;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1242;

    public class TargetRegistVariableScript implements IScript 
    {

        private static var _varManager:IVariableManager;

        protected var m_target:ITarget;
        protected var m_regVars:Dictionary;
        protected var m_regCount:int = 0;


        private function unRegist(_arg_1:Variable):void
        {
            if (this.m_regCount != 0){
                if (((this.m_regVars) && (this.m_regVars[_arg_1]))){
                    delete this.m_regVars[_arg_1];
                    _varManager.unregistVar(_arg_1);
                    this.m_regCount--;
                    if (this.m_regCount == 0){
                        this.m_target.removeLastRs(this);
                    };
                };
            };
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_5:IMainPlayerModel;
            if (!BaseActor(this.m_target.target).getModel().isMain){
                return;
            };
            var _local_3:RegistVariableScriptArg = RegistVariableScriptArg(_arg_2);
            var _local_4:Variable = this.m_target.getVariable(_local_3.varID);
            if (_local_4){
                if (_local_3.unRegist){
                    this.unRegist(_local_4);
                } else {
                    if (!_local_4.isRegist){
                        _local_4.registVar(_local_4.varName, _local_4.valueType, _local_4.varDes);
                    };
                    if (_varManager == null){
                        _local_5 = AICore.data.mainModel;
                        if (_local_5 != null){
                            _varManager = _local_5.variableManager;
                        };
                    };
                    if (_varManager == null){
                        error("[TargetRegistVariableScript] 找不到全局变量管理器！！");
                        return;
                    };
                    _varManager.registVar(_local_4);
                    if (_local_3.stopUnRegist){
                        if (!this.m_regVars){
                            this.m_regVars = new Dictionary();
                        };
                        if (!this.m_regVars[_local_4]){
                            if (this.m_regCount == 0){
                                this.m_target.addLastRS(this);
                            };
                            this.m_regCount++;
                            this.m_regVars[_local_4] = _local_4;
                        };
                    };
                };
            };
        }

        public function stop():void
        {
            var _local_1:Variable;
            if (this.m_regCount != 0){
                for each (_local_1 in this.m_regVars) {
                    delete this.m_regVars[_local_1];
                    _varManager.unregistVar(_local_1);
                };
                this.m_regCount = 0;
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_REGIST_VAR);
        }

        public /*  ©init. */ function _SafeStr_1242()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1242 = " TargetRegistVariableScript" (String#16319)


