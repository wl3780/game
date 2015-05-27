// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupCatchPet

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_986;

    public class PDupCatchPet extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589960;
        public static const OUT_CMD:int = 589959;

        public var ret:int;
        public var player_id:PlayerID;
        public var index:uint;
        public var monster_type:uint;

        public function PDupCatchPet()
        {
            use_event_no = true;
        }

        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.ret = _arg_1.readInt();
            this.player_id = new PlayerID();
            this.player_id.read(_arg_1);
            this.index = _arg_1.readUnsignedShort();
            this.monster_type = _arg_1.readUnsignedInt();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            this.player_id.write(_arg_1);
            _arg_1.writeShort(this.index);
            _arg_1.writeUnsignedInt(this.monster_type);
        }

        public /*  ©init. */ function _SafeStr_986()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_986 = " PDupCatchPet" (String#13940)


