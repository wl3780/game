package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.actor.HasActionElement;
    import com.tencent.ai.core.data.arg.script.AcceptVKeyArg;
    import com.tencent.ai.core.data.arg.script.CancelActionArg;
    import com.tencent.ai.core.data.arg.script.CancelVkeyGroup;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.script.IScript;
    import com.tencent.free.utils.CFunction;

    public class AcceptVKeyScript extends VirgationScript implements IScript 
    {

        protected var m_vkeyMatchs:Vector.<VKeyMatch>;
        protected var m_cancelVKeys:String;
        protected var m_cancelVKeyGroups:Array;
        protected var m_inputVKeyFunc:CFunction;
        protected var m_accepted:Boolean;

        public function AcceptVKeyScript()
        {
            this.m_vkeyMatchs = new Vector.<VKeyMatch>();
            this.m_inputVKeyFunc = new CFunction(this.inputVKey, this);
            this.m_cancelVKeys = "";
            this.m_accepted = false;
        }

        protected function checkCancelVKeyGroups(_arg_1:int):Boolean
        {
            var _local_4:CancelVkeyGroup;
            var _local_2:int = (((this.m_cancelVKeyGroups)!=null) ? this.m_cancelVKeyGroups.length : 0);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this.m_cancelVKeyGroups[_local_3];
                if ((((_arg_1 == _local_4.vKey)) && (VKeyMatch.IsLimitSkillStep(_local_4.limitStep, m_target)))){
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        protected function checkVKeyArg(_arg_1:AcceptVKeyArg):void
        {
            var _local_3:HasActionElement;
            var _local_2:Array = _arg_1.vkeys;
            if (((!((_local_2 == null))) && (!((_local_2.length == 0))))){
                _local_3 = m_target.target;
                if (((VKeyMatch.IsKeysDown(_local_2[0], _local_3.getController(), 0, _local_3.getDirection())) && (VKeyMatch.IsLimitSkillStep(_arg_1.limitStep, m_target)))){
                    execVirgation(_arg_1.argCmd, int(_arg_1.argStr));
                };
            };
        }

        protected function addVKeyArg(_arg_1:AcceptVKeyArg):void
        {
            var _local_2:int = this.m_vkeyMatchs.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                if (this.m_vkeyMatchs[_local_3].arg == _arg_1){
                    return;
                };
                _local_3++;
            };
            if (!_arg_1.isNull()){
                this.m_vkeyMatchs.push(new VKeyMatch(_arg_1, m_target));
            };
        }

        protected function listen():void
        {
            if ((((this.m_vkeyMatchs.length == 0)) && ((this.m_cancelVKeys == "")))){
                m_target.acceptVKeyFunction = null;
            } else {
                if (!this.m_accepted){
                    m_target.addLastRS(this);
                    this.m_accepted = true;
                };
                m_target.acceptVKeyFunction = this.m_inputVKeyFunc;
            };
        }

        public function inputVKey(_arg_1:int, _arg_2:Object):Boolean
        {
            var _local_7:VKeyMatch;
            var _local_3:int = this.m_vkeyMatchs.length;
            var _local_4:int = m_target.target.mapY;
            var _local_5:int = VKeyDef.TO_SIMPLE_VKEY(_arg_1);
            var _local_6:int;
            while (_local_6 < _local_3) {
                _local_7 = this.m_vkeyMatchs[_local_6];
                if (_local_7.matchVKey(_local_5, _local_4)){
                    if (!m_target.target.isFreeze()){
                        execVirgation(_local_7.nextCmd, _local_7.nextArg);
                        return (true);
                    };
                    return (false);
                };
                _local_6++;
            };
            if (this.m_cancelVKeys != ""){
                if ((((this.m_cancelVKeys == "-1")) || (this.checkCancelVKeyGroups(_arg_1)))){
                    m_target.nextAction(_arg_1, _arg_2);
                    return (true);
                };
            };
            return (false);
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:AcceptVKeyArg;
            var _local_4:CancelActionArg;
            switch (_arg_1){
                case ScriptCmdDef.SC_ACCEPT_VKEY:
                    _local_3 = (_arg_2 as AcceptVKeyArg);
                    if (_local_3.clear){
                        this.m_vkeyMatchs.length = 0;
                    };
                    if (_local_3.checkNow){
                        this.checkVKeyArg(_local_3);
                    } else {
                        this.addVKeyArg(_local_3);
                    };
                    break;
                case ScriptCmdDef.SC_CANCEL_ACTION:
                    _local_4 = CancelActionArg(_arg_2);
                    this.m_cancelVKeys = _local_4.cancelVKeys;
                    this.m_cancelVKeyGroups = _local_4.cancelVkeyGroups;
                    if (_local_4.clear){
                        this.m_vkeyMatchs.length = 0;
                    };
                    break;
            };
            this.listen();
        }

        public function getCmds():Object
        {
            return ([ScriptCmdDef.SC_ACCEPT_VKEY, ScriptCmdDef.SC_CANCEL_ACTION]);
        }

        public function stop():void
        {
            this.m_vkeyMatchs.length = 0;
            this.m_cancelVKeys = "";
            this.m_cancelVKeyGroups = null;
            this.m_accepted = false;
        }

        public /*  ©init. */ function _SafeStr_1206()
        {
        }


    }
}

import com.tencent.ai.core.actor.IElementController;
import com.tencent.ai.core.data.arg.script.AcceptVKeyArg;
import com.tencent.ai.core.enum.Direction;
import com.tencent.ai.core.enum.VKeyDef;
import com.tencent.ai.core.get_current_frameIndex;
import com.tencent.ai.core.script.ITarget;

