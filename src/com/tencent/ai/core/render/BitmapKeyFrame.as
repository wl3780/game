// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.BitmapKeyFrame

package com.tencent.ai.core.render
{
    import flash.display.BitmapData;
    import com.tencent.ai.core.utils.RectArea;
    import flash.geom.Rectangle;
    import  ©init._SafeStr_1102;

    public class BitmapKeyFrame 
    {

        public static var NULL:BitmapKeyFrame = new (BitmapKeyFrame)();

        public var eventType:String = "";
        public var fireEventTime:int = -1;
        public var usePlayRate:Boolean = true;
        public var scripts:Array;
        public var x:int;
        public var y:int;
        public var alpha:Number;
        public var dAlpha:Number;
        public var rotation:int;
        public var scaleX:Number;
        public var scaleY:Number;
        public var times:int;
        public var data:BitmapData;
        public var ac:RectArea;
        public var hcs:Array;
        public var sourceRect:Rectangle;
        protected var m_sourceX:int;
        protected var m_sourceY:int;

        public function BitmapKeyFrame(_arg_1:int=0, _arg_2:int=0, _arg_3:Number=1, _arg_4:Number=0, _arg_5:int=0, _arg_6:Number=1, _arg_7:Number=1, _arg_8:BitmapData=null, _arg_9:String="", _arg_10:int=1, _arg_11:int=-1, _arg_12:Boolean=true, _arg_13:Array=null)
        {
            this.x = (this.m_sourceX = _arg_1);
            this.y = (this.m_sourceY = _arg_2);
            this.alpha = _arg_3;
            this.dAlpha = _arg_4;
            this.rotation = _arg_5;
            this.scaleX = _arg_6;
            this.scaleY = _arg_7;
            this.data = _arg_8;
            this.eventType = _arg_9;
            this.times = _arg_10;
            this.fireEventTime = _arg_11;
            this.usePlayRate = _arg_12;
            this.scripts = _arg_13;
        }

        public function resetXY():void
        {
            this.x = this.m_sourceX;
            this.y = this.m_sourceY;
        }

        public function dispose():void
        {
            this.x = 0;
            this.y = 0;
            this.alpha = 1;
            this.dAlpha = 0;
            this.rotation = 0;
            this.scaleX = 1;
            this.scaleY = 1;
            this.m_sourceX = 0;
            this.m_sourceY = 0;
            this.eventType = "";
            this.times = 1;
            this.sourceRect = null;
            this.usePlayRate = true;
            if (this.data != null){
                this.data.dispose();
            };
            this.data = null;
        }

        public function clone():BitmapKeyFrame
        {
            var _local_1:BitmapKeyFrame = new BitmapKeyFrame(this.x, this.y, this.alpha, this.dAlpha, this.rotation, this.scaleX, this.scaleY, this.data, this.eventType, this.times, -1, this.usePlayRate, this.scripts);
            if (this.sourceRect != null){
                _local_1.sourceRect = this.sourceRect.clone();
            };
            if (this.ac){
                _local_1.ac = (this.ac.clone() as RectArea);
            };
            if (this.hcs){
                _local_1.hcs = this.hcs.splice();
            };
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_1102()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1102 = " BitmapKeyFrame" (String#14414)


