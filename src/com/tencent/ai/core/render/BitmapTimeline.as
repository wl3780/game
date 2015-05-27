// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.BitmapTimeline

package com.tencent.ai.core.render
{
    import __AS3__.vec.Vector;
    import flash.utils.Dictionary;
    import flash.geom.Point;
    import  ©init._SafeStr_1103;
    import __AS3__.vec.*;

    public class BitmapTimeline 
    {

        public var bitmapFrames:Vector.<BitmapKeyFrame>;
        public var frameLabels:Dictionary;
        public var totalFrame:int;

        public function BitmapTimeline(_arg_1:Vector.<BitmapKeyFrame>=null, _arg_2:Dictionary=null)
        {
            this.setBitmapFrames(_arg_1);
            this.frameLabels = _arg_2;
        }

        public function setBitmapFrames(_arg_1:Vector.<BitmapKeyFrame>):void
        {
            if (_arg_1 == null){
                return;
            };
            this.totalFrame = _arg_1.length;
            this.bitmapFrames = _arg_1;
        }

        public function setOffset(_arg_1:Point):void
        {
            var _local_2:int;
            var _local_3:BitmapKeyFrame;
            if (((!((_arg_1 == null))) && (!((this.bitmapFrames == null))))){
                _local_2 = 0;
                while (_local_2 < this.totalFrame) {
                    _local_3 = this.bitmapFrames[_local_2];
                    _local_3.x = (_local_3.x + _arg_1.x);
                    _local_3.y = (_local_3.y + _arg_1.y);
                    _local_2++;
                };
            };
        }

        public function getBitmapFrame(_arg_1:Object):BitmapKeyFrame
        {
            if ((_arg_1 is int)){
                return (this.bitmapFrames[(_arg_1 as int)]);
            };
            return (this.frameLabels[(_arg_1 as String)]);
        }

        public function dispose():void
        {
            var _local_1:int;
            while (_local_1 < this.totalFrame) {
                this.bitmapFrames[_local_1].dispose();
                _local_1++;
            };
            this.frameLabels = null;
            this.bitmapFrames = null;
        }

        public function clone():BitmapTimeline
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:BitmapKeyFrame;
            var _local_5:Object;
            var _local_1:BitmapTimeline = new BitmapTimeline();
            if (this.bitmapFrames){
                _local_1.bitmapFrames = new Vector.<BitmapKeyFrame>();
                _local_2 = this.bitmapFrames.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = this.bitmapFrames[_local_3];
                    _local_1.bitmapFrames.push(_local_4.clone());
                    _local_3++;
                };
            };
            if (this.frameLabels){
                _local_1.frameLabels = new Dictionary();
                for (_local_5 in this.frameLabels) {
                    _local_1[_local_5] = this.frameLabels[_local_5];
                };
            };
            _local_1.totalFrame = this.totalFrame;
            return (_local_1);
        }

        public /*  ©init. */ function _SafeStr_1103()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1103 = " BitmapTimeline" (String#14621)


