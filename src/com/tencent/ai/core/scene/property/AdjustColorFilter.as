// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.AdjustColorFilter

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.AdjustColorFilterArg;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import fl.motion.AdjustColor;
    import flash.filters.ColorMatrixFilter;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import  ©init._SafeStr_1122;

    public class AdjustColorFilter extends AbstractProperty 
    {

        private var arg:AdjustColorFilterArg;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as AdjustColorFilterArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            var _local_2:AdjustColor = new AdjustColor();
            _local_2.brightness = this.arg.brightness;
            _local_2.contrast = this.arg.contrast;
            _local_2.hue = this.arg.hue;
            _local_2.saturation = this.arg.saturation;
            var _local_3:ColorMatrixFilter = new ColorMatrixFilter();
            _local_3.matrix = _local_2.CalculateFinalFlatArray();
            this.target.getDisplay().filters = [_local_3];
        }

        override public function uninstall():void
        {
            this.arg = null;
            this.target.getDisplay().filters = null;
            super.uninstall();
        }

        override public function getType():String
        {
            return (ScenePropertyType.ADJUST_COLOR_FILTER);
        }

        public /*  ©init. */ function _SafeStr_1122()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1122 = " AdjustColorFilter" (String#15764)


