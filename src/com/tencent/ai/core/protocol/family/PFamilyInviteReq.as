// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.family.PFamilyInviteReq

package com.tencent.ai.core.protocol.family
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_949;

    public class PFamilyInviteReq implements ISerialize 
    {

        public static const OUT_CMD:int = 527121;
        public static const IN_CMD:int = 527122;

        public var reqPlayerID:PlayerID;
        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.reqPlayerID.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_949()
        {
        }


    }
}//package com.tencent.ai.core.protocol.family

// _SafeStr_949 = " PFamilyInviteReq" (String#17750)


