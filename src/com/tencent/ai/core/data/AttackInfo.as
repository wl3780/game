// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AttackInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import  ©init._SafeStr_212;

    public class AttackInfo 
    {

        public static var SAFE_ATTACK_INFO_CLS:Class;
        public static var NORMAL_ATTACK_INFO_CLS:Class;

        private var _dmgValue:int = 0;
        private var _addDmgValue:int = 0;
        public var attackID:int = 0;
        public var attackType:int = 0;
        public var hurtType:int = 1;
        public var iAttack:Boolean = false;
        public var iHurt:Boolean = false;
        public var hurtET:String;
        public var hurtID:uint;
        public var hurtColorValue:int = 0;
        public var dir:int;
        public var isMiss:Boolean = false;
        public var isCRI:Boolean = false;
        public var isBackHurt:Boolean = false;
        public var isBreakSkill:Boolean = false;
        public var isAirHurt:Boolean = false;
        public var hitPoint:MapPosition = null;
        public var skillInfo:SkillInfo;
        public var occurTime:int;
        public var hurtActorModel:ActorModel;
        public var hurtActor:Object;
        public var attackActorModel:ActorModel;
        public var attackActor:Object;
        public var scriptArg:ScriptArg;

        public function AttackInfo(_arg_1:Object=null)
        {
            if (_arg_1 != CreateKey.INSTANCE){
                throw (new Error("非法创建 AttackInfo!!!"));
            };
        }

        public static function newInstance(_arg_1:Boolean=false):AttackInfo
        {
            var _local_2:AttackInfo;
            if (((_arg_1) && (!((SAFE_ATTACK_INFO_CLS == null))))){
                _local_2 = AttackInfo(new SAFE_ATTACK_INFO_CLS(CreateKey.INSTANCE));
            } else {
                if (NORMAL_ATTACK_INFO_CLS != null){
                    _local_2 = AttackInfo(new NORMAL_ATTACK_INFO_CLS(CreateKey.INSTANCE));
                } else {
                    _local_2 = new (AttackInfo)(CreateKey.INSTANCE);
                };
            };
            return (_local_2);
        }


        public function gatherOtherInfo(_arg_1:ActorModel, _arg_2:ActorModel):void
        {
        }

        public function get dmgValue():int
        {
            return (this._dmgValue);
        }

        public function set dmgValue(_arg_1:int):void
        {
            this._dmgValue = _arg_1;
        }

        public function get addDmgValue():int
        {
            return (this._addDmgValue);
        }

        public function set addDmgValue(_arg_1:int):void
        {
            this._addDmgValue = _arg_1;
        }

        public function toString():String
        {
            return ((((((((((((("attackID:" + this.attackID) + "\nmiss:") + this.isMiss) + "\ncri:") + this.isCRI) + "\nbackHurt:") + this.isBackHurt) + "\nisBreakSkill:") + this.isBreakSkill) + "\ndmg:") + this.dmgValue) + "\n"));
        }

        public /*  ©init. */ function _SafeStr_212()
        {
        }


    }
}//package com.tencent.ai.core.data

import  ©init._SafeStr_213;

class CreateKey 
{

    public static var INSTANCE:CreateKey = new (CreateKey)();

    public function CreateKey()
    {
        super();
    }

    public /*  ©init. */ function _SafeStr_213()
    {
    }


}

// _SafeStr_212 = " AttackInfo" (String#15143)
// _SafeStr_213 = " CreateKey" (String#15146)


