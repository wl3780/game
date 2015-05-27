// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_TableBaseInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_920;

    public class P_TableBaseInfo implements ISerialize 
    {

        public var table_id:uint;
        public var game_id:uint;
        public var table_owner:uint;
        public var player_num:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.table_id = _arg_1.readUnsignedInt();
            this.game_id = _arg_1.readUnsignedInt();
            this.table_owner = _arg_1.readUnsignedByte();
            this.player_num = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_920()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_920 = " P_TableBaseInfo" (String#17453)


