// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.asset.config.FrameInfo

package com.tencent.ai.core.asset.config
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import flash.geom.Rectangle;
    import com.tencent.free.utils.XString;
    import  ©init._SafeStr_53;

    public class FrameInfo implements IXMLSerialize 
    {

        public var refBD:int;
        public var id:int;
        public var name:String;
        public var offsetX:int = 0;
        public var offsetY:int = 0;
        public var sourceRect:Rectangle;
        public var export:Boolean = true;


        public function decode(_arg_1:XML):void
        {
            this.refBD = int(_arg_1.@refBD);
            this.id = int(_arg_1.@id);
            this.offsetX = int(_arg_1.@offsetX);
            this.offsetY = int(_arg_1.@offsetY);
            this.name = _arg_1.@name;
            var _local_2:String = String(_arg_1.@rect);
            if (_local_2 != ""){
                this.sourceRect = XString.DecodeRect(_local_2);
            };
            this.export = !((String(_arg_1.@export) == "false"));
        }

        public function encode()
        {
            var _local_1:XML = <FrameInfo/>
            ;
            _local_1.@refBD = this.refBD;
            _local_1.@id = this.id;
            _local_1.@offsetX = this.offsetX;
            _local_1.@offsetY = this.offsetY;
            _local_1.@name = this.name;
            if (this.sourceRect != null){
                _local_1.@rect = ((((((this.sourceRect.x + ",") + this.sourceRect.y) + ",") + this.sourceRect.width) + ",") + this.sourceRect.height);
            };
            if (!this.export){
                _local_1.@export = "false";
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_53()
        {
        }


    }
}//package com.tencent.ai.core.asset.config

// _SafeStr_53 = " FrameInfo" (String#17432)


