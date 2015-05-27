// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_QQGroupInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_912;

    public class P_QQGroupInfo implements ISerialize 
    {

        public var group_id:uint;
        public var group_name:String;


        public function read(_arg_1:IDataInput):void
        {
            this.group_id = _arg_1.readUnsignedInt();
            this.group_name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_912()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_912 = " P_QQGroupInfo" (String#15494)


