// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.MoveFollowCameraX

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFollowCameraArg;
    import com.tencent.ai.core.scene.ICamera;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_1129;

    public class MoveFollowCameraX extends AbstractProperty 
    {

        private var arg:MoveFollowCameraArg;
        private var camera:ICamera;
        private var k:Number;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as MoveFollowCameraArg);
        }

        override public function render():void
        {
            var _local_1:int;
            if (!this.camera){
                this.changeStartEnd(this.arg.start, this.arg.end);
            } else {
                _local_1 = ((this.camera.offsetX * this.k) + this.arg.start);
                if (_local_1 != this.target.mapX){
                    this.target.setMapX(_local_1);
                };
            };
        }

        override public function uninstall():void
        {
            super.uninstall();
            this.arg = null;
            this.camera = null;
        }

        override public function getArg():PropertyArg
        {
            return (this.arg);
        }

        override public function getType():String
        {
            return (ScenePropertyType.MOVE_FOLLOW_CAMERA_X);
        }

        public function changeStartEnd(_arg_1:int, _arg_2:int):void
        {
            this.arg.start = _arg_1;
            this.arg.end = _arg_2;
            var _local_3:IScene = (this.target.getParentContainer() as IScene);
            this.camera = _local_3.getCamera();
            this.k = ((this.arg.end - this.arg.start) / (_local_3.mapWidth - Constants.CAMERA_WIDTH));
            this.k = Number(this.k.toFixed(4));
        }

        public /*  ©init. */ function _SafeStr_1129()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1129 = " MoveFollowCameraX" (String#14534)


