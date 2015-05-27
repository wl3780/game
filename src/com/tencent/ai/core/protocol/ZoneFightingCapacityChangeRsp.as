// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.ZoneFightingCapacityChangeRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1099;

    public class ZoneFightingCapacityChangeRsp implements ISerialize 
    {

        public static const IN_CMD:int = 526874;

        public var ret:int;
        public var fightingCapacity:uint;
        public var diffVal:int;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.fightingCapacity = _arg_1.readUnsignedInt();
            this.diffVal = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1099()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1099 = " ZoneFightingCapacityChangeRsp" (String#15404)


