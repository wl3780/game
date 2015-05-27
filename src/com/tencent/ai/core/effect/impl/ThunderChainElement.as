// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.ThunderChainElement

package com.tencent.ai.core.effect.impl
{
    import com.tencent.ai.core.effect.EffectElement;
    import com.tencent.ai.core.display.IShape;
    import com.tencent.ai.core.data.EffectInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.MapPosition;
    import flash.geom.Point;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.display.DisplaySystem;
    import flash.filters.GlowFilter;
    import  ©init._SafeStr_386;
    import __AS3__.vec.*;

    public class ThunderChainElement extends EffectElement 
    {

        private static const MIN_POINT_NUM:int = 5;
        public static const MAX_POINT_NUM:int = 6;
        private static const THIN_LINE_NUM:int = 1;
        private static const THICK_LINE_NUM:int = 3;
        private static const MIN_DIS_EQ_DIV_NUM:int = 10;
        private static const MAX_DIS_EQ_DIV_NUM:int = 20;
        private static const MIN_WAVE_PERCENT:Number = 0;
        private static const MAX_WAVE_PERCENT:Number = 0.67;
        private static const MIN_FRAME_NUM:int = 1;
        private static const MAX_FRAME_NUM:int = 2;

        private var disTime:uint;
        private var maxTime:uint;
        protected var m_shape:IShape;
        private var m_frameId:int;
        private var m_effectInfo:EffectInfo;
        private var _arg:Object;
        private var updateFuncArray:Vector.<MapPosition>;
        private var _p0:Point;
        private var _p1:Point;
        private var _drawPoints:Vector.<Point>;
        private var _lifeTimes:int;
        private var _ifMovie:Boolean;

        public function ThunderChainElement()
        {
            super(EffectType.THUNDER_CHAIN_EFFECT);
        }

        public function get drawPoints():Vector.<Point>
        {
            return (this._drawPoints);
        }

        override protected function initThis():void
        {
            super.initThis();
            this.m_shape = DisplaySystem.createShape();
            this.m_shape.filters = [new GlowFilter(39423, 1, 10, 10, 2.5)];
            m_display = this.m_shape;
            this.m_frameId = 0;
            this._ifMovie = true;
        }

        private function randomAMaxTime():void
        {
            var _local_1:Number = Math.random();
            if (_local_1 <= (4 / 7)){
                this.maxTime = MIN_FRAME_NUM;
            } else {
                if (_local_1 <= (6 / 7)){
                    this.maxTime = (MIN_FRAME_NUM + 1);
                } else {
                    this.maxTime = (MIN_FRAME_NUM + 2);
                };
            };
        }

        private function mapPosToPoint(_arg_1:MapPosition):Point
        {
            var _local_2:Point = new Point();
            _local_2.x = _arg_1.x;
            _local_2.y = (_arg_1.z - _arg_1.y);
            return (_local_2);
        }

        public function setElementArg(_arg_1:EffectInfo):void
        {
            this.m_effectInfo = _arg_1;
            this._arg = _arg_1.otherArg;
            this._p0 = this.mapPosToPoint(this._arg.p0);
            this._p1 = this.mapPosToPoint(this._arg.p1);
            this._lifeTimes = this._arg.life;
            this._ifMovie = this._arg.ifMovie;
            this.m_frameId = 0;
            this.disTime = 0;
            this.randomAMaxTime();
            this._drawPoints = this.randPoints(this._p0, this._p1);
        }

        override public function render(_arg_1:int):void
        {
            if (((((this.m_frameId + 2) < this._drawPoints.length)) && (this._ifMovie))){
                this.drawAllPoints(this.m_shape, this._drawPoints.slice(0, (this.m_frameId + 2)));
            } else {
                var _local_2 = this;
                var _local_3 = (_local_2.disTime + 1);
                _local_2.disTime = _local_3;
                if (this.disTime >= this.maxTime){
                    this.freshNewPoints();
                    this.disTime = 0;
                    this.randomAMaxTime();
                };
            };
            if (this._lifeTimes >= this.m_frameId){
            };
            this.m_frameId++;
        }

        private function freshNewPoints():void
        {
            this.m_shape.graphics.clear();
            this._drawPoints = this.randPoints(this._p0, this._p1);
            this.drawAllPoints(this.m_shape, this._drawPoints);
        }

        private function drawAllPoints(_arg_1:IShape, _arg_2:Vector.<Point>):void
        {
            var _local_4:uint;
            var _local_3:uint = _arg_2.length;
            if (_local_3 == 0){
                return;
            };
            var _local_5:uint = (((Math.random() < 0.15)) ? THICK_LINE_NUM : THIN_LINE_NUM);
            _arg_1.graphics.lineStyle((_local_5 + 5), 39423);
            _arg_1.graphics.lineStyle(_local_5, 0xFFFFFF);
            _arg_1.graphics.moveTo(_arg_2[0].x, _arg_2[0].y);
            _local_4 = 0;
            while (_local_4 < (_local_3 - 1)) {
                _arg_1.graphics.lineTo(_arg_2[(_local_4 + 1)].x, _arg_2[(_local_4 + 1)].y);
                _local_4++;
            };
        }

        private function fromDisToExpandRate(_arg_1:Number):Number
        {
            if (_arg_1 > 400){
                return (2);
            };
            if (_arg_1 > 200){
                return (1.2);
            };
            if (_arg_1 > 100){
                return (0.5);
            };
            if (_arg_1 > 40){
                return (0.2);
            };
            return (0.1);
        }

        private function randPoints(_arg_1:Point, _arg_2:Point, _arg_3:Boolean=true, _arg_4:Boolean=true):Vector.<Point>
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:Number;
            var _local_8:Boolean;
            var _local_11:Point;
            var _local_12:Number;
            var _local_9:Vector.<Point> = new Vector.<Point>();
            if (_arg_3){
                _local_9.push(_arg_1);
            };
            _local_7 = Point.distance(_arg_1, _arg_2);
            _local_5 = ((((Math.random() - 0.5) > 0)) ? 1 : -1);
            _local_6 = ((Math.random() * (MAX_POINT_NUM - MIN_POINT_NUM)) + MIN_POINT_NUM);
            var _local_10:uint;
            while (_local_10 < _local_6) {
                _local_11 = new Point();
                _local_12 = ((Math.random() * (MAX_DIS_EQ_DIV_NUM - MIN_DIS_EQ_DIV_NUM)) + MIN_DIS_EQ_DIV_NUM);
                _local_12 = (_local_12 * this.fromDisToExpandRate(_local_7));
                _local_11 = Point.interpolate(_arg_1, _arg_2, (1 - ((1 / (_local_6 + 1)) * ((_local_10 + 1) + (((((Math.random() - 0.5) > 0)) ? 1 : -1) * ((Math.random() * (MAX_WAVE_PERCENT - MIN_WAVE_PERCENT)) + MIN_WAVE_PERCENT))))));
                _local_11.x = (_local_11.x + (((((_arg_2.x - _arg_1.x) == 0)) ? _local_12 : (_local_12 * Math.sin(Math.atan(((_arg_2.y - _arg_1.y) / (_arg_2.x - _arg_1.x)))))) * _local_5));
                _local_11.y = (_local_11.y + (((((_arg_2.y - _arg_1.y) == 0)) ? _local_12 : (_local_12 * Math.cos(Math.atan(((_arg_2.y - _arg_1.y) / (_arg_2.x - _arg_1.x)))))) * -(_local_5)));
                _local_5 = (_local_5 * -1);
                _local_9.push(_local_11);
                _local_10++;
            };
            if (_arg_4){
                _local_9.push(_arg_2);
            };
            return (_local_9);
        }

        override public function end():void
        {
            super.end();
        }

        override public function reset():void
        {
            if (this.m_shape != null){
                this.m_shape.graphics.clear();
            };
            super.reset();
        }

        private function clearAll():void
        {
            this.m_effectInfo = null;
            this.updateFuncArray = new Vector.<MapPosition>();
        }

        public /*  ©init. */ function _SafeStr_386()
        {
        }


    }
}//package com.tencent.ai.core.effect.impl

// _SafeStr_386 = " ThunderChainElement" (String#15854)


