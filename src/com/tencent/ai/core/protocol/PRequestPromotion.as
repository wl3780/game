// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PRequestPromotion

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.DetailPlayerInfo;
    import com.tencent.ai.core.protocol.data.P_DetailPlayerInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1025;

    public class PRequestPromotion implements ISerialize 
    {

        public static const OUT_CMD:int = 524375;
        public static const IN_CMD:int = 524376;

        public var careerID:uint;
        public var _res:int;
        public var _detailInfo:DetailPlayerInfo;

        public function PRequestPromotion(_arg_1:int=0)
        {
            this.careerID = _arg_1;
        }

        public function read(_arg_1:IDataInput):void
        {
            this._res = _arg_1.readInt();
            var _local_2:P_DetailPlayerInfo = new P_DetailPlayerInfo();
            _local_2.read(_arg_1);
            this._detailInfo = _local_2.data;
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.careerID);
        }

        public /*  ©init. */ function _SafeStr_1025()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1025 = " PRequestPromotion" (String#17594)


