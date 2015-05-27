// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.MoveFollowCameraY

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFollowCameraArg;
    import com.tencent.ai.core.scene.ICamera;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.Constants;
    import  ©init._SafeStr_1130;

    public class MoveFollowCameraY extends AbstractProperty 
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
            var _local_2:int;
            if (!this.camera){
                this.changeStartEnd(this.arg.start, this.arg.end);
            } else {
                _local_1 = ((this.camera.offsetY * this.k) + this.arg.start);
                if (_local_1 != this.target.mapZ){
                    _local_2 = this.target.mapDeep;
                    this.target.setMapZ(_local_1);
                    this.target.mapDeep = _local_2;
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
            return (ScenePropertyType.MOVE_FOLLOW_CAMERA_Y);
        }

        public function changeStartEnd(_arg_1:int, _arg_2:int):void
        {
            this.arg.start = _arg_1;
            this.arg.end = _arg_2;
            var _local_3:IScene = (this.target.getParentContainer() as IScene);
            this.camera = _local_3.getCamera();
            this.k = ((this.arg.end - this.arg.start) / (_local_3.mapHeight - Constants.CAMERA_HEIGHT));
            this.k = Number(this.k.toFixed(4));
        }

        public /*  ©init. */ function _SafeStr_1130()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1130 = " MoveFollowCameraY" (String#14540)


