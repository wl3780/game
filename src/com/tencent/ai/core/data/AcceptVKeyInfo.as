// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AcceptVKeyInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import  ©init._SafeStr_203;

    public class AcceptVKeyInfo implements IXMLSerialize 
    {

        public var key:int;
        public var cmd:String;
        public var arg:String;


        public function decode(_arg_1:XML):void
        {
            this.key = int(_arg_1.@key);
            this.cmd = String(_arg_1.@cmd);
            this.arg = String(_arg_1.@arg);
        }

        public function encode()
        {
            var _local_1:XML = <AcceptVKey/>
            ;
            _local_1.@key = this.key;
            _local_1.@cmd = this.cmd;
            _local_1.@arg = this.arg;
            return (_local_1);
        }

        public function clone():AcceptVKeyInfo
        {
            var _local_1:AcceptVKeyInfo = new AcceptVKeyInfo();
            _local_1.key = this.key;
            _local_1.cmd = this.cmd;
            _local_1.arg = this.arg;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_203()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_203 = " AcceptVKeyInfo" (String#16925)


