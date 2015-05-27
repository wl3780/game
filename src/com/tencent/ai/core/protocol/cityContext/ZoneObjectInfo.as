// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.ZoneObjectInfo

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import com.tencent.ai.core.data.MapPosition;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_869;

    public class ZoneObjectInfo implements ISerialize 
    {

        public var obj_id:uint;
        public var serverMsgInfo:ServerMsgInfo;
        public var item_pos:MapPosition;


        public function read(_arg_1:IDataInput):void
        {
            this.obj_id = _arg_1.readUnsignedInt();
            this.serverMsgInfo = new ServerMsgInfo();
            this.serverMsgInfo.read(_arg_1);
            this.item_pos = new MapPosition();
            this.item_pos.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_869()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_869 = " ZoneObjectInfo" (String#15152)


