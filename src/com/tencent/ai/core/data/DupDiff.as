// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.DupDiff

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_234;

    public class DupDiff implements IXMLSerialize, ISerialize 
    {

        public static const LABELS:Array = ["简单", "普通", "冒险", "挑战", "全部"];

        public var value:int;
        public var label:String;
        public var dupID:int;


        public function decode(_arg_1:XML):void
        {
            this.value = int(_arg_1.@value);
            this.label = String(_arg_1.@label);
            if (this.label == ""){
                this.label = LABELS[this.value];
            };
            this.dupID = int(_arg_1.@dupID);
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.value = _arg_1.readByte();
            this.label = XString.ReadString(_arg_1);
            if (this.label == ""){
                this.label = LABELS[this.value];
            };
            this.dupID = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.value);
            XString.WriteString(_arg_1, this.label);
            _arg_1.writeInt(this.dupID);
        }

        public /*  ©init. */ function _SafeStr_234()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_234 = " DupDiff" (String#15518)


