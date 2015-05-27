// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.MoveFlowY

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
    import  ©init._SafeStr_1128;
    import __AS3__.vec.*;

    public class MoveFlowY extends AbstractProperty 
    {

        private var arg:MoveFlowArg;
        private var itemList:Vector.<NormalItem>;
        private var firstIndex:int;
        private var lastIndex:int;
        private var h:int;
        private var camera:ICamera;
        private var _target:NormalItem;


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
            var _local_6:NormalItem;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:NormalItem;
            if (!this.camera){
                if (((this.target.getDisplay()) && (this.target.getDisplay().height))){
                    _local_1 = (this.target.getParentContainer() as IScene);
                    this.camera = _local_1.getCamera();
                    _local_2 = this._target.getInfo().clone();
                    _local_2.removeProperty(ScenePropertyType.MOVE_FLOW_Y);
                    this.h = (this.target.getDisplay().height + this.arg.gap);
                    if (this.arg.fullScreen){
                        _local_3 = Math.ceil((Constants.CAMERA_HEIGHT / this.h));
                    } else {
                        this.target.setMapZ(this.arg.start);
                        this.target.mapDeep = this.target.id;
                        _local_3 = Math.ceil(((this.arg.end - this.arg.start) / this.h));
                    };
                    _local_4 = 0;
                    while (_local_4 < _local_3) {
                        _local_5 = (_local_1.createElement(ElementType.ET_NORMALITEM, _local_2, false) as NormalItem);
                        _local_5.create();
                        _local_1.addElementAt(this._target.layer.getLayerID(), _local_5);
                        this._target.layer.pushNormalItem(_local_5);
                        _local_5.setMapZ(((this.target.mapZ + this.h) + (_local_4 * this.h)));
                        _local_5.mapDeep = this.target.id;
                        this.itemList.push(_local_5);
                        _local_4++;
                    };
                    this.firstIndex = 0;
                    this.lastIndex = (this.itemList.length - 1);
                    this.itemList.fixed = true;
                    this._target.layer.sort();
                };
            } else {
                _local_7 = this.itemList.length;
                _local_8 = 0;
                while (_local_8 < _local_7) {
                    _local_6 = this.itemList[_local_8];
                    _local_6.setMapX(this.target.mapX);
                    _local_6.setMapZ((_local_6.mapZ + this.arg.speed));
                    _local_6.mapDeep = this.target.id;
                    _local_8++;
                };
                _local_9 = ((this.arg.fullScreen) ? this.camera.offsetY : this.arg.start);
                _local_10 = ((this.arg.fullScreen) ? (this.camera.offsetY + this.camera.viewHeight) : this.arg.end);
                _local_11 = this.itemList[this.firstIndex];
                while (_local_11.mapZ > _local_9) {
                    _local_6 = this.itemList[this.lastIndex];
                    _local_6.setMapZ((_local_11.mapZ - this.h));
                    this.firstIndex = this.lastIndex;
                    this.lastIndex = ((this.lastIndex) ? (this.lastIndex - 1) : (_local_7 - 1));
                    _local_11 = this.itemList[this.firstIndex];
                };
                _local_11 = this.itemList[this.lastIndex];
                while ((_local_11.mapZ + this.h) < _local_10) {
                    _local_6 = this.itemList[this.firstIndex];
                    _local_6.setMapZ((_local_11.mapZ + this.h));
                    this.lastIndex = this.firstIndex;
                    this.firstIndex = (((this.firstIndex == (_local_7 - 1))) ? 0 : (this.firstIndex + 1));
                    _local_11 = this.itemList[this.lastIndex];
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
                _local_1.removeElementAt(_local_2.layer.getLayerID(), _local_2);
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
            return (ScenePropertyType.MOVE_FLOW_Y);
        }

        public function changeSpeed(_arg_1:int):void
        {
            this.arg.speed = _arg_1;
        }

        public /*  ©init. */ function _SafeStr_1128()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1128 = " MoveFlowY" (String#13934)


