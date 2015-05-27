// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.framespackage.BDFile

package com.tencent.ai.core.manager.framespackage
{
    import com.tencent.ai.core.asset.config.BD;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.tencent.ai.core.asset.decode.IFileDecoder;
    import com.tencent.free.logging.warning;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_658;

    public class BDFile 
    {

        public var config:BD;
        public var bitmapData:BitmapData;
        private var _gc:Boolean;
        private var _desPoint:Point;

        public function BDFile(_arg_1:BD)
        {
            this.config = _arg_1;
            this._gc = false;
        }

        public function build(_arg_1:IFileDecoder):void
        {
            this.bitmapData = (_arg_1.findFile(this.config.bdName) as BitmapData);
            this._gc = true;
        }

        public function cutBitmapData(_arg_1:Rectangle):BitmapData
        {
            if ((((_arg_1 == null)) || ((((((((_arg_1.x == 0)) && ((_arg_1.y == 0)))) && ((_arg_1.width == this.bitmapData.width)))) && ((_arg_1.height == this.bitmapData.height)))))){
                this._gc = false;
                return (this.bitmapData);
            };
            if (this._desPoint == null){
                this._desPoint = new Point();
            };
            var _local_2:BitmapData = new BitmapData(_arg_1.width, _arg_1.height);
            _local_2.copyPixels(this.bitmapData, _arg_1, this._desPoint);
            warning("[BDFile] #########获取一个未知的图片!");
            return (_local_2);
        }

        public function unbuild():void
        {
            if (((this._gc) && (!((this.bitmapData == null))))){
                this.bitmapData.dispose();
                this.bitmapData = null;
            };
            this._gc = false;
            this.config = null;
        }

        public /*  ©init. */ function _SafeStr_658()
        {
        }


    }
}//package com.tencent.ai.core.manager.framespackage

// _SafeStr_658 = " BDFile" (String#15383)


