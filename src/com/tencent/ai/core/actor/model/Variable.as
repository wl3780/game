// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.actor.model.Variable

package com.tencent.ai.core.actor.model
{
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.events.VariableEvent;
    import  ©init._SafeStr_43;

    public class Variable extends EventDispatcher2 
    {

        public static const VAL_TYPE_NUM:int = 0;
        public static const VAL_TYPE_TIME:int = 1;
        public static const VAR_TYPE_ACTION:int = 0;
        public static const VAR_TYPE_QTE_TIPS:int = 100;
        public static const VAR_TYPE_SKILL_TIPS:int = 101;

        public var value:Number;
        public var valueType:int;
        public var varName:String;
        public var varDes:String;
        public var isRegist:Boolean;
        private var _event:VariableEvent;
        private var _varIndex:int;
        private var _varType:int;

        public function Variable(_arg_1:int=0, _arg_2:int=0)
        {
            this.isRegist = false;
            this._varIndex = _arg_1;
            this._varType = _arg_2;
            this.value = 0;
        }

        public function registVar(_arg_1:String, _arg_2:int=0, _arg_3:String=""):void
        {
            this.isRegist = true;
            this.varName = _arg_1;
            this.valueType = _arg_2;
            this.varDes = _arg_3;
            if (this._event == null){
                this._event = new VariableEvent(VariableEvent.ON_VAR_UPDATE, this);
            };
        }

        public function setValue(_arg_1:Number):void
        {
            if (this.value != _arg_1){
                this.value = _arg_1;
                if (this.isRegist){
                    dispatchEvent(this._event);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_43()
        {
        }


    }
}//package com.tencent.ai.core.actor.model

// _SafeStr_43 = " Variable" (String#14588)


