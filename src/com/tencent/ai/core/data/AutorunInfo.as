// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AutorunInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_216;
    import __AS3__.vec.*;

    public class AutorunInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var eventType:String;
        public var once:Boolean;
        public var conditionXML:XML;
        public var scriptList:Vector.<ScriptInfo>;


        public function getConditionClassName():String
        {
            return (String(this.conditionXML.@className));
        }

        public function decode(_arg_1:XML):void
        {
            var _local_5:XML;
            var _local_6:ScriptInfo;
            this.id = int(_arg_1.@id);
            this.eventType = String(_arg_1.@event);
            this.once = ("true" == String(_arg_1.@once));
            this.conditionXML = _arg_1.Condition[0];
            this.scriptList = new Vector.<ScriptInfo>();
            var _local_2:XMLList = _arg_1.Script;
            var _local_3:int = _local_2.length();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_6 = new ScriptInfo();
                _local_6.decode(_local_5);
                this.scriptList.push(_local_6);
                _local_4++;
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:ScriptInfo;
            this.id = _arg_1.readInt();
            this.eventType = XString.ReadString(_arg_1);
            this.once = _arg_1.readBoolean();
            this.conditionXML = new XML(XString.ReadString(_arg_1));
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.scriptList = new Vector.<ScriptInfo>();
            while (_local_3 < _local_2) {
                _local_4 = new ScriptInfo();
                _local_4.read(_arg_1);
                this.scriptList.push(_local_4);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:ScriptInfo;
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.eventType);
            _arg_1.writeBoolean(this.once);
            XString.WriteString(_arg_1, this.conditionXML.toXMLString());
            _arg_1.writeUnsignedInt(this.scriptList.length);
            for each (_local_2 in this.scriptList) {
                _local_2.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_216()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_216 = " AutorunInfo" (String#14807)


