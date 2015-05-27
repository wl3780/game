// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ScriptInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.arg.script.ScriptArg;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_325;
    import com.tencent.ai.core.data.arg.script.*;

    public class ScriptInfo implements IXMLSerialize, ISerialize 
    {

        public var cmd:String = "";
        public var arg:ScriptArg = null;


        public function decode(_arg_1:XML):void
        {
            this.cmd = String(_arg_1.@cmd);
            var _local_2:XML = _arg_1.ScriptArg[0];
            if (_local_2 == null){
                _local_2 = _arg_1.ActionArg[0];
            };
            if (_local_2 != null){
                this.arg = ScriptArg.newArg(this.cmd);
                this.arg.decode(_local_2);
            };
        }

        public function encode()
        {
            var _local_1:XML = <Script/>
            ;
            _local_1.@cmd = this.cmd;
            if (this.arg != null){
                _local_1.appendChild(this.arg.encode());
            };
            return (_local_1);
        }

        public function toString():String
        {
            return ((((this.cmd + "(") + this.arg) + ")"));
        }

        public function clone():ScriptInfo
        {
            var _local_1:ScriptInfo = new ScriptInfo();
            _local_1.cmd = this.cmd;
            if (this.arg){
                _local_1.arg = this.arg.clone();
            };
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_2:String = XString.ReadString(_arg_1);
            this.decode(XML(_local_2));
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteString(_arg_1, this.encode());
        }

        public /*  ©init. */ function _SafeStr_325()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_325 = " ScriptInfo" (String#17621)


