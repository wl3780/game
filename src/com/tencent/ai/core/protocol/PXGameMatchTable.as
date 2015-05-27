// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameMatchTable

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.data.P_TableInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1063;

    public class PXGameMatchTable implements ISerialize 
    {

        public static const OUT_CMD:int = 0x1F0009;
        public static const IN_CMD:int = 0x1F000A;

        public var game_id:uint;
        public var ret:int;
        public var tableInfo:P_TableInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            this.game_id = _arg_1.readUnsignedInt();
            if (this.ret == 0){
                this.tableInfo = new P_TableInfo();
                this.tableInfo.read(_arg_1);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.game_id);
        }

        public /*  ©init. */ function _SafeStr_1063()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1063 = " PXGameMatchTable" (String#17351)


