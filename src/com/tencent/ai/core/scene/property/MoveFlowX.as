// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.MoveFlowX

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.MoveFlowArg;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.NormalItem;
    import com.tencent.ai.core.scene.ICamera;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1127;
    import __AS3__.vec.*;

    public class MoveFlowX extends AbstractProperty 
    {

        private var arg:MoveFlowArg;
        private var itemList:Vector.<NormalItem>;
        private var firstIndex:int;
        private var lastIndex:int;
        private var w:int;
        private var camera:ICamera;
        private var _target:NormalItem;
        private var targetWidth:int;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as MoveFlowArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            this._target = (_arg_1 as NormalItem);
            this.itemList = new Vector.<NormalItem>();
            this.itemList.push(this.target);
        }

        override public function render():void
        {
            var _local_1:IScene;
            var _local_2:SceneItemInfo;
            var _local_3:int;
            var _local_4:int;
            var _local_5:NormalItem;
            var _local_6:Boolean;
            var _local_7:NormalItem;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:NormalItem;
            if (!this.camera){
                if (((this.target.getDisplay()) && (this.target.getDisplay().width))){
                    this.targetWidth = this.target.getDisplay().width;
                    _local_1 = (this.target.getParentContainer() as IScene);
                    this.camera = _local_1.getCamera();
                    _local_2 = this._target.getInfo().clone();
                    _local_2.removeProperty(ScenePropertyType.MOVE_FLOW_X);
                    this.w = (this.targetWidth + this.arg.gap);
                    if (this.arg.fullScreen){
                        _local_3 = Math.ceil((Constants.CAMERA_WIDTH / this.w));
                    } else {
                        this.target.setMapX(this.arg.start);
                        _local_3 = Math.ceil(((this.arg.end - this.arg.start) / this.w));
                    };
                    _local_4 = 0;
                    while (_local_4 < _local_3) {
                        _local_5 = (_local_1.createElement(ElementType.ET_NORMALITEM, _local_2, false) as NormalItem);
                        _local_5.create();
                        _local_1.addElementAt(this._target.layer.getLayerID(), _local_5);
                        this._target.layer.pushNormalItem(_local_5);
                        _local_5.setMapX(((this.target.mapX + this.w) + (_local_4 * this.w)));
                        this.itemList.push(_local_5);
                        _local_4++;
                    };
                    this.firstIndex = 0;
                    this.lastIndex = (this.itemList.length - 1);
                    this.itemList.fixed = true;
                    this._target.layer.sort();
                };
            } else {
                _local_6 = (this._target.getDirection() == -1);
                _local_8 = this.itemList.length;
                _local_10 = 0;
                while (_local_10 < _local_8) {
                    _local_7 = this.itemList[_local_10];
                    _local_7.setMapX((_local_7.mapX + this.arg.speed));
                    _local_9 = _local_7.mapDeep;
                    _local_7.setMapZ(this.target.mapZ);
                    _local_7.mapDeep = _local_9;
                    _local_10++;
                };
                _local_11 = ((this.arg.fullScreen) ? this.camera.offsetX : this.arg.start);
                _local_12 = ((this.arg.fullScreen) ? (this.camera.offsetX + this.camera.viewWidth) : this.arg.end);
                _local_13 = this.itemList[this.firstIndex];
                while ((_local_13.mapX - ((_local_6) ? this.targetWidth : 0)) > _local_11) {
                    _local_7 = this.itemList[this.lastIndex];
                    _local_7.setMapX((_local_13.mapX - this.w));
                    this.firstIndex = this.lastIndex;
                    this.lastIndex = ((this.lastIndex) ? (this.lastIndex - 1) : (_local_8 - 1));
                    _local_13 = this.itemList[this.firstIndex];
                };
                _local_13 = this.itemList[this.lastIndex];
                while ((_local_13.mapX + ((_local_6) ? 0 : this.w)) < _local_12) {
                    _local_7 = this.itemList[this.firstIndex];
                    _local_7.setMapX((_local_13.mapX + this.w));
                    this.lastIndex = this.firstIndex;
                    this.firstIndex = (((this.firstIndex == (_local_8 - 1))) ? 0 : (this.firstIndex + 1));
                    _local_13 = this.itemList[this.lastIndex];
                };
            };
        }

        override public function uninstall():void
        {
            var _local_2:NormalItem;
            var _local_1:IScene = (this.target.getParentContainer() as IScene);
            this.itemList.fixed = false;
            while (this.itemList.length > 1) {
                _local_2 = this.itemList.pop();
                if (_local_2.getParentContainer()){
                    _local_1.removeElementAt(_local_2.layer.getLayerID(), _local_2);
                };
            };
            this.arg = null;
            this.itemList.length = 0;
            this.itemList = null;
            super.uninstall();
        }

        override public function getArg():PropertyArg
        {
            return (this.arg);
        }

        override public function getType():String
        {
            return (ScenePropertyType.MOVE_FLOW_X);
        }

        public function changeSpeed(_arg_1:int):void
        {
            this.arg.speed = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_1127()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1127 = " MoveFlowX" (String#13931)


