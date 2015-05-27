// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetInvokeIPicScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.player.IVariableManager;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.events.AIMovieEvent;
    import com.tencent.ai.core.player.IMainPlayerModel;
    import com.tencent.ai.core.data.arg.script.InvokeIPicArg;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1238;

    public class TargetInvokeIPicScript implements IScript 
    {

        private static var _varManager:IVariableManager;

        private var _target:ITarget;
        private var _isTips:Boolean = false;
        private var _isMainShow:Boolean = false;
        private var _skillTipsVar:Variable;


        public function setTarget(_arg_1:Object):void
        {
            this._target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this._target);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:AIMovieEvent;
            var _local_5:IMainPlayerModel;
            var _local_3:InvokeIPicArg = (_arg_2 as InvokeIPicArg);
            if (_local_3.mode == InvokeIPicArg.MODE_NORMAL){
                if (this._target.model.isMain){
                    _local_4 = new AIMovieEvent(AIMovieEvent.ON_INVOKE_IPIC);
                    _local_4.data = _arg_2;
                    AICore.Runtime.dispatchEvent(_local_4);
                };
            } else {
                if (_local_3.time > 0){
                    if (!this._isTips){
                        this._isTips = true;
                        this._target.addLastRS(this);
                        if (this._target.model.isMain){
                            if (_varManager == null){
                                _local_5 = AICore.data.mainModel;
                                if (_local_5 != null){
                                    _varManager = _local_5.variableManager;
                                };
                            };
                            if (_varManager != null){
                                if (this._skillTipsVar == null){
                                    this._skillTipsVar = new Variable(100, Variable.VAR_TYPE_SKILL_TIPS);
                                    this._skillTipsVar.registVar("SKILL_0_Tips", Variable.VAR_TYPE_SKILL_TIPS);
                                };
                                _varManager.registVar(this._skillTipsVar);
                                this._isMainShow = true;
                            };
                        };
                    };
                } else {
                    if (this._isTips){
                        this._target.removeLastRs(this);
                        this.stop();
                    };
                };
            };
        }

        public function stop():void
        {
            this._isTips = false;
            if (this._isMainShow){
                this._isMainShow = false;
                _varManager.unregistVar(this._skillTipsVar);
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_INVOKE_IPIC);
        }

        public /*  ©init. */ function _SafeStr_1238()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1238 = " TargetInvokeIPicScript" (String#14117)


