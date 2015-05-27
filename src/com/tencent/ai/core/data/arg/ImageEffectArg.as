// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.arg.ImageEffectArg

package com.tencent.ai.core.data.arg
{
    import flash.geom.Matrix;
    import flash.display.BitmapData;
    import flash.geom.ColorTransform;
    import com.tencent.free.utils.CFunction;
    import flash.geom.Rectangle;
    import com.tencent.ai.core.display.IBitmap;
    import com.tencent.ai.core.display.IDisplay;
    import  ©init._SafeStr_198;

    public class ImageEffectArg 
    {

        private static var __MATRIX:Matrix;

        public var finishGC:Boolean = true;
        public var copyImg:BitmapData;
        public var imgLocalX:int = 0;
        public var imgLocalY:int = 0;
        public var copyColor:ColorTransform;
        public var dAlpha:Number = 0;
        public var dScale:Number = 0;
        public var duration:int = 0;
        public var scale:Number = 1;
        public var disposeFunc:CFunction;
        private var imgReadOnly:Boolean = false;


        public function copyingImg(_arg_1:IDisplay):void
        {
            var _local_2:Rectangle;
            if (this.copyImg == null){
                _local_2 = _arg_1.getDisplayBounds(_arg_1);
                if (__MATRIX == null){
                    __MATRIX = new Matrix();
                };
                this.imgLocalX = (-1 * _local_2.x);
                this.imgLocalY = (-1 * _local_2.y);
                __MATRIX.tx = this.imgLocalX;
                __MATRIX.ty = this.imgLocalY;
                if ((_arg_1 is IBitmap)){
                    this.imgReadOnly = true;
                    this.copyImg = IBitmap(_arg_1).bitmapData;
                } else {
                    this.copyImg = new BitmapData(_local_2.width, _local_2.height, true, 0xFF);
                    this.copyImg.draw(_arg_1, __MATRIX);
                };
            };
        }

        public function disposeImg(_arg_1:Object):void
        {
            if (((!((this.copyImg == null))) && (this.finishGC))){
                if (!this.imgReadOnly){
                    this.copyImg.dispose();
                    this.copyImg = null;
                };
            };
            if (this.disposeFunc != null){
                this.disposeFunc.call(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_198()
        {
        }


    }
}//package com.tencent.ai.core.data.arg

// _SafeStr_198 = " ImageEffectArg" (String#14294)


