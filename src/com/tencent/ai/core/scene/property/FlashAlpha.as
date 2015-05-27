// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.FlashAlpha

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.FlashAlphaArg;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import flash.utils.setInterval;
    import com.tencent.ai.core.element.BaseElement;
    import flash.utils.clearInterval;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import  ©init._SafeStr_1123;

    public class FlashAlpha extends AbstractProperty 
    {

        private var arg:FlashAlphaArg;
        private var intervalID:int;
        private var sign:int = 1;
        private var display:IDisplay;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as FlashAlphaArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            this.intervalID = setInterval(this.loop, 100);
        }

        private function loop():void
        {
            var _local_1:Number;
            if (!this.display){
                this.display = this.target.getDisplay();
            };
            if (this.display){
                _local_1 = this.display.alpha;
                if ((((_local_1 < this.arg.start)) || ((_local_1 > this.arg.end)))){
                    this.arg.step = (this.arg.step * -1);
                };
                this.display.alpha = (this.display.alpha + this.arg.step);
            };
        }

        override public function uninstall():void
        {
            super.uninstall();
            this.arg = null;
            clearInterval(this.intervalID);
        }

        override public function getType():String
        {
            return (ScenePropertyType.Flash_Alpha);
        }

        public /*  ©init. */ function _SafeStr_1123()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1123 = " FlashAlpha" (String#15524)


