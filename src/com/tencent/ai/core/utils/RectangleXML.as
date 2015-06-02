package com.tencent.ai.core.utils
{
    import flash.geom.Rectangle;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class RectangleXML extends Rectangle implements IXMLSerialize, ISerialize 
    {

        public var name:String;

        public function RectangleXML(name:String="Rectangle", x:Number=0, y:Number=0, w:Number=0, h:Number=0)
        {
            this.name = name;
            super(x, y, w, h);
        }

        public function decode(xml:XML):void
        {
            if (xml) {
                this.name = xml.name();
                this.x = xml.@x;
                this.y = xml.@y;
                this.width = xml.@w;
                this.height = xml.@h;
            }
        }

        public function encode()
        {
            var xml:XML = <Rectangle/>;
            xml.setName(this.name);
            xml.@x = this.x;
            xml.@y = this.y;
            xml.@w = this.width;
            xml.@h = this.height;
            return xml;
        }

        override public function clone():Rectangle
        {
            var rect:RectangleXML = new RectangleXML();
            rect.x = this.x;
            rect.y = this.y;
            rect.width = this.width;
            rect.height = this.height;
            rect.name = this.name;
            return rect;
        }

        public function read(data:IDataInput):void
        {
            this.x = data.readInt();
            this.y = data.readInt();
            this.width = data.readInt();
            this.height = data.readInt();
        }

        public function write(data:IDataOutput):void
        {
            data.writeInt(x);
            data.writeInt(y);
            data.writeInt(width);
            data.writeInt(height);
        }

    }
}
