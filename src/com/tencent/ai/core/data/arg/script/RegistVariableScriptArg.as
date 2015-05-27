// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.script.RegistVariableScriptArg

package com.tencent.ai.core.data.arg.script
{
    import  ©init._SafeStr_145;

    public class RegistVariableScriptArg extends ScriptArg 
    {

        public var varID:int = 0;
        public var valueType:int = 0;
        public var varName:String = "无";
        public var varDes:String = "";
        public var unRegist:Boolean = false;
        public var stopUnRegist:Boolean = true;


        override public function decode(_arg_1:XML):void
        {
            super.decode(_arg_1);
            this.varID = int(_arg_1.@varID);
            this.valueType = int(_arg_1.@valueType);
            this.varName = String(_arg_1.@varName);
            this.unRegist = (int(_arg_1.@unRegist) == 1);
            this.stopUnRegist = (int(_arg_1.@stopUnRegist) == 1);
        }

        override public function encode()
        {
            var _local_1:XML = super.encode();
            _local_1.@varID = this.varID;
            _local_1.@valueType = this.valueType;
            _local_1.@varName = this.varName;
            _local_1.@unRegist = ((this.unRegist) ? 1 : 0);
            _local_1.@stopUnRegist = ((this.stopUnRegist) ? 1 : 0);
            return (_local_1);
        }

        override public function clone():ScriptArg
        {
            var _local_1:RegistVariableScriptArg = (super.clone() as RegistVariableScriptArg);
            _local_1.varID = this.varID;
            _local_1.valueType = this.valueType;
            _local_1.varName = this.varName;
            _local_1.varDes = this.varDes;
            _local_1.unRegist = this.unRegist;
            _local_1.stopUnRegist = this.stopUnRegist;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_145()
        {
        }


    }
}//package com.tencent.ai.core.data.arg.script

// _SafeStr_145 = " RegistVariableScriptArg" (String#15275)


