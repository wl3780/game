package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class _basic extends Sprite
	{
		public function _basic()
		{
			super();
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// 插值
			//this.bitmapBasic();
			// 矩阵
			this.matrixBasic();
			// 齐次向量（第四位0）、齐次坐标（第四位w）概念
			//　视口变换（正交视口，投影视口） --> 变换矩阵
		}
		
		// 位图插值原理
		protected function bitmapBasic():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(evt:Event):void {
				bitmapTranslate(evt.target.content);
			});
			loader.load(new URLRequest("assets/lufei.png"));
		}
		private function bitmapTranslate(bitmap:Bitmap):void
		{
			this.addChild(bitmap);
			var bitdata:BitmapData = bitmap.bitmapData;
			
			var scaleXV:Number = 2;
			var scaleYV:Number = 0.5;
			var newdata:BitmapData = new BitmapData(bitdata.width * scaleXV, bitdata.height * scaleYV, bitdata.transparent);
			// 插值（缩放、翻转。。。），提供一种位图缩放、翻转等操作的思路
//			for (var _y:int = 0; _y < newdata.height; _y++) {
//				for (var _x:int = 0; _x < newdata.width; _x++) {
//					var color:uint = bitdata.getPixel32(_x/scaleXV, _y/scaleYV);
//					newdata.setPixel32(_x, _y, color);
//				}
//			}
			
			// 插值（纹理重复）
//			for (var _y:int = 0; _y < newdata.height; _y++) {
//				for (var _x:int = 0; _x < newdata.width; _x++) {
//					var color:uint = bitdata.getPixel32(_x%bitdata.width, _y%bitdata.height);
//					newdata.setPixel32(_x, _y, color);
//				}
//			}
			
			// 插值（UV）
			newdata = uvTranslate([0.3, 1.3], [0, 1], bitdata);
			
			var newmap:Bitmap = new Bitmap(newdata);
			newmap.x = bitdata.width + 2;
			this.addChild(newmap);
		}
		// U代表X轴的取样范围，V代表Y轴的取样范围，他们的范围值是0~1，1代表原图的最大值
		// UV贴图可以按照以下原理描述“位图的颜色”
		private function uvTranslate(uData:Array, vData:Array, bitdata:BitmapData):BitmapData
		{
			var du:Number = uData[1] - uData[0];
			var dv:Number = vData[1] - vData[0];
			var newdata:BitmapData = new BitmapData(bitdata.width*du, bitdata.height*dv, bitdata.transparent);
			for (var _y:int = 0; _y < newdata.height; _y++) {
				for (var _x:int = 0; _x < newdata.width; _x++) {
					var dx:Number = (uData[0] * bitdata.width + _x) % bitdata.width;
					var dy:Number = (vData[0] * bitdata.height + _y) % bitdata.height;
					var color:uint = bitdata.getPixel32(dx, dy);
					newdata.setPixel32(_x, _y, color);
				}
			}
			return newdata;
		}
		
		// 矩阵原理，“变换”实现的方式为：源向量经过“模板”矩阵变换后得到目标向量
		protected function matrixBasic():void
		{
			var A:Array = [[1,2]];
			var B:Array = [[1,1], [2,2]];
			var C:Array = matrixTranslate(A, B);
			trace(C);
		}
		// 目标的N行M列的值=源N行值与矩阵M列值乘值的和
		private function matrixTranslate(source:Array, matrix:Array):Array
		{
			if (!source || !matrix || source[0].length != matrix.length) {
				return null;
			}
			
			var target:Array = [];
			var row:int = source.length;
			var col:int = matrix[0].length;
			var mid:int = source[0].length;
			for (var i:int = 0; i < row; i++) {
				var sub:Array = [];
				for (var j:int = 0; j < col; j++) {
					var num:Number = 0;
					for (var k:int = 0; k < mid; k++) {
						num += source[i][k] * matrix[k][j];
					}
					sub.push(num);
				}
				target.push(sub);
			}
			return target;
		}
	}
}