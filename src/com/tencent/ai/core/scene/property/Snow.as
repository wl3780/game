// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.property.Snow

package com.tencent.ai.core.scene.property
{
    import com.tencent.ai.core.data.arg.sceneProperty.SnowArg;
    import com.tencent.ai.core.scene.ICamera;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.scene.NormalItem;
    import com.tencent.ai.core.data.arg.sceneProperty.PropertyArg;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.data.SceneItemInfo;
    import com.tencent.ai.core.enum.ScenePropertyType;
    import com.tencent.ai.core.enum.ElementType;
    import  ©init._SafeStr_1135;
    import __AS3__.vec.*;

    public class Snow extends AbstractProperty 
    {

        private var arg:SnowArg;
        private var camera:ICamera;
        private var itemList:Vector.<NormalItem>;
        private var speedVXList:Vector.<Number>;
        private var speedVZList:Vector.<Number>;
        private var _target:NormalItem;


        override public function init(_arg_1:PropertyArg):void
        {
            this.arg = (_arg_1 as SnowArg);
        }

        override public function install(_arg_1:BaseElement):void
        {
            super.install(_arg_1);
            this._target = (_arg_1 as NormalItem);
            this.itemList = new Vector.<NormalItem>();
            this.speedVXList = new Vector.<Number>();
            this.speedVZList = new Vector.<Number>();
            this.itemList.push(_arg_1);
            this.speedVXList.push(this.execSpeedVX());
            this.speedVZList.push(this.execSpeedVZ());
        }

        override public function render():void
        {
            var _local_3:IScene;
            var _local_4:SceneItemInfo;
            var _local_5:NormalItem;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Number;
            var _local_9:int;
            var _local_10:NormalItem;
            var _local_11:int;
            var _local_12:int;
            if (!this.camera){
                _local_3 = (this.target.getParentContainer() as IScene);
                this.camera = _local_3.getCamera();
                _local_6 = this._target.layer.getLayerID();
                _local_7 = 0;
                while (_local_7 < this.arg.num) {
                    _local_4 = this._target.getInfo().clone();
                    _local_4.removeProperty(ScenePropertyType.SNOW);
                    _local_4.x = (Math.random() * this.camera.viewWidth);
                    _local_4.z = (Math.random() * this.camera.viewHeight);
                    _local_5 = (_local_3.createElement(ElementType.ET_NORMALITEM, _local_4, false) as NormalItem);
                    _local_5.create();
                    _local_8 = (1 - ((1 - this.arg.minScale) * Math.random()));
                    _local_5.getDisplay().scaleX = _local_8;
                    _local_5.getDisplay().scaleY = _local_8;
                    _local_3.addElementAt(_local_6, _local_5);
                    this._target.layer.pushNormalItem(_local_5);
                    this.itemList.push(_local_5);
                    _local_9 = (((_local_8 > 0.8)) ? 1 : 0);
                    this.speedVXList.push((((Math.random() > 0.6)) ? (this.execSpeedVX() + _local_9) : 0));
                    this.speedVZList.push((this.execSpeedVZ() + _local_9));
                    _local_7++;
                };
                this._target.layer.sort();
                this.itemList.fixed = true;
            };
            var _local_1:int = this.itemList.length;
            var _local_2:int;
            while (_local_2 < _local_1) {
                _local_10 = this.itemList[_local_2];
                _local_11 = this.speedVZList[_local_2];
                _local_12 = this.speedVXList[_local_2];
                _local_10.setMapXZY((_local_12 + _local_10.mapX), (_local_11 + _local_10.mapZ), 0);
                if (_local_10.mapZ > (this.camera.offsetY + this.camera.viewHeight)){
                    _local_10.setMapZ((this.camera.offsetY - _local_10.getDisplay().height));
                    _local_10.setMapX((Math.random() * this.camera.viewWidth));
                };
                if (_local_10.mapX < this.camera.offsetX){
                    _local_10.setMapX((_local_10.mapX + this.camera.viewWidth));
                } else {
                    if (_local_10.mapX > (this.camera.offsetX + this.camera.viewWidth)){
                        _local_10.setMapX((_local_10.mapX - this.camera.viewWidth));
                    };
                };
                _local_2++;
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
            this.itemList.length = 0;
            this.speedVXList.length = 0;
            this.speedVZList.length = 0;
            this.itemList = null;
            this.speedVXList = null;
            this.speedVZList = null;
            this.arg = null;
            super.uninstall();
        }

        override public function getType():String
        {
            return (ScenePropertyType.SNOW);
        }

        override public function getArg():PropertyArg
        {
            return (this.arg);
        }

        private function execSpeedVX():Number
        {
            return ((((Math.random() * this.arg.maxSpeedVZ) + 1) * ((Math.random() * 4) - 2)));
        }

        private function execSpeedVZ():Number
        {
            return (((Math.random() * this.arg.maxSpeedVZ) + 1));
        }

        public /*  ©init. */ function _SafeStr_1135()
        {
        }


    }
}//package com.tencent.ai.core.scene.property

// _SafeStr_1135 = " Snow" (String#16523)


