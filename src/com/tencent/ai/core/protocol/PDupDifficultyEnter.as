// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupDifficultyEnter

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_988;

    public class PDupDifficultyEnter implements ISerialize 
    {

        public static const IN_CMD:int = 524439;

        public var dupID:int = 0;


        public function read(_arg_1:IDataInput):void
        {
            this.dupID = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_988()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_988 = " PDupDifficultyEnter" (String#14225)


