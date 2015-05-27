// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.VariableScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_173;

    public class VariableScriptArg extends ScriptArg 
    {

        public static const VAR_ID_MAPY:int = 1001;
        public static const VAR_ID_RIDETYPE:int = 1002;

        public var variableID:int = 0;
        public var modifyType:int = 0;
        public var modifyUseType:int = 0;
        public var modifyValue:int = 0;
        public var virgationType:int = 0;
        public var virgationUseType:int = 0;
        public var virgationValue:int = 0;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.variableID = int(_arg_1.@variableID);
            this.modifyType = int(_arg_1.@modifyType);
            this.modifyUseType = int(_arg_1.@modifyUseType);
            this.modifyValue = int(_arg_1.@modifyValue);
            this.virgationType = int(_arg_1.@virgationType);
            this.virgationUseType = int(_arg_1.@virgationUseType);
            this.virgationValue = int(_arg_1.@virgationValue);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@variableID = this.variableID;
            _local_1.@modifyType = this.modifyType;
            _local_1.@modifyUseType = this.modifyUseType;
            _local_1.@modifyValue = this.modifyValue;
            _local_1.@virgationType = this.virgationType;
            _local_1.@virgationUseType = this.virgationUseType;
            _local_1.@virgationValue = this.virgationValue;
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:VariableScriptArg = (super.clone() as VariableScriptArg);
            _local_1.variableID = this.variableID;
            _local_1.modifyType = this.modifyType;
            _local_1.modifyUseType = this.modifyUseType;
            _local_1.modifyValue = this.modifyValue;
            _local_1.virgationType = this.virgationType;
            _local_1.virgationUseType = this.virgationUseType;
            _local_1.virgationValue = this.virgationValue;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_173()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_173 = " VariableScriptArg" (String#16682)


