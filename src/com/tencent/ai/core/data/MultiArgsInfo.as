package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class MultiArgsInfo implements ISerialize 
    {

        public var args:Array;

        public function decodeXML(xml:XML):void
        {
            this.args = [];
            var index:int = 0;
            var key:String = "@arg" + index.toString();
            while (xml.hasOwnProperty(key)) {
	            var value:Object = xml[key];
                this.args.push(String(value));
				
				index++;
                key = "@arg" + index.toString();
            }
        }

        public function encodeXML(xml:XML):void
        {
            if (xml && this.args) {
	            var index:int = 0;
                while (index < this.args.length) {
                    if (this.args[index] && this.args[index] != "") {
                        xml["@arg" + index] = this.args[index];
                    }
                    index++;
                }
            }
        }

        public function read(data:IDataInput):void
        {
            this.args = [];
            var size:int = data.readByte();
            var index:int;
            while (index < size) {
                this.args.push(XString.ReadString(data));
                index++;
            }
        }

        public function write(data:IDataOutput):void
        {
            var size:int = this.args.length;
            data.writeByte(size);
            var index:int;
            while (index < size) {
                XString.WriteString(data, this.args[index]);
                index++;
            }
        }

    }
}
