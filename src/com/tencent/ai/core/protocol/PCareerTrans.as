// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PCareerTrans

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_977;

    public class PCareerTrans implements ISerialize 
    {

        public static const OUT_CMD:int = 524375;
        public static const IN_CMD:int = 524376;

        public var result:int;
        public var newCareerID:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.newCareerID = _arg_1.readUnsignedInt();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_977()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_977 = " PCareerTrans" (String#15923)


