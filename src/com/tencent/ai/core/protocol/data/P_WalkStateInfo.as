// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_WalkStateInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_924;

    public class P_WalkStateInfo implements ISerialize 
    {

        public var playerID:PlayerID;
        public var vKey:int;
        public var mapX:int;
        public var mapZ:int;
        public var direction:int;


        public function read(_arg_1:IDataInput):void
        {
            if (this.playerID == null){
                this.playerID = new PlayerID();
            };
            this.playerID.read(_arg_1);
            this.vKey = _arg_1.readUnsignedInt();
            this.mapX = _arg_1.readShort();
            this.mapZ = _arg_1.readShort();
            this.direction = _arg_1.readShort();
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.playerID.write(_arg_1);
            _arg_1.writeUnsignedInt(this.vKey);
            _arg_1.writeShort(this.mapX);
            _arg_1.writeShort(this.mapZ);
            _arg_1.writeShort(this.direction);
        }

        public /*  ©init. */ function _SafeStr_924()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_924 = " P_WalkStateInfo" (String#17639)


