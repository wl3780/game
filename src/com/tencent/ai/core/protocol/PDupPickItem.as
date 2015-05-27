// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupPickItem

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_995;

    public class PDupPickItem extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = ProtocolIDDef.DUP_PICK_ITEM_RSP;//589880
        public static const OUT_CMD:int = ProtocolIDDef.DUP_PICK_ITEM_REQ;//589879

        public var sequence_no:uint;
        public var index:uint;
        public var itemtype:uint;
        public var itemdata:uint;
        public var result:int;
        public var playerid:PlayerID;
        public var take_effect_frame:uint;

        public function PDupPickItem()
        {
            use_event_no = false;
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.result = _arg_1.readInt();
            this.playerid = new PlayerID();
            this.playerid.read(_arg_1);
            var _local_2:PlayerID = new PlayerID();
            _local_2.read(_arg_1);
            this.sequence_no = _arg_1.readUnsignedInt();
            this.index = _arg_1.readUnsignedShort();
            this.itemtype = _arg_1.readUnsignedByte();
            this.itemdata = _arg_1.readUnsignedInt();
            this.take_effect_frame = _arg_1.readUnsignedInt();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            this.playerid.write(_arg_1);
            _arg_1.writeUnsignedInt(this.sequence_no);
            _arg_1.writeShort(this.index);
            _arg_1.writeByte(this.itemtype);
            _arg_1.writeUnsignedInt(this.itemdata);
        }

        public /*  ©init. */ function _SafeStr_995()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_995 = " PDupPickItem" (String#17675)


