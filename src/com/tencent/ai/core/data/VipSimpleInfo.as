// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.VipSimpleInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_353;

    public class VipSimpleInfo implements ISerialize 
    {

        public var vipLevel:int;
        public var isVip:int;
        public var isYearVip:int;
        public var isOldVip:int;
        public var isFeelVip:int;


        public function read(_arg_1:IDataInput):void
        {
            this.vipLevel = _arg_1.readByte();
            var _local_2:int = _arg_1.readByte();
            this.isVip = (_local_2 & 1);
            this.isYearVip = ((_local_2 >> 2) & 1);
            this.isOldVip = ((_local_2 >> 1) & 1);
            this.isFeelVip = 0;
            if (this.isVip){
                if ((_local_2 & 8)){
                    this.isFeelVip = 1;
                };
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.vipLevel);
            _arg_1.writeByte(this.isVip);
        }

        public /*  ©init. */ function _SafeStr_353()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_353 = " VipSimpleInfo" (String#14951)


