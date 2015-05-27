// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PRadisStatusQueryReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1023;

    public class PRadisStatusQueryReq implements ISerialize 
    {

        public static const OUT_CMD:int = 526345;
        public static const IN_CMD:int = 526346;

        public var result:int;
        public var type:int;
        public var dupID:int;
        public var beginLevel:int;
        public var endLevel:int;
        public var doneCount:int;
        public var curLevel:int;
        public var totalCount:int;
        public var totalCoin:int;
        public var totalExp:int;
        public var totalPetExp:int;
        public var totalHonor:int;
        public var curTimeRemain:int;
        public var onceTime:int;
        public var totalContribution:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            if (this.result == 0){
                this.type = _arg_1.readUnsignedByte();
                this.dupID = _arg_1.readUnsignedInt();
                this.beginLevel = _arg_1.readUnsignedInt();
                this.endLevel = _arg_1.readUnsignedInt();
                this.doneCount = _arg_1.readUnsignedInt();
                this.curLevel = _arg_1.readUnsignedInt();
                this.totalCount = _arg_1.readUnsignedInt();
                this.totalCoin = _arg_1.readUnsignedInt();
                this.totalExp = _arg_1.readUnsignedInt();
                this.totalPetExp = _arg_1.readUnsignedInt();
                this.totalHonor = _arg_1.readUnsignedInt();
                this.curTimeRemain = _arg_1.readUnsignedInt();
                this.onceTime = _arg_1.readUnsignedInt();
                this.totalContribution = _arg_1.readUnsignedInt();
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1023()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1023 = " PRadisStatusQueryReq" (String#16316)


