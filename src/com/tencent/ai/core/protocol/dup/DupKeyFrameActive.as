// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.DupKeyFrameActive

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_930;

    public class DupKeyFrameActive extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = 589911;

        public var key_frame:uint;

        public function DupKeyFrameActive()
        {
            use_event_no = false;
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeUnsignedInt(this.key_frame);
        }

        public /*  ©init. */ function _SafeStr_930()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_930 = " DupKeyFrameActive" (String#17558)


