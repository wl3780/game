// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_PetExtraBaseInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PetExtraBaseInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_901;

    public class P_PetExtraBaseInfo implements ISerialize 
    {

        public static var P:P_PetExtraBaseInfo = new (P_PetExtraBaseInfo)();

        public var data:PetExtraBaseInfo;


        public function read(_arg_1:IDataInput):void
        {
            if (this.data == null){
                this.data = new PetExtraBaseInfo();
            };
            this.data.catchItemID = _arg_1.readUnsignedInt();
            this.data.playerHpItemID = _arg_1.readUnsignedInt();
            this.data.playerMpItemID = _arg_1.readUnsignedInt();
            this.data.petHpItemID = _arg_1.readUnsignedInt();
            this.data.hungryItemID = _arg_1.readUnsignedInt();
            this.data.extra_buff.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_901()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_901 = " P_PetExtraBaseInfo" (String#15869)


