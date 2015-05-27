// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.scene.Camera

package com.tencent.ai.core.scene
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.element.BaseElement;
    import flash.geom.Rectangle;
    import com.tencent.ai.core.events.CameraEvent;
    import flash.geom.Point;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.enum.ShakeDirection;
    import com.tencent.ai.core.data.MapPosition;

    public class Camera extends EventDispatcher implements ICamera 
    {

        private static const PLAYER_LOCATION_Y_DISTANCE:int = 130;
        private static const MAP_TOP_OFFSET_Y:int = 50;

        private var _scene:IScene;
        private var _sceneDisplay:IDisplay;
        private var _focus:BaseElement;
        private var _catchFocus:BaseElement;
        private var _viewWidth:int = 940;
        private var _viewHeight:int = 560;
        private var halfViewWidth:int;
        private var halfViewHeight:int;
        private var maxLocationX:int;
        private var maxLocationY:int;
        private var isOut:Boolean = true;
        private var _shakeTimes:int;
        private var _shakeDirection:int;
        private var _shakeRadius:int;
        private var _moveShake:int = -1;
        private var _offsetLocationY:int;
        private var _isFollowFocus:Boolean = true;
        private var _locateToX:Number = 0;
        private var _locateToY:Number = 0;
        private var oldScrollRect:Rectangle;
        private var _changeEvent:CameraEvent;
        private var _offsetPoint:Point;

        public function Camera()
        {
            this._changeEvent = new CameraEvent(CameraEvent.CHANGE);
        }

        public function attachScene(_arg_1:IScene):void
        {
            this._scene = _arg_1;
            this._sceneDisplay = _arg_1.getDisplay();
            this.oldScrollRect = new Rectangle();
            this.viewWidth = this._viewWidth;
            this.viewHeight = this._viewHeight;
            this._offsetPoint = new Point();
        }

        public function shake(_arg_1:int, _arg_2:int=25, _arg_3:int=10):void
        {
            this._shakeDirection = _arg_1;
            this._shakeTimes = _arg_2;
            this._shakeRadius = _arg_3;
        }

        public function setFocus(_arg_1:BaseElement):void
        {
            var _local_2:int;
            var _local_3:int;
            if ((((this._focus == null)) && (!((_arg_1 == null))))){
                _local_2 = (this.adjustLocationY(_arg_1.mapZ) - _arg_1.mapY);
                _local_2 = this.adjustLocationY(_local_2);
                _local_3 = this.adjustLocationX(_arg_1.mapX);
                this.locateAtWidthoutUpdate(_local_3, _local_2);
            };
            this._focus = _arg_1;
            this.update();
        }

        public function getFocus():BaseElement
        {
            return (this._focus);
        }

        public function locateTo(_arg_1:Number, _arg_2:Number):void
        {
            this._locateToX = this.adjustLocationX(_arg_1);
            this._locateToY = this.adjustLocationY(_arg_2);
        }

        public function locateAt(_arg_1:Number, _arg_2:Number):void
        {
            _arg_1 = this.adjustLocationX(_arg_1);
            _arg_2 = this.adjustLocationY(_arg_2);
            this.locateAtWidthoutUpdate(_arg_1, _arg_2);
            this._locateToX = _arg_1;
            this._locateToY = _arg_2;
            this.update();
        }

        private function locateAtWidthoutUpdate(_arg_1:Number, _arg_2:Number):void
        {
            var _local_3:int = (_arg_1 - this.halfViewWidth);
            var _local_4:int = (_arg_2 - this.halfViewHeight);
            if (((!((_local_3 == this.oldScrollRect.x))) || (!((_local_4 == this.oldScrollRect.y))))){
                this.oldScrollRect.x = _local_3;
                this.oldScrollRect.y = _local_4;
                this._sceneDisplay.x = (0 - this.oldScrollRect.x);
                this._sceneDisplay.y = (0 - this.oldScrollRect.y);
                this.dispatchEvent(this._changeEvent);
            };
        }

        private function adjustLocationX(_arg_1:Number):int
        {
            if (_arg_1 < this.halfViewWidth){
                _arg_1 = this.halfViewWidth;
            } else {
                if (_arg_1 > this.maxLocationX){
                    _arg_1 = this.maxLocationX;
                };
            };
            return (_arg_1);
        }

        private function adjustLocationY(_arg_1:Number, _arg_2:int=0):int
        {
            if (_arg_1 < (this.halfViewHeight + _arg_2)){
                _arg_1 = (this.halfViewHeight + _arg_2);
            } else {
                if (_arg_1 > this.maxLocationY){
                    _arg_1 = this.maxLocationY;
                };
            };
            return (_arg_1);
        }

        public function getOffset():Point
        {
            this._offsetPoint.x = this.oldScrollRect.x;
            this._offsetPoint.y = this.oldScrollRect.y;
            return (this._offsetPoint);
        }

        public function get offsetX():Number
        {
            return (this.oldScrollRect.x);
        }

        public function get offsetY():Number
        {
            return (this.oldScrollRect.y);
        }

        public function get isFollowFocus():Boolean
        {
            return (this._isFollowFocus);
        }

        public function set isFollowFocus(_arg_1:Boolean):void
        {
            this._isFollowFocus = _arg_1;
        }

        public function get viewWidth():int
        {
            return (this._viewWidth);
        }

        public function set viewWidth(_arg_1:int):void
        {
            this._viewWidth = _arg_1;
            this.oldScrollRect.width = int((_arg_1 / this.zoom));
            if (this.oldScrollRect.width > this._scene.mapWidth){
                this.oldScrollRect.width = this._scene.mapWidth;
            };
            this._sceneDisplay.x = (0 - this.oldScrollRect.x);
            this._sceneDisplay.y = (0 - this.oldScrollRect.y);
            this.halfViewWidth = (this.oldScrollRect.width / 2);
            this.maxLocationX = (this._scene.mapWidth - this.halfViewWidth);
            this.dispatchEvent(this._changeEvent);
        }

        public function get viewHeight():int
        {
            return (this._viewHeight);
        }

        public function set viewHeight(_arg_1:int):void
        {
            this._viewHeight = _arg_1;
            this.oldScrollRect.height = int((_arg_1 / this.zoom));
            if (this.oldScrollRect.height > this._scene.mapHeight){
                this.oldScrollRect.height = this._scene.mapHeight;
            };
            this._sceneDisplay.x = (0 - this.oldScrollRect.x);
            this._sceneDisplay.y = (0 - this.oldScrollRect.y);
            this.halfViewHeight = (this.oldScrollRect.height / 2);
            this.maxLocationY = (this._scene.mapHeight - this.halfViewHeight);
            this.dispatchEvent(this._changeEvent);
        }

        public function get locationX():Number
        {
            return ((this.oldScrollRect.x + this.halfViewWidth));
        }

        public function get locationY():Number
        {
            return ((this.oldScrollRect.y + this.halfViewHeight));
        }

        public function get location():Point
        {
            return (new Point(this.locationX, this.locationY));
        }

        public function update():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_1:int = this.locationX;
            var _local_2:int = this.locationY;
            if (this._isFollowFocus){
                if (this._focus){
                    _local_3 = _local_1;
                    _local_5 = (this._focus.mapX - _local_1);
                    if ((_local_5 * _local_5) > (Constants.CAMERA_OUT_DISTANCE * Constants.CAMERA_OUT_DISTANCE)){
                        _local_3 = (_local_3 + (_local_5 + (((_local_5 < 0)) ? Constants.CAMERA_OUT_DISTANCE : -(Constants.CAMERA_OUT_DISTANCE))));
                    };
                    _local_3 = this.adjustLocationX(_local_3);
                    _local_5 = (_local_3 - _local_1);
                    if ((_local_5 * _local_5) > 400){
                        _local_3 = (_local_1 + (_local_5 * 0.25));
                    };
                    _local_4 = (this._focus.mapZ - PLAYER_LOCATION_Y_DISTANCE);
                    _local_4 = (this.adjustLocationY(_local_4, MAP_TOP_OFFSET_Y) - (this._focus.mapY * 0.3));
                    _local_4 = this.adjustLocationY(_local_4);
                    if (((!((_local_3 == _local_1))) || (!((_local_4 == _local_1))))){
                        this.locateAtWidthoutUpdate(_local_3, _local_4);
                    };
                };
            } else {
                if (((!((this._locateToX == _local_1))) || (!((this._locateToY == _local_2))))){
                    _local_6 = (this._locateToX - _local_1);
                    _local_7 = (this._locateToY - _local_2);
                    _local_3 = ((((_local_6 * _local_6))<16) ? this._locateToX : ((_local_1 + (_local_6 * 0.3))));
                    _local_4 = ((((_local_7 * _local_7))<9) ? this._locateToY : (_local_2 + (_local_7 * 0.2)));
                    this.locateAtWidthoutUpdate(_local_3, _local_4);
                };
            };
            if (this._shakeTimes > -1){
                if ((((this._shakeTimes > 0)) && ((this._shakeRadius > 0)))){
                    switch (this._shakeDirection){
                        case ShakeDirection.X:
                            this._sceneDisplay.x = ((this._shakeRadius * this._moveShake) - this.oldScrollRect.x);
                            break;
                        case ShakeDirection.Y:
                            this._sceneDisplay.y = ((this._shakeRadius * this._moveShake) - this.oldScrollRect.y);
                            break;
                        case ShakeDirection.X_Y:
                            this._sceneDisplay.x = ((this._shakeRadius * this._moveShake) - this.oldScrollRect.x);
                            this._sceneDisplay.y = ((this._shakeRadius * this._moveShake) - this.oldScrollRect.y);
                            break;
                    };
                    this._moveShake = (this._moveShake * -1);
                } else {
                    this._sceneDisplay.x = (0 - this.oldScrollRect.x);
                    this._sceneDisplay.y = (0 - this.oldScrollRect.y);
                };
                this._shakeTimes--;
            };
        }

        public function offsetLocationY(_arg_1:int):void
        {
            this.viewHeight = (this.viewHeight + (_arg_1 - this._offsetLocationY));
            this.locateAt(this.locationX, this.locationY);
            this._offsetLocationY = _arg_1;
        }

        public function catchFocus():void
        {
            if (!this._catchFocus){
                this._catchFocus = this._focus;
            };
        }

        public function releaseFocus():void
        {
            if (this._catchFocus){
                this.setFocus(this._catchFocus);
                this._catchFocus = null;
            };
        }

        public function set zoom(_arg_1:Number):void
        {
            var _local_2:Number = (this._viewWidth / this._scene.mapWidth);
            var _local_3:Number = (this._viewHeight / this._scene.mapHeight);
            var _local_4:Number = (((_local_2 > _local_3)) ? _local_2 : _local_3);
            if (_arg_1 < _local_4){
                _arg_1 = _local_4;
            };
            this._sceneDisplay.scaleX = _arg_1;
            this._sceneDisplay.scaleY = _arg_1;
            this.viewWidth = this._viewWidth;
            this.viewHeight = this._viewHeight;
            this.locateAt(this.locationX, this.locationY);
        }

        public function get zoom():Number
        {
            return (this._sceneDisplay.scaleX);
        }

        public function inCamera(_arg_1:Rectangle):Boolean
        {
            if ((((_arg_1.width == 0)) || ((_arg_1.height == 0)))){
                return (true);
            };
            if (((((((((_arg_1.y + _arg_1.height) < this.oldScrollRect.y)) || ((_arg_1.y > (this.oldScrollRect.y + this.oldScrollRect.height))))) || (((_arg_1.x + _arg_1.width) < this.oldScrollRect.x)))) || ((_arg_1.x > (this.oldScrollRect.x + this.oldScrollRect.width))))){
                return (false);
            };
            return (true);
        }

        public function localToGlobal(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Point=null):Point
        {
            var _local_5:Number = this.zoom;
            _arg_4 = ((_arg_4) || (new Point()));
            _arg_4.x = ((_arg_1 - this.offsetX) * _local_5);
            _arg_4.y = (((_arg_3 - _arg_2) - this.offsetY) * _local_5);
            return (_arg_4);
        }

        public function globalToLocal(_arg_1:int, _arg_2:int, _arg_3:MapPosition=null):MapPosition
        {
            var _local_4:Number = this.zoom;
            _arg_3 = ((_arg_3) || (new MapPosition()));
            _arg_3.x = ((_arg_1 / _local_4) + this.offsetX);
            _arg_3.z = ((_arg_2 / _local_4) + this.offsetY);
            _arg_3.y = 0;
            return (_arg_3);
        }


    }
}//package com.tencent.ai.core.scene

