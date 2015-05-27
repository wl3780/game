// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_ItemInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.ItemInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.data.ItemStaticInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_891;

    public class P_ItemInfo implements ISerialize 
    {

        public var item:ItemInfo;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_3:ItemStaticInfo = DEFINE.DM.getItemStaticInfo(_local_2);
            if (!_local_3){
                throw (new Error(("交互为空，id=" + _local_2)));
            };
            this.item = new ItemInfo();
            this.item.id = _local_2;
            this.item.serialID = _arg_1.readUnsignedInt();
            this.item.num = _arg_1.readUnsignedInt();
            this.item.gettime = _arg_1.readUnsignedInt();
            this.item.expiryTime = _arg_1.readUnsignedInt();
            this.item.slot = _arg_1.readUnsignedShort();
            this.item.staticInfo = _local_3;
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_891()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_891 = " P_ItemInfo" (String#14372)


