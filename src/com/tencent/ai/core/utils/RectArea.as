// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.RectArea

package com.tencent.ai.core.utils
{
    import flash.geom.Rectangle;
    import  ©init._SafeStr_1378;

    public class RectArea extends Rectangle implements IXMLSerialize 
    {

        public var type:String;
        public var id:int;
        public var dz:int;

        public function RectArea(_arg_1:Number=0, _arg_2:Number=0, _arg_3:Number=0, _arg_4:Number=0, _arg_5:int=0, _arg_6:String="", _arg_7:int=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            this.type = _arg_6;
            this.id = _arg_7;
            this.dz = _arg_5;
        }

        public static function DecodeStr(_arg_1:String):RectArea
        {
            var _local_2:Array = _arg_1.split(",");
            var _local_3:int = int(_local_2[0]);
            var _local_4:int = int(_local_2[1]);
            var _local_5:int = int(_local_2[2]);
            var _local_6:int = int(_local_2[3]);
            var _local_7:int = int(_local_2[4]);
            if ((((_local_5 == 0)) || ((_local_6 == 0)))){
                return (null);
            };
            return (new (RectArea)(_local_3, _local_4, _local_5, _local_6, _local_7));
        }

        public static function EncodeRectArea(_arg_1:RectArea):String
        {
            return (((((((((_arg_1.x + ",") + _arg_1.y) + ",") + _arg_1.width) + ",") + _arg_1.height) + ",") + _arg_1.dz));
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
            var _local_1:RectArea = new RectArea();
            _local_1.x = x;
            _local_1.y = y;
            _local_1.width = width;
            _local_1.height = height;
            _local_1.dz = this.dz;
            _local_1.id = this.id;
            _local_1.type = this.type;
            return (_local_1);
        }

        public function copyValuesTo(_arg_1:RectArea):void
        {
            _arg_1.x = x;
            _arg_1.y = y;
            _arg_1.width = width;
            _arg_1.height = height;
            _arg_1.dz = this.dz;
            _arg_1.id = this.id;
            _arg_1.type = this.type;
        }

        public function decode(_arg_1:XML):void
        {
            this.type = String(_arg_1.@type);
            this.id = int(_arg_1.@id);
            x = int(_arg_1.@x);
            y = int(_arg_1.@y);
            width = int(_arg_1.@w);
            height = int(_arg_1.@h);
            this.dz = int(_arg_1.@dz);
        }

        public function encode()
        {
            var _local_1:XML = <RectArea/>
            ;
            _local_1.@type = this.type;
            _local_1.@id = this.id;
            _local_1.@x = x;
            _local_1.@y = y;
            _local_1.@w = width;
            _local_1.@h = height;
            _local_1.@dz = this.dz;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_1378()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1378 = " RectArea" (String#17741)


