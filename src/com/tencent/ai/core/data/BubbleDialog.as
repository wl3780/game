// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.BubbleDialog

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_220;

    public class BubbleDialog implements IXMLSerialize, ISerialize 
    {

        public var id:int = 1;
        public var minL:int = 0;
        public var maxL:int = 100;
        public var location:int = 0;
        public var randomP:int = 1000;
        public var dialogType:int = 1;
        public var content:String = "";


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.randomP = int(_arg_1.@randomP);
            this.dialogType = int(_arg_1.@dialogType);
            this.minL = int(_arg_1.@minL);
            this.maxL = int(_arg_1.@maxL);
            this.location = int(_arg_1.@location);
            this.content = _arg_1.toString();
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.randomP = _arg_1.readShort();
            this.dialogType = _arg_1.readByte();
            this.minL = _arg_1.readShort();
            this.maxL = _arg_1.readShort();
            this.location = _arg_1.readByte();
            this.content = XString.ReadString(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeShort(this.randomP);
            _arg_1.writeByte(this.dialogType);
            _arg_1.writeShort(this.minL);
            _arg_1.writeShort(this.maxL);
            _arg_1.writeByte(this.location);
            XString.WriteString(_arg_1, this.content);
        }

        public /*  ©init. */ function _SafeStr_220()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_220 = " BubbleDialog" (String#17726)


