package com.tencent.ai.core.data
{
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.scene.IScene;
    
    import flash.events.EventDispatcher;
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class SceneWalkData extends EventDispatcher 
    {

        public static var isDrawWalk:Boolean;

        public var scene:IScene;

        private var _width:int;
        private var _height:int;
        private var _numBlockPerOneWidth:int;
        private var _initWalkData:String;
        private var _walkDataMatrix:Vector.<Vector.<int>>;
        private var _rectRef:Vector.<Rectangle>;

        public function get walkDataMatrix():Vector.<Vector.<int>>
        {
            return _walkDataMatrix;
        }

        public function get unwalkableRects():Vector.<Rectangle>
        {
            return _rectRef;
        }

        public function setInitWalkData(width:int, height:int, walkData:String):void
        {
            _width = width;
            _height = height;
            _numBlockPerOneWidth = Math.ceil(width / Constants.WALK_SIZE);
            _initWalkData = walkData;
            var rows:int = Math.ceil(height / Constants.WALK_SIZE);
            _walkDataMatrix = new Vector.<Vector.<int>>(rows, true);
            var row:int;
            while (row < rows) {
	            var rowData:String = walkData.substr(row * _numBlockPerOneWidth, _numBlockPerOneWidth);
	            var rowMatrix:Vector.<int> = new Vector.<int>(_numBlockPerOneWidth, true);
	            var col:int = 0;
                while (col < _numBlockPerOneWidth) {
                    rowMatrix[col] = int(rowData.charAt(col));
                    col++;
                }
                _walkDataMatrix[row] = rowMatrix;
                row++;
            }
            _rectRef = new Vector.<Rectangle>();
        }

        public function getInitWalkData():String
        {
            return _initWalkData;
        }

        public function isWalkable(x:int, y:int):Boolean
        {
            var p:Point = this.translate(x, y);
            if (!p) {
                return false;
            }
            return _walkDataMatrix[p.y][p.x] > 0;
        }

        public function isWalkable2(col:int, row:int):Boolean
        {
            return _walkDataMatrix[row][col] > 0;
        }

        private function translate(x:int, y:int):Point
        {
            if (x < 0 || x >= _width || y < 0 || y >= _height) {
                return null;
            }
            var col:int = int(x / Constants.WALK_SIZE);
            var row:int = int(y / Constants.WALK_SIZE);
            return new Point(col, row);
        }

        public function addUnwalkable(rect:Rectangle):void
        {
            _rectRef.push(rect);
            var right:int = rect.right;
            var bottom:int = rect.bottom;
            var startY:int = rect.y;
            while (startY <= bottom) {
	            var startX:int = rect.x;
                while (startX <= right) {
		            var p:Point = this.translate(startX, startY);
                    if (p) {
                        this.setWalkable(p.x, p.y, false);
                    }
                    startX = startX + 5;	//5是什么MagicNumber
                }
                startY = startY + 5;	//5是什么MagicNumber
            }
        }

        public function removeUnwalkable(rect:Rectangle):void
        {
            var index:int = _rectRef.indexOf(rect);
            if (index != -1) {
                _rectRef.splice(index, 1);
            	var right:int = rect.right;
	            var bottom:int = rect.bottom;
	            var startY:int = rect.y;
                while (startY <= bottom) {
		            var startX:int = rect.x;
                    while (startX <= right) {
			            var p:Point = this.translate(startX, startY);
                        if (p) {
                            this.setWalkable(p.x, p.y, true);
                        }
                        startX = startX + 5;
                    }
                    startY = startY + 5;
                }
            }
        }

        public function minMax(x:int, y:int):Point
        {
            var p:Point = new Point(x, x);
            p.x = p.x - 20;
            while (this.isWalkable(p.x, y)) {
                p.x = p.x - 20;
            }
            p.x = p.x + 20;
			
            p.y = p.y + 20;
            while (this.isWalkable(p.y, y)) {
                p.y = p.y + 20;
            }
            p.y = p.y - 20;
            return p;
        }

        private function setWalkable(col:int, row:int, flag:Boolean=false):void
        {
            if (col > 0 && row > 0 && row < _walkDataMatrix.length && col < _walkDataMatrix[row].length) {
                _walkDataMatrix[row][col] = _walkDataMatrix[row][col] + (flag ? 1 : -1);
            }
        }

    }
}
