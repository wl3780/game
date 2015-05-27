// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.element.shadow.ShadowElementNormal

package com.tencent.ai.core.element.shadow
{
    import com.tencent.ai.core.display.IBitmap;
    import com.tencent.ai.core.enum.ShadowType;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.display.IDisplay;
    import flash.display.BitmapData;
    import com.tencent.free.core.lib.CLASS;
    import  ©init._SafeStr_392;

    public class ShadowElementNormal extends ShadowElement 
    {

        private static var BD_SHADOWS:Array = [];

        private var _bitmap:IBitmap;

        public function ShadowElementNormal()
        {
            this.m_shadowType = ShadowType.NORMAL;
        }

        override protected function createDisplay():IDisplay
        {
            this._bitmap = DisplaySystem.createBitmap();
            return (this._bitmap);
        }

        override public function initialize(_arg_1:Object=null):void
        {
            var _local_2:int = (((_arg_1 == null)) ? 1 : int(_arg_1));
            var _local_3:BitmapData = BD_SHADOWS[_local_2];
            if (_local_3 == null){
                _local_3 = (CLASS.current.newInstance(("ai.commoneffect.assets.shadows.BD_shadow_" + _local_2), [0, 0]) as BitmapData);
                BD_SHADOWS[_local_2] = _local_3;
            };
            this._bitmap.bitmapData = _local_3;
            m_offsetX = (_local_3.width * 0.5);
            m_offsetY = (_local_3.height * 0.5);
        }

        override public function reset():void
        {
            if (this._bitmap != null){
                this._bitmap.bitmapData = null;
            };
            super.reset();
        }

        public /*  ©init. */ function _SafeStr_392()
        {
        }


    }
}//package com.tencent.ai.core.element.shadow

// _SafeStr_392 = " ShadowElementNormal" (String#13841)


