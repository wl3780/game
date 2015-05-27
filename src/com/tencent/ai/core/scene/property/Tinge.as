// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.Tinge

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.TingeArg;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import flash.geom.ColorTransform;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import  ©init._SafeStr_1136;

    public class Tinge extends AbstractProperty 
    {

        private var arg:TingeArg;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as TingeArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            var _local_2:ColorTransform = new ColorTransform();
            _local_2.alphaOffset = this.arg.alphaOffset;
            _local_2.alphaMultiplier = this.arg.alphaMultiplier;
            _local_2.redOffset = this.arg.redOffset;
            _local_2.redMultiplier = this.arg.redMultiplier;
            _local_2.greenMultiplier = this.arg.greenMultiplier;
            _local_2.greenOffset = this.arg.greenOffset;
            _local_2.blueMultiplier = this.arg.blueMultiplier;
            _local_2.blueOffset = this.arg.blueOffset;
            this.target.getDisplay().transform.colorTransform = _local_2;
        }

        override public function uninstall():void
        {
            this.target.getDisplay().transform.colorTransform = new ColorTransform();
            super.uninstall();
            this.arg = null;
        }

        override public function getType():String
        {
            return (ScenePropertyType.TINGE);
        }

        public /*  ©init. */ function _SafeStr_1136()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1136 = " Tinge" (String#14456)


