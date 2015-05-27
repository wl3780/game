// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.MoveXY

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.MoveXYArg;
    import com.tencent.ai.core.scene.ICamera;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import  ©init._SafeStr_1132;

    public class MoveXY extends AbstractProperty 
    {

        private var arg:MoveXYArg;
        private var camera:ICamera;
        private var display:IDisplay;
        private var gapFrame:int;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as MoveXYArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            this.target = _arg_1;
            this.display = this.target.getDisplay();
        }

        override public function render():void
        {
            var _local_1:IScene;
            if (this.gapFrame < this.arg.gapFrame){
                this.gapFrame++;
                return;
            };
            this.gapFrame = 0;
            if (!this.camera){
                _local_1 = (this.target.getParentContainer() as IScene);
                this.camera = _local_1.getCamera();
            };
            if (((!(this.display)) || (!(this.camera)))){
                return;
            };
            if (((((((((this.target.mapX + this.display.width) < this.camera.offsetX)) || ((this.target.mapX > (this.camera.offsetX + this.camera.viewWidth))))) || (((this.target.mapZ + this.display.height) < this.camera.offsetY)))) || ((this.target.mapZ > (this.camera.offsetY + this.camera.viewHeight))))){
                this.target.setMapX(((Math.random() * this.camera.viewWidth) + this.camera.offsetX));
                this.target.setMapZ((this.camera.offsetY - this.display.height));
            } else {
                this.target.setMapX((this.target.mapX + this.arg.speedX));
                this.target.setMapZ((this.target.mapZ + this.arg.speedY));
            };
        }

        override public function uninstall():void
        {
            this.target = null;
            this.arg = null;
            this.camera = null;
            this.display = null;
        }

        override public function getType():String
        {
            return (ScenePropertyType.MOVE_X_Y);
        }

        override public function getArg():PropertyArg
        {
            return (this.arg);
        }

        public /*  ©init. */ function _SafeStr_1132()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1132 = " MoveXY" (String#16979)


