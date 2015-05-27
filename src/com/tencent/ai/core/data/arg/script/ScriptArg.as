package com.tencent.ai.core.data.arg.script
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.free.utils.XString;
    
    import flash.utils.Dictionary;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class ScriptArg implements IXMLSerialize, ISerialize 
    {

        public static var ARG_CLS_MAP:Dictionary = new Dictionary();

        public var argCmd:String = "";
        public var argStr:String = "";

        public static function newArg(cmd:String):ScriptArg
        {
            var cls:Class = ARG_CLS_MAP[cmd];
            if (cls == null) {
                cls = ScriptArg;
            }
            return new cls() as ScriptArg;
        }


        public function decode(xml:XML):void
        {
            this.argCmd = String(xml.@cmd);
            this.argStr = String(xml.@argStr);
        }

        public function encode()
        {
            var xml:XML = <ScriptArg/>;
            if (this.argCmd && this.argCmd != "null") {
                xml.@cmd = this.argCmd;
            }
            if (this.argStr && this.argStr != "null") {
                xml.@argStr = this.argStr;
            }
            return xml;
        }

        public function toString():String
        {
            return this.argStr;
        }

        public function clone():ScriptArg
        {
            var cls:Class = this["constructor"];
            var scriptArg:ScriptArg = new cls() as ScriptArg;
            scriptArg.argCmd = this.argCmd;
            scriptArg.argStr = this.argStr;
            return scriptArg;
        }

        public function read(data:IDataInput):void
        {
            this.decode(new XML(XString.ReadString(data)));
        }

        public function write(data:IDataOutput):void
        {
            XString.WriteString(data, this.encode());
        }

    }
}
