// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ScriptDescription

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_324;

    public class ScriptDescription implements IXMLSerialize 
    {

        public static const SCRIPT_NORMAL:int = 0;
        public static const SCRIPT_GO:int = 1;
        public static const SCRIPT_VIRGATION:int = 2;
        public static const GROUP_TARGET:int = 1;
        public static const GROUP_GLOBAL:int = 2;

        public var name:String;
        public var cmd:String;
        public var des:String;
        public var type:int;
        public var groupID:int;


        public function decode(_arg_1:XML):void
        {
            this.name = String(_arg_1.@name);
            this.cmd = String(_arg_1.@cmd);
            this.des = String(_arg_1.@des);
            this.type = int(_arg_1.@type);
            this.groupID = int(_arg_1.@groupID);
        }

        public function encode()
        {
            var _local_1:XML = <ScriptInfo/>
            ;
            _local_1.@name = this.name;
            _local_1.@cmd = this.cmd;
            _local_1.@des = this.des;
            _local_1.@type = this.type;
            _local_1.@groupID = this.groupID;
            return (_local_1);
        }

        public function toString():String
        {
            return (this.name);
        }

        public /*  ©init. */ function _SafeStr_324()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_324 = " ScriptDescription" (String#14363)


