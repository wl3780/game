// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PSublime

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1034;

    public class PSublime implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_SUBLIME_RSP;//525826

        public var result:int;
        public var sublime:Boolean;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readInt();
            this.sublime = _arg_1.readBoolean();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1034()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1034 = " PSublime" (String#16877)


