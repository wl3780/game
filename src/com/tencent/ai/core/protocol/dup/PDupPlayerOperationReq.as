// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupPlayerOperationReq

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_942;

    public class PDupPlayerOperationReq extends PBaseDupProtocol 
    {

        public static const OUT_CMD:int = 589859;
        public static const IN_CMD:int = 589860;

        public var frame_no:uint;
        public var dup_key:uint;
        public var player_id:PlayerID;
        public var op_key:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.player_id = new PlayerID();
            this.player_id.read(_arg_1);
            this.frame_no = _arg_1.readUnsignedInt();
            this.op_key = _arg_1.readUnsignedInt();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            this.player_id.write(_arg_1);
            _arg_1.writeUnsignedInt(this.dup_key);
            _arg_1.writeUnsignedInt(this.frame_no);
            _arg_1.writeUnsignedInt(this.op_key);
        }

        public /*  ©init. */ function _SafeStr_942()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_942 = " PDupPlayerOperationReq" (String#16730)


