// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.item.PZoneGemMosaicCombinReq

package com.tencent.ai.core.protocol.item
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_955;

    public class PZoneGemMosaicCombinReq implements ISerialize 
    {

        public static const IN_CMD:int = 526888;
        public static const OUT_CMD:int = 526887;

        public var result:int;
        public var gem_type:int;
        public var gem_grade:int;
        public var combin_num:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError2(this.result, IN_CMD);
                return;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.gem_type);
            _arg_1.writeByte(this.gem_grade);
            _arg_1.writeInt(this.combin_num);
        }

        public /*  ©init. */ function _SafeStr_955()
        {
        }


    }
}//package com.tencent.ai.core.protocol.item

// _SafeStr_955 = " PZoneGemMosaicCombinReq" (String#15032)


