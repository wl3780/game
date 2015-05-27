// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameExitTable

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1058;

    public class PXGameExitTable implements ISerialize 
    {

        public static const OUT_CMD:int = 0x1F0007;
        public static const IN_CMD:int = 0x1F0008;

        public var ret:int;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1058()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1058 = " PXGameExitTable" (String#14603)


