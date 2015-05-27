// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.utils.RectangleXML

package com.tencent.ai.core.utils
{
    import flash.geom.Rectangle;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1377;

    public class RectangleXML extends Rectangle implements IXMLSerialize, ISerialize 
    {

        public var name:String;

        public function RectangleXML(_arg_1:String="Rectangle", _arg_2:Number=0, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0)
        {
            this.name = _arg_1;
            super(_arg_2, _arg_3, _arg_4, _arg_5);
        }

        public function decode(_arg_1:XML):void
        {
            if (_arg_1){
                this.name = _arg_1.name();
                this.x = _arg_1.@x;
                this.y = _arg_1.@y;
                this.width = _arg_1.@w;
                this.height = _arg_1.@h;
            };
        }

        public function encode()
        {
            var _local_1:XML = <Rectangle/>
            ;
            _local_1.setName(this.name);
            _local_1.@x = this.x;
            _local_1.@y = this.y;
            _local_1.@w = this.width;
            _local_1.@h = this.height;
            return (_local_1);
        }

        override public function clone():Rectangle
        {
            var _local_1:RectangleXML = new RectangleXML();
            _local_1.x = this.x;
            _local_1.y = this.y;
            _local_1.width = this.width;
            _local_1.height = this.height;
            _local_1.name = this.name;
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.x = _arg_1.readInt();
            this.y = _arg_1.readInt();
            this.width = _arg_1.readInt();
            this.height = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(x);
            _arg_1.writeInt(y);
            _arg_1.writeInt(width);
            _arg_1.writeInt(height);
        }

        public /*  ©init. */ function _SafeStr_1377()
        {
        }


    }
}//package com.tencent.ai.core.utils

// _SafeStr_1377 = " RectangleXML" (String#13859)


