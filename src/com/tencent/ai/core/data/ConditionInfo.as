package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class ConditionInfo extends MultiArgsInfo implements IXMLSerialize 
    {

        public var type:int;

        public function decode(xml:XML):void
        {
            this.type = int(xml.@type);
            this.decodeXML(xml);
        }

        public function encode()
        {
            var xml:XML = <ConditionInfo/>;
            xml.@type = this.type;
            this.encodeXML(xml);
            return xml;
        }

        public function clone():ConditionInfo
        {
            var ret:ConditionInfo = new ConditionInfo();
            ret.type = this.type;
            ret.args = this.args.slice();
            return ret;
        }

        override public function read(data:IDataInput):void
        {
            super.read(data);
            this.type = data.readInt();
        }

        override public function write(data:IDataOutput):void
        {
            super.write(data);
            data.writeInt(this.type);
        }

    }
}
