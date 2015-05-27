// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PTL_CheckSignature

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1048;

    public class PTL_CheckSignature implements ISerialize 
    {

        public var sessionKey:String;
        public var isValid:Boolean;
        public var currentTime:uint;

        public function PTL_CheckSignature(_arg_1:String="")
        {
            this.sessionKey = _arg_1;
        }

        public function read(_arg_1:IDataInput):void
        {
            this.isValid = _arg_1.readBoolean();
            this.currentTime = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            XString.WriteChars(_arg_1, this.sessionKey, Constants.MAX_SKEY_SIZE);
        }

        public /*  ©init. */ function _SafeStr_1048()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1048 = " PTL_CheckSignature" (String#17525)


