package com.tencent.ai.core.display
{
    import com.tencent.ai.core.data.AIInitClasses;
    import com.tencent.ai.core.render.BodyViewLayer;
    import com.tencent.ai.core.render.IBitmapDisplay;
    import com.tencent.ai.core.render.IBitmapRender;
    import com.tencent.ai.core.render.IBitmapRenderDisplay;
    import com.tencent.ai.core.render.ILaserViewRender;
    import com.tencent.ai.core.render.ILayerRender;
    import com.tencent.free.core.lib.CLASS;

    public class DisplaySystem 
    {

        private static var _CLASS_Bitmap:Class = null;
        private static var _CLASS_BitmapDisplay:Class = null;
        private static var _CLASS_Sprite:Class = null;
        private static var _CLASS_Shape:Class = null;
        private static var _CLASS_TextFiled:Class = null;
        private static var _CLASS_BitmapRender:Class = null;
        private static var _CLASS_BitmapRenderDisplay:Class = null;
        private static var _CLASS_LayerRender:Class = null;
        private static var _CLASS_BodyViewLayer:Class = null;
        private static var _CLASS_LaserViewRender:Class = null;


        public static function initialize(_arg_1:AIInitClasses):void
        {
            _CLASS_Bitmap = CLASS.current.tryForName(_arg_1.CLASS_Bitmap);
            _CLASS_BitmapDisplay = CLASS.current.tryForName(_arg_1.CLASS_BitmapDisplay);
            _CLASS_Sprite = CLASS.current.tryForName(_arg_1.CLASS_Sprite);
            _CLASS_Shape = CLASS.current.tryForName(_arg_1.CLASS_Shape);
            _CLASS_TextFiled = CLASS.current.tryForName(_arg_1.CLASS_TextFiled);
            _CLASS_BitmapRender = CLASS.current.tryForName(_arg_1.CLASS_BitmapRender);
            _CLASS_BitmapRenderDisplay = CLASS.current.tryForName(_arg_1.CLASS_BitmapRenderDisplay);
            _CLASS_LayerRender = CLASS.current.tryForName(_arg_1.CLASS_LayerRender);
            _CLASS_BodyViewLayer = CLASS.current.tryForName(_arg_1.CLASS_BodyViewLayer);
            _CLASS_LaserViewRender = CLASS.current.tryForName(_arg_1.CLASS_LaserViewRender);
        }

        public static function createBitmap():IBitmap
        {
            if (_CLASS_Bitmap == null){
                return (null);
            };
            return ((new _CLASS_Bitmap() as IBitmap));
        }

        public static function createBitmapDisplay():IBitmapDisplay
        {
            if (_CLASS_BitmapDisplay == null){
                return (null);
            };
            return ((new _CLASS_BitmapDisplay() as IBitmapDisplay));
        }

        public static function createSprite():ISprite
        {
            if (_CLASS_Sprite == null){
                return (null);
            };
            return ((new _CLASS_Sprite() as ISprite));
        }

        public static function createShape():IShape
        {
            if (_CLASS_Shape == null){
                return (null);
            };
            return ((new _CLASS_Shape() as IShape));
        }

        public static function createTextFiled():ITextField
        {
            if (_CLASS_TextFiled == null){
                return (null);
            };
            return ((new _CLASS_TextFiled() as ITextField));
        }

        public static function createBitmapRender():IBitmapRender
        {
            if (_CLASS_BitmapRender == null){
                return (null);
            };
            return ((new _CLASS_BitmapRender() as IBitmapRender));
        }

        public static function createBitmapRenderDisplay():IBitmapRenderDisplay
        {
            if (_CLASS_BitmapRenderDisplay == null){
                return (null);
            };
            return ((new _CLASS_BitmapRenderDisplay() as IBitmapRenderDisplay));
        }

        public static function createLayerRender():ILayerRender
        {
            if (_CLASS_LayerRender == null){
                return (null);
            };
            return ((new _CLASS_LayerRender() as ILayerRender));
        }

        public static function createBodyViewLayer():BodyViewLayer
        {
            if (_CLASS_BodyViewLayer == null){
                return (null);
            };
            return ((new _CLASS_BodyViewLayer() as BodyViewLayer));
        }

        public static function createLaserViewRender():ILaserViewRender
        {
            if (_CLASS_LaserViewRender == null){
                return (null);
            };
            return ((new _CLASS_LaserViewRender() as ILaserViewRender));
        }

    }
}
