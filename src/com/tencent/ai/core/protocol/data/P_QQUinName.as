// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_QQUinName

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_914;

    public class P_QQUinName implements ISerialize 
    {

        public var uin:uint;
        public var nick_name:String;


        public function read(_arg_1:IDataInput):void
        {
            this.uin = _arg_1.readUnsignedInt();
            this.nick_name = XString.ReadChars(_arg_1, Constants.LEN_NICKNAME);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_914()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_914 = " P_QQUinName" (String#16466)


