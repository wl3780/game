// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetQTEScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.player.IVKeyIntercept;
    import com.tencent.ai.core.player.IVariableManager;
    import com.tencent.ai.core.data.arg.script.QTEScriptArg;
    import com.tencent.ai.core.player.BasePlayer;
    import com.tencent.ai.core.combat.IAttackDelegate;
    import com.tencent.ai.core.actor.model.Variable;
    import com.tencent.ai.core.script.ITargetHasSkill;
    import com.tencent.ai.core.player.IMainPlayerModel;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1241;

    public class TargetQTEScript extends VirgationScript implements IScript, IVKeyIntercept 
    {

        private static var _varManager:IVariableManager;

        private var _downKey:int;
        private var _downTimes:int;
        private var _currentDownTimes:int;
        private var _showQTETips:Boolean;
        private var _arg:QTEScriptArg;
        private var _catchPlayer:BasePlayer;
        private var _attackDelegate:IAttackDelegate;
        private var _qteTipsVar:Variable;


        override public function setTarget(_arg_1:Object):void
        {
            super.setTarget(_arg_1);
            if ((m_target is ITargetHasSkill)){
                this._attackDelegate = ITargetHasSkill(m_target).getAttackDelegate();
            };
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_4:IMainPlayerModel;
            var _local_3:QTEScriptArg = QTEScriptArg(_arg_2);
            if (_local_3.removeQTE){
                if (this._arg != null){
                    m_target.removeLastRs(this);
                    this.stop();
                };
            } else {
                if ((((((this._arg == null)) && (!((this._attackDelegate == null))))) && ((this._attackDelegate.cacthAims.length > 0)))){
                    this._catchPlayer = (this._attackDelegate.cacthAims[0] as BasePlayer);
                    if (this._catchPlayer){
                        this._arg = _local_3;
                        this._downKey = this._arg.vkeyCode;
                        this._downTimes = this._arg.vkeyDownTimes;
                        this._currentDownTimes = 0;
                        this._showQTETips = false;
                        this._catchPlayer.addVKeyIntercept(this);
                        m_target.addLastRS(this);
                        if (((this._arg.showTips) && (this._catchPlayer.isMain()))){
                            if (this._qteTipsVar == null){
                                this._qteTipsVar = new Variable(100, Variable.VAR_TYPE_QTE_TIPS);
                                this._qteTipsVar.registVar("QTE_Tips", Variable.VAR_TYPE_QTE_TIPS);
                            };
                            if (_varManager == null){
                                _local_4 = AICore.data.mainModel;
                                if (_local_4 != null){
                                    _varManager = _local_4.variableManager;
                                };
                            };
                            if (_varManager){
                                this._showQTETips = true;
                                _varManager.registVar(this._qteTipsVar);
                            };
                        };
                    };
                };
            };
        }

        public function interceptVKey(_arg_1:int, _arg_2:int, _arg_3:BasePlayer):int
        {
            var _local_4:String;
            var _local_5:int;
            if ((((this._downKey == -1)) || ((_arg_1 == this._downKey)))){
                this._currentDownTimes++;
                if (this._currentDownTimes >= this._downTimes){
                    m_target.removeLastRs(this);
                    _local_4 = this._arg.argCmd;
                    _local_5 = int(this._arg.argStr);
                    this.stop();
                    execVirgation(_local_4, _local_5);
                };
            };
            return (_arg_1);
        }

        public function onTargetActionChange(_arg_1:int, _arg_2:BasePlayer):void
        {
        }

        public function stop():void
        {
            if (this._arg != null){
                this._catchPlayer.removeVKeyIntercept(this);
                this._catchPlayer = null;
                this._downKey = 0;
                this._downTimes = 0;
                this._currentDownTimes = 0;
                this._arg = null;
                if (this._showQTETips){
                    this._showQTETips = false;
                    _varManager.unregistVar(this._qteTipsVar);
                };
            };
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_QTE);
        }

        public /*  ©init. */ function _SafeStr_1241()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1241 = " TargetQTEScript" (String#16196)


