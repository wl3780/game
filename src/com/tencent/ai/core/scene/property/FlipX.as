﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.FlipX

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.FlipArg;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import  ©init._SafeStr_1124;

    public class FlipX extends AbstractProperty 
    {

        private var arg:FlipArg;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as FlipArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            this.target.setDirection(this.arg.value);
        }

        override public function uninstall():void
        {
            super.uninstall();
            this.arg = null;
        }

        override public function getType():String
        {
            return (ScenePropertyType.FLIP_X);
        }

        public /*  ©init. */ function _SafeStr_1124()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1124 = " FlipX" (String#16874)


