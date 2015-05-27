// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.SetConditionFlagArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_153;

    public class SetConditionFlagArg extends ScriptArg 
    {

        public var phaseID:uint;
        public var conditionIndex:int;
        public var flag:Boolean;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.phaseID = uint(_arg_1.@phaseID);
            this.conditionIndex = int(_arg_1.@conditionIndex);
            this.flag = (int(_arg_1.@flag) == 1);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@phaseID = this.phaseID;
            _local_1.@conditionIndex = this.conditionIndex;
            _local_1.@flag = ((this.flag) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:SetConditionFlagArg = (super.clone() as SetConditionFlagArg);
            _local_1.phaseID = this.phaseID;
            _local_1.conditionIndex = this.conditionIndex;
            _local_1.flag = this.flag;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_153()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_153 = " SetConditionFlagArg" (String#17474)


