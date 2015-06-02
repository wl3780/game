package com.tencent.ai.core.utils
{
    import flash.geom.Rectangle;

    public class RectArea extends Rectangle implements IXMLSerialize 
    {

        public var type:String;
        public var id:int;
        public var dz:int;

        public function RectArea(x:Number=0, y:Number=0, width:Number=0, height:Number=0, dz:int=0, type:String="", id:int=0)
        {
            super(x, y, width, height);
            this.dz = dz;
            this.type = type;
            this.id = id;
        }

        public static function DecodeStr(str:String):RectArea
        {
            var arr:Array = str.split(",");
            var x:int = int(arr[0]);
            var y:int = int(arr[1]);
            var w:int = int(arr[2]);
            var h:int = int(arr[3]);
            var dz:int = int(arr[4]);
            if (w == 0 || h == 0) {
                return null;
            }
            return new RectArea(x, y, w, h, dz);
        }

        public static function EncodeRectArea(area:RectArea):String
        {
            return area.x + "," + area.y + "," + area.width + "," + area.height + "," + area.dz;
        }


        override public function setEmpty():void
        {
            super.setEmpty();
            this.dz = 0;
            this.type = "";
            this.id = 0;
        }

        override public function clone():Rectangle
        {
            var newRect:RectArea = new RectArea();
            newRect.x = x;
            newRect.y = y;
            newRect.width = width;
            newRect.height = height;
            newRect.dz = this.dz;
            newRect.id = this.id;
            newRect.type = this.type;
            return newRect;
        }

        public function copyValuesTo(another:RectArea):void
        {
            another.x = x;
            another.y = y;
            another.width = width;
            another.height = height;
            another.dz = this.dz;
            another.id = this.id;
            another.type = this.type;
        }

        public function decode(xml:XML):void
        {
            this.type = String(xml.@type);
            this.id = int(xml.@id);
            x = int(xml.@x);
            y = int(xml.@y);
            width = int(xml.@w);
            height = int(xml.@h);
            this.dz = int(xml.@dz);
        }

        public function encode()
        {
            var xml:XML = <RectArea/>;
            xml.@type = this.type;
            xml.@id = this.id;
            xml.@x = x;
            xml.@y = y;
            xml.@w = width;
            xml.@h = height;
            xml.@dz = this.dz;
            return xml;
        }

    }
}
