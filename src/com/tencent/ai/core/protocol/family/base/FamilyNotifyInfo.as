// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.family.base.FamilyNotifyInfo

package com.tencent.ai.core.protocol.family.base
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import com.tencent.ai.core.enum.Constants;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_947;

    public class FamilyNotifyInfo implements ISerialize 
    {

        public var type:int;
        public var data1:int;
        public var infoMsg:String;


        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedInt();
            this.data1 = _arg_1.readInt();
            this.infoMsg = XString.ReadChars(_arg_1, Constants.PROTOCAL_32);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_947()
        {
        }


    }
}//package com.tencent.ai.core.protocol.family.base

// _SafeStr_947 = " FamilyNotifyInfo" (String#17354)


