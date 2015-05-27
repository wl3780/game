// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_DUPDropItem

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_882;

    public class P_DUPDropItem implements ISerialize 
    {

        public var sceneid:int;
        public var droptype:int;
        public var dropdata:int;
        public var droppos:MapPosition;
        public var index:int;
        public var lockedplayer:PlayerID;


        public function read(_arg_1:IDataInput):void
        {
            this.sceneid = _arg_1.readUnsignedByte();
            this.droptype = _arg_1.readUnsignedByte();
            this.dropdata = _arg_1.readUnsignedInt();
            this.droppos = new MapPosition();
            this.droppos.read(_arg_1);
            this.index = _arg_1.readUnsignedShort();
            this.lockedplayer = new PlayerID();
            this.lockedplayer.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_882()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_882 = " P_DUPDropItem" (String#17216)


