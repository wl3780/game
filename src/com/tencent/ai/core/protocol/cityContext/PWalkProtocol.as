// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PWalkProtocol

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.protocol.data.P_WalkStateInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_866;

    public class PWalkProtocol implements ISerialize 
    {

        public static const OUT_CMD:int = ProtocolIDDef.ZONE_CMD_WALK_REQ;//524305
        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_WALK_RSP;//524306

        public var walk:P_WalkStateInfo;


        public function read(_arg_1:IDataInput):void
        {
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.walk.write(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_866()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_866 = " PWalkProtocol" (String#16067)