class VKeyMatch 
{

    public static var DOWN_VKEYS:Array;

    public var nextCmd:String;
    public var nextArg:int;
    public var arg:AcceptVKeyArg;
    protected var m_rsc:ITarget;
    protected var m_controller:IElementController;
    protected var m_firstFrameIndex:int;
    protected var m_lastFrameIndex:int;
    protected var m_limitFrames:int;
    protected var m_limitMapY:int;
    protected var m_allVKeys:Array;
    protected var m_vkeys:Array;
    protected var m_stepSize:int;
    protected var m_matchStep:int;

    public function VKeyMatch(_arg_1:AcceptVKeyArg, _arg_2:ITarget)
    {
        this.arg = _arg_1;
        this.m_rsc = _arg_2;
        this.m_controller = _arg_2.target.getController();
        this.m_vkeys = _arg_1.vkeys;
        this.m_limitFrames = _arg_1.limitFrames;
        this.m_limitMapY = _arg_1.limitMapY;
        this.nextCmd = _arg_1.argCmd;
        this.nextArg = int(_arg_1.argStr);
        this.m_stepSize = this.m_vkeys.length;
        this.m_matchStep = 0;
        if (DOWN_VKEYS == null){
            DOWN_VKEYS = [];
            DOWN_VKEYS[VKeyDef.GO_UP] = 1;
            DOWN_VKEYS[VKeyDef.GO_DOWN] = 1;
            DOWN_VKEYS[VKeyDef.GO_LEFT] = 1;
            DOWN_VKEYS[VKeyDef.GO_RIGHT] = 1;
            DOWN_VKEYS[VKeyDef.FIGHT] = 1;
            DOWN_VKEYS[VKeyDef.Z_DOWN] = 1;
            DOWN_VKEYS[VKeyDef.JUMP] = 1;
            DOWN_VKEYS[VKeyDef.SPACE_DOWN] = 1;
            DOWN_VKEYS[VKeyDef.DEF_INTERCT_VKEY_1] = 1;
        };
        this.m_allVKeys = ((_arg_1.checkUp) ? null : DOWN_VKEYS);
    }

    public static function IsKeysDown(_arg_1:Array, _arg_2:IElementController, _arg_3:int=0, _arg_4:int=1):Boolean
    {
        var _local_5:int = _arg_3;
        while (_local_5 < _arg_1.length) {
            if (!_arg_2.isVKeyDown(GetFrontBackKey(_arg_1[_local_5], _arg_4))){
                return (false);
            };
            _local_5++;
        };
        return (true);
    }

    public static function GetFrontBackKey(_arg_1:int, _arg_2:int):int
    {
        if ((((_arg_1 >= VKeyDef.KEY_FRONT_DOWN)) && ((_arg_1 <= VKeyDef.KEY_BACK_UP)))){
            switch (_arg_1){
                case VKeyDef.KEY_FRONT_DOWN:
                    return ((((_arg_2 == Direction.LEFT)) ? VKeyDef.GO_LEFT : VKeyDef.GO_RIGHT));
                case VKeyDef.KEY_FRONT_UP:
                    return ((((_arg_2 == Direction.LEFT)) ? VKeyDef.STOP_LEFT : VKeyDef.STOP_RIGHT));
                case VKeyDef.KEY_BACK_DOWN:
                    return ((((_arg_2 == Direction.LEFT)) ? VKeyDef.GO_RIGHT : (VKeyDef.GO_LEFT)));
                case VKeyDef.KEY_BACK_UP:
                    return ((((_arg_2 == Direction.LEFT)) ? VKeyDef.STOP_RIGHT : VKeyDef.STOP_LEFT));
            };
        };
        return (_arg_1);
    }

    public static function IsLimitSkillStep(_arg_1:int, _arg_2:ITarget):Boolean
    {
        if ((((_arg_1 == 0)) || ((_arg_2.model.useSkillStep >= _arg_1)))){
            return (true);
        };
        return (false);
    }


    public function matchVKey(_arg_1:int, _arg_2:int):Boolean
    {
        var _local_3:Array;
        var _local_4:int;
        var _local_5:int;
        var _local_6:int;
        if (_arg_2 < this.m_limitMapY){
            return (false);
        };
        if ((((this.m_allVKeys == null)) || ((this.m_allVKeys[_arg_1] == 1)))){
            _local_3 = this.m_vkeys[this.m_matchStep];
            _local_4 = _local_3[0];
            _local_5 = this.m_rsc.target.getDirection();
            if (GetFrontBackKey(_local_4, _local_5) == _arg_1){
                if (!IsKeysDown(_local_3, this.m_controller, 1, _local_5)){
                    return (false);
                };
                if (this.m_stepSize > 1){
                    _local_6 = get_current_frameIndex();
                    if (this.m_matchStep == 0){
                        this.m_firstFrameIndex = _local_6;
                        this.m_matchStep = (this.m_matchStep + 1);
                    } else {
                        if ((_local_6 - this.m_firstFrameIndex) > this.m_limitFrames){
                            this.m_matchStep = 0;
                        } else {
                            if (this.m_matchStep < (this.m_stepSize - 1)){
                                this.m_matchStep = (this.m_matchStep + 1);
                            } else {
                                this.m_matchStep = 0;
                                if (IsLimitSkillStep(this.arg.limitStep, this.m_rsc)){
                                    return (true);
                                };
                            };
                        };
                    };
                } else {
                    this.m_matchStep = 0;
                    if (IsLimitSkillStep(this.arg.limitStep, this.m_rsc)){
                        return (true);
                    };
                };
            };
        };
        return (false);
    }

}
