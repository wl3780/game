// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.render.BPStateInfo

package com.tencent.ai.core.render
{
    import  ©init._SafeStr_1107;

    public class BPStateInfo 
    {

        public var frameIndex:int = 0;
        public var times:int = 0;
        public var isPlaying:Boolean = false;

        public function BPStateInfo(_arg_1:int=0, _arg_2:int=0, _arg_3:Boolean=false)
        {
            this.frameIndex = _arg_1;
            this.times = _arg_2;
            this.isPlaying = _arg_3;
        }

        public function clone():BPStateInfo
        {
            return (new BPStateInfo(this.frameIndex, this.times, this.isPlaying));
        }

        public /*  ©init. */ function _SafeStr_1107()
        {
        }


    }
}//package com.tencent.ai.core.render

// _SafeStr_1107 = " BPStateInfo" (String#15401)


