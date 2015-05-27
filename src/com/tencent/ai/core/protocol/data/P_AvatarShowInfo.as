// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_AvatarShowInfo

package com.tencent.ai.core.protocol.data
{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_872;

    public class P_AvatarShowInfo 
    {

        public var avatarID:int;
        public var strLen:int;


        public function read(_arg_1:IDataInput):void
        {
            this.avatarID = _arg_1.readUnsignedInt();
            this.strLen = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_872()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_872 = " P_AvatarShowInfo" (String#15920)


