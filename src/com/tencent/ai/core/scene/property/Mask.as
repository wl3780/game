// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.Mask

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.MaskArg;
    import com.tencent.ai.core.display.IShape;
    import com.tencent.ai.core.scene.NormalItem;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFollowCameraArg;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import com.tencent.ai.core.enum.Constants;
    import flash.geom.Matrix;
    import flash.display.GradientType;
    import com.tencent.ai.core.element.BaseElement;
    import  ©init._SafeStr_1126;

    public class Mask extends AbstractProperty 
    {

        private var arg:MaskArg;
        private var _display:IShape;
        private var added:Boolean;
        private var _target:NormalItem;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as MaskArg);
        }

        override public function render():void
        {
            var _local_1:IScene;
            var _local_2:MoveFollowCameraArg;
            var _local_3:MoveFollowCameraX;
            var _local_4:MoveFollowCameraY;
            if (((!(this.added)) && (this.target.getParentContainer()))){
                _local_1 = (this.target.getParentContainer() as IScene);
                _local_2 = new MoveFollowCameraArg();
                _local_2.type = ScenePropertyType.MOVE_FOLLOW_CAMERA_X;
                _local_2.start = 0;
                _local_2.end = (_local_1.mapWidth - Constants.CAMERA_WIDTH);
                _local_3 = new MoveFollowCameraX();
                _local_3.init(_local_2);
                this._target.addProperty(_local_3);
                _local_2 = new MoveFollowCameraArg();
                _local_2.type = ScenePropertyType.MOVE_FOLLOW_CAMERA_Y;
                _local_2.start = 0;
                _local_2.end = (_local_1.mapHeight - Constants.CAMERA_HEIGHT);
                _local_4 = new MoveFollowCameraY();
                _local_4.init(_local_2);
                this._target.addProperty(_local_4);
                this._target.layer.sort();
                this.added = true;
            };
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            this._target = (_arg_1 as NormalItem);
            var _local_2:Matrix = new Matrix();
            _local_2.createGradientBox(this.arg.width, this.arg.height, (Math.PI / 2));
            this._display = (this.target.getDisplay() as IShape);
            if (this._display){
                this._display.blendMode = this.arg.blendMode;
                this._display.graphics.clear();
                this._display.graphics.beginGradientFill(GradientType.LINEAR, this.arg.colors, this.arg.alphas, this.arg.ratios, _local_2);
                this._display.graphics.drawRect(0, 0, Constants.CAMERA_WIDTH, Constants.CAMERA_HEIGHT);
                this._display.graphics.endFill();
            };
        }

        public /*  ©init. */ function _SafeStr_1126()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1126 = " Mask" (String#17312)


