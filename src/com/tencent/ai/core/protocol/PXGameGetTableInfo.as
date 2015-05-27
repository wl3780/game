// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PXGameGetTableInfo

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.protocol.data.P_TableInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1060;

    public class PXGameGetTableInfo implements ISerialize 
    {

        public static const IN_CMD:int = 0x1F0004;
        public static const OUT_CMD:int = 0x1F0003;

        public var ret:int;
        public var table_id:uint;
        public var game_id:uint;
        public var tableInfo:P_TableInfo;


        public function read(_arg_1:IDataInput):void
        {
            this.ret = _arg_1.readInt();
            if (this.ret == 0){
                this.game_id = _arg_1.readUnsignedInt();
                this.tableInfo = new P_TableInfo();
                this.tableInfo.read(_arg_1);
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.table_id);
        }

        public /*  ©init. */ function _SafeStr_1060()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1060 = " PXGameGetTableInfo" (String#16430)


