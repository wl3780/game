// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.FrameData

package com.tencent.ai.core.data
{
    import  ©init._SafeStr_256;

    public class FrameData 
    {

        public var frameIndex:int;
        public var data:Object;


        public function clone():FrameData
        {
            var _local_1:FrameData = new FrameData();
            _local_1.frameIndex = this.frameIndex;
            _local_1.data = this.data;
            return (_local_1);
        }

        public function dispose():void
        {
        }

        public /*  ©init. */ function _SafeStr_256()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_256 = " FrameData" (String#17543)


