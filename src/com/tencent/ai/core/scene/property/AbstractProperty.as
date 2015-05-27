// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.AbstractProperty

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import  ©init._SafeStr_1121;

    public class AbstractProperty 
    {

        protected var target:BaseElement;


        public function init(_arg_1:PropertyArg):void
        {
        }

        public function install(_arg_1:BaseElement):void
        {
            this.target = _arg_1;
        }

        public function render():void
        {
        }

        public function uninstall():void
        {
            this.target = null;
        }

        public function getType():String
        {
            return ("");
        }

        public function getArg():PropertyArg
        {
            return (null);
        }

        public /*  ©init. */ function _SafeStr_1121()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1121 = " AbstractProperty" (String#13928)


