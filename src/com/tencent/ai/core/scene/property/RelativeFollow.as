// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.RelativeFollow

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.RelativeFollowArg;
    import com.tencent.ai.core.scene.NormalItem;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.scene.ISceneLayer;
    import  ©init._SafeStr_1134;

    public class RelativeFollow extends AbstractProperty 
    {

        private var _arg:RelativeFollowArg;
        private var _toFlow:NormalItem;


        override public function init(_arg_1:PropertyArg):void
        {
            this._arg = (_arg_1 as RelativeFollowArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
        }

        override public function render():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            if (((!(this._toFlow)) && (this.target.getParentContainer()))){
                this.changeFollow(this._arg.layerID, this._arg.followID);
            } else {
                this._toFlow.render(0);
                _local_1 = (this._toFlow.mapX + this._arg.offsetX);
                _local_2 = (this._toFlow.mapZ + this._arg.offsetZ);
                if (_local_1 != this.target.mapX){
                    this.target.setMapX(_local_1);
                };
                _local_3 = this.target.mapDeep;
                if (_local_2 != this.target.mapZ){
                    this.target.setMapZ(_local_2);
                };
                this.target.mapDeep = _local_3;
            };
        }

        override public function uninstall():void
        {
            super.uninstall();
            this._arg = null;
            this._toFlow = null;
        }

        override public function getType():String
        {
            return (ScenePropertyType.RELATIVE_FOLLOW);
        }

        override public function getArg():PropertyArg
        {
            return (this._arg);
        }

        public function changeFollow(_arg_1:int, _arg_2:int):void
        {
            this._arg.followID = _arg_2;
            this._arg.layerID = _arg_1;
            var _local_3:ISceneLayer = AICore.Runtime.currentScene.getLayer(this._arg.layerID);
            if (_local_3){
                this._toFlow = _local_3.getNormalItemByID(_arg_2);
            };
        }

        public /*  ©init. */ function _SafeStr_1134()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1134 = " RelativeFollow" (String#17708)


