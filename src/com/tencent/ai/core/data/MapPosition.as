// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MapPosition

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_270;

    public class MapPosition implements ISerialize 
    {

        public var x:int;
        public var z:int;
        public var y:int;
        public var deepOffset:int;

        public function MapPosition(_arg_1:int=0, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0)
        {
            this.x = _arg_1;
            this.z = _arg_2;
            this.y = _arg_3;
            this.deepOffset = _arg_4;
        }

        public static function DecodeXML(_arg_1:XML, _arg_2:MapPosition=null):MapPosition
        {
            if (_arg_1 == null){
                return (null);
            };
            if (_arg_2 == null){
                _arg_2 = new (MapPosition)();
            };
            _arg_2.x = int(_arg_1.@x);
            _arg_2.y = int(_arg_1.@y);
            _arg_2.z = int(_arg_1.@z);
            _arg_2.deepOffset = int(_arg_1.@deepOffset);
            return (_arg_2);
        }

        public static function EncodeXML(_arg_1:MapPosition):XML
        {
            var _local_2:XML = <MapPosition/>
            ;
            _local_2.@x = _arg_1.x;
            _local_2.@y = _arg_1.y;
            _local_2.@z = _arg_1.z;
            _local_2.@deepOffset = _arg_1.deepOffset;
            return (_local_2);
        }


        public function decodeBytes(_arg_1:IDataInput):void
        {
            this.x = _arg_1.readShort();
            this.z = _arg_1.readShort();
        }

        public function read(_arg_1:IDataInput):void
        {
            this.decodeBytes(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(this.x);
            _arg_1.writeShort(this.z);
        }

        public function clone():MapPosition
        {
            return (new MapPosition(this.x, this.z, this.y, this.deepOffset));
        }

        public function toString():String
        {
            return ((((((((("[map postion: x:" + this.x) + " y:") + this.y) + " z:") + this.z) + " deepOffset:") + this.deepOffset) + "]"));
        }

        public /*  ©init. */ function _SafeStr_270()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_270 = " MapPosition" (String#17573)


