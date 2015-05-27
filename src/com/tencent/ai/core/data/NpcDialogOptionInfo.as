// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.NpcDialogOptionInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.enum.NpcStatus;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_288;

    public class NpcDialogOptionInfo implements IXMLSerialize, ISerialize 
    {

        public var condType:String;
        public var condValue:String;
        public var scriptInfo:ScriptInfo;
        public var label:String;
        public var status:int = 0;
        public var callback:CFunction;
        public var priority:int;


        public function get hasOption():Boolean
        {
            return (!((this.scriptInfo == null)));
        }

        public function decode(_arg_1:XML):void
        {
            this.label = String(_arg_1.@label);
            this.status = ((_arg_1.hasOwnProperty("@status")) ? int(_arg_1.@status) : NpcStatus.NORMAL);
            this.priority = this.status;
            this.condType = String(_arg_1.@condType);
            this.condValue = String(_arg_1.@condValue);
            if (_arg_1.Script.length()){
                this.scriptInfo = new ScriptInfo();
                this.scriptInfo.decode(_arg_1.Script[0]);
            };
        }

        public function encode()
        {
            return (null);
        }

        public function equal(_arg_1:NpcDialogOptionInfo):Boolean
        {
            if (this === _arg_1){
                return (true);
            };
            return ((this.label == _arg_1.label));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.label = XString.ReadString(_arg_1);
            this.status = _arg_1.readInt();
            this.priority = _arg_1.readInt();
            this.condType = XString.ReadString(_arg_1);
            this.condValue = XString.ReadString(_arg_1);
            this.scriptInfo = new ScriptInfo();
            this.scriptInfo.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteString(_arg_1, this.label);
            _arg_1.writeInt(this.status);
            _arg_1.writeInt(this.priority);
            XString.WriteString(_arg_1, this.condType);
            XString.WriteString(_arg_1, this.condValue);
            this.scriptInfo.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_288()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_288 = " NpcDialogOptionInfo" (String#15761)


