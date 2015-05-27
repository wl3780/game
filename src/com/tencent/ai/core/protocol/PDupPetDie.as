// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupPetDie

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_994;

    public class PDupPetDie extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589956;
        public static const OUT_CMD:int = 589955;

        public var ret:int;
        public var playerid:PlayerID;
        public var pet_id:uint;
        public var pet_state:uint;


        override public function read(_arg_1:IDataInput):void
        {
            super.read(_arg_1);
            this.ret = _arg_1.readInt();
            this.playerid = new PlayerID();
            this.playerid.read(_arg_1);
            this.pet_id = _arg_1.readUnsignedInt();
            this.pet_state = _arg_1.readUnsignedShort();
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            this.playerid.write(_arg_1);
            _arg_1.writeUnsignedInt(this.pet_id);
        }

        public /*  ©init. */ function _SafeStr_994()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_994 = " PDupPetDie" (String#15887)


