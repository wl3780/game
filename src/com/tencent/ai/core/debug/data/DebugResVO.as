// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.debug.data.DebugResVO

package com.tencent.ai.core.debug.data
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.render.MotionAsset;
    import com.tencent.ai.core.render.BitmapKeyFrame;
    import flash.display.BitmapData;
    import  ©init._SafeStr_360;

    public class DebugResVO 
    {

        public var id:String;
        public var url:String;
        public var size:uint;
        public var motionNum:int;
        public var memeorySize:uint;
        private var _motionAssetVect:Vector.<MotionAsset>;


        public function set motionAssetVect(_arg_1:Vector.<MotionAsset>):void
        {
            var _local_2:MotionAsset;
            var _local_3:BitmapKeyFrame;
            var _local_4:BitmapData;
            this._motionAssetVect = _arg_1;
            this.motionNum = _arg_1.length;
            for each (_local_2 in this._motionAssetVect) {
                if (((_local_2.timeline) && (_local_2.timeline.bitmapFrames))){
                    for each (_local_3 in _local_2.timeline.bitmapFrames) {
                        _local_4 = _local_3.data;
                        if (_local_4){
                            this.memeorySize = (this.memeorySize + ((_local_4.width * _local_4.height) * 4));
                        };
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_360()
        {
        }


    }
}//package com.tencent.ai.core.debug.data

// _SafeStr_360 = " DebugResVO" (String#13691)


