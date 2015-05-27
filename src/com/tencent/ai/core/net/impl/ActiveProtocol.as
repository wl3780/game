// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.net.impl.ActiveProtocol

package com.tencent.ai.core.net.impl
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.manager.data.DEFINE;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_791;

    public class ActiveProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_ACTIVE_REQ;//524293
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_ACTIVE_RSP;//524294

        public var result:int;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            DEFINE.DM.runtime.updateTime(_arg_1.readUnsignedInt(), _arg_1.readUnsignedInt());
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_791()
        {
        }


    }
}//package com.tencent.ai.core.net.impl

// _SafeStr_791 = " ActiveProtocol" (String#17792)


