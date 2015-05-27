// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupRefreshInteractItemRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.protocol.data.P_InteractItemtInfo;
    import com.tencent.ai.core.data.MapPosition;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_997;

    public class PDupRefreshInteractItemRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589888;

        public var result:int;
        public var take_effect_frame:uint;
        public var item_info:P_InteractItemtInfo;
        public var item_pos:MapPosition;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.result = _arg_1.readInt();
            this.take_effect_frame = _arg_1.readUnsignedInt();
            this.item_info = new P_InteractItemtInfo();
            this.item_info.read(_arg_1);
            this.item_pos = new MapPosition();
            this.item_pos.read(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_997()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_997 = " PDupRefreshInteractItemRsp" (String#17261)


