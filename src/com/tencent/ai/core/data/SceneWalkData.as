// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SceneWalkData

package com.tencent.ai.core.data
{
    import flash.events.EventDispatcher;
    import __AS3__.vec.Vector;
    import flash.geom.Rectangle;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.Constants;
    import flash.geom.Point;
    import  ©init._SafeStr_323;
    import __AS3__.vec.*;

    public class SceneWalkData extends EventDispatcher 
    {

        public static var isDrawWalk:Boolean;

        private var _width:int;
        private var _height:int;
        private var _numBlockPerOneWidth:int;
        private var _initWalkData:String;
        private var _walkDataMatrix:Vector.<Vector.<int>>;
        private var _rectRef:Vector.<Rectangle>;
        public var scene:IScene;


        public function get walkDataMatrix():Vector.<Vector.<int>>
        {
            return (this._walkDataMatrix);
        }

        public function get unwalkableRects():Vector.<Rectangle>
        {
            return (this._rectRef);
        }

        public function setInitWalkData(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            var _local_6:String;
            var _local_7:Vector.<int>;
            var _local_8:int;
            this._width = _arg_1;
            this._height = _arg_2;
            this._numBlockPerOneWidth = Math.ceil((_arg_1 / Constants.WALK_SIZE));
            this._initWalkData = _arg_3;
            var _local_4:int = Math.ceil((_arg_2 / Constants.WALK_SIZE));
            this._walkDataMatrix = new Vector.<Vector.<int>>(_local_4, true);
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _arg_3.substr((_local_5 * this._numBlockPerOneWidth), this._numBlockPerOneWidth);
                _local_7 = new Vector.<int>(this._numBlockPerOneWidth, true);
                _local_8 = 0;
                while (_local_8 < this._numBlockPerOneWidth) {
                    _local_7[_local_8] = int(_local_6.charAt(_local_8));
                    _local_8++;
                };
                this._walkDataMatrix[_local_5] = _local_7;
                _local_5++;
            };
            this._rectRef = new Vector.<Rectangle>();
        }

        public function getInitWalkData():String
        {
            return (this._initWalkData);
        }

        public function isWalkable(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_3:Point = this.translate(_arg_1, _arg_2);
            if (!_local_3){
                return (false);
            };
            return ((this._walkDataMatrix[_local_3.y][_local_3.x] > 0));
        }

        public function isWalkable2(_arg_1:int, _arg_2:int):Boolean
        {
            return ((this._walkDataMatrix[_arg_2][_arg_1] > 0));
        }

        private function translate(_arg_1:int, _arg_2:int):Point
        {
            if ((((((((_arg_1 < 0)) || ((_arg_1 >= this._width)))) || ((_arg_2 < 0)))) || ((_arg_2 >= this._height)))){
                return (null);
            };
            var _local_3:int = int((_arg_1 / Constants.WALK_SIZE));
            var _local_4:int = int((_arg_2 / Constants.WALK_SIZE));
            return (new Point(_local_3, _local_4));
        }

        public function addUnwalkable(_arg_1:Rectangle):void
        {
            var _local_4:Point;
            var _local_6:int;
            var _local_2:int = _arg_1.right;
            var _local_3:int = _arg_1.bottom;
            this._rectRef.push(_arg_1);
            var _local_5:int = _arg_1.y;
            while (_local_5 <= _local_3) {
                _local_6 = _arg_1.x;
                while (_local_6 <= _local_2) {
                    _local_4 = this.translate(_local_6, _local_5);
                    if (_local_4){
                        this.setWalkable(_local_4.x, _local_4.y);
                    };
                    _local_6 = (_local_6 + 5);
                };
                _local_5 = (_local_5 + 5);
            };
        }

        public function removeUnwalkable(_arg_1:Rectangle):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Point;
            var _local_6:int;
            var _local_7:int;
            var _local_2:int = this._rectRef.indexOf(_arg_1);
            if (_local_2 != -1){
                this._rectRef.splice(_local_2, 1);
                _local_3 = _arg_1.right;
                _local_4 = _arg_1.bottom;
                _local_6 = _arg_1.y;
                while (_local_6 <= _local_4) {
                    _local_7 = _arg_1.x;
                    while (_local_7 <= _local_3) {
                        _local_5 = this.translate(_local_7, _local_6);
                        if (_local_5){
                            this.setWalkable(_local_5.x, _local_5.y, true);
                        };
                        _local_7 = (_local_7 + 5);
                    };
                    _local_6 = (_local_6 + 5);
                };
            };
        }

        public function minMax(_arg_1:int, _arg_2:int):Point
        {
            var _local_3:Point = new Point(_arg_1, _arg_1);
            _local_3.x = (_local_3.x - 20);
            while (this.isWalkable(_local_3.x, _arg_2)) {
                _local_3.x = (_local_3.x - 20);
            };
            _local_3.x = (_local_3.x + 20);
            _local_3.y = (_local_3.y + 20);
            while (this.isWalkable(_local_3.y, _arg_2)) {
                _local_3.y = (_local_3.y + 20);
            };
            _local_3.y = (_local_3.y - 20);
            return (_local_3);
        }

        private function setWalkable(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            if ((((((((_arg_1 > 0)) && ((_arg_2 > 0)))) && ((_arg_2 < this._walkDataMatrix.length)))) && ((_arg_1 < this._walkDataMatrix[_arg_2].length)))){
                this._walkDataMatrix[_arg_2][_arg_1] = (this._walkDataMatrix[_arg_2][_arg_1] + ((_arg_3) ? 1 : -1));
            };
        }

        public /*  ©init. */ function _SafeStr_323()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_323 = " SceneWalkData" (String#15659)


