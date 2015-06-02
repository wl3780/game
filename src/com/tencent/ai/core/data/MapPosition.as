package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;

    public class MapPosition implements ISerialize 
    {

        public var x:int;
        public var z:int;
        public var y:int;
        public var deepOffset:int;

        public function MapPosition(x:int=0, z:int=0, y:int=0, offset:int=0)
        {
            this.x = x;
            this.z = z;
            this.y = y;
            this.deepOffset = offset;
        }

        public static function DecodeXML(xml:XML, map:MapPosition=null):MapPosition
        {
            if (xml == null) {
                return null;
            }
            if (map == null) {
                map = new MapPosition();
            }
            map.x = int(xml.@x);
            map.y = int(xml.@y);
            map.z = int(xml.@z);
            map.deepOffset = int(xml.@deepOffset);
            return map;
        }

        public static function EncodeXML(map:MapPosition):XML
        {
            var xml:XML = <MapPosition/>;
            xml.@x = map.x;
            xml.@y = map.y;
            xml.@z = map.z;
            xml.@deepOffset = map.deepOffset;
            return xml;
        }

        public function decodeBytes(data:IDataInput):void
        {
            this.x = data.readShort();
            this.z = data.readShort();
        }

        public function read(data:IDataInput):void
        {
            this.decodeBytes(data);
        }

        public function write(data:IDataOutput):void
        {
            data.writeShort(this.x);
            data.writeShort(this.z);
        }

        public function clone():MapPosition
        {
            return new MapPosition(this.x, this.z, this.y, this.deepOffset);
        }

        public function toString():String
        {
            return "[map postion: x:" + this.x + " y:" + this.y + " z:" + this.z + " deepOffset:" + this.deepOffset + "]";
        }
		
    }
}
