// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.PZoneCareerInfoChgRsp

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_867;

    public class PZoneCareerInfoChgRsp implements ISerialize 
    {

        public static const IN_CMD:int = 524477;

        public var playerID:PlayerID;
        public var career_id:int;
        public var sublime:Boolean;
        public var career_wear_lvl:int;
        public var hasJoin:Boolean;


        public function read(_arg_1:IDataInput):void
        {
            this.playerID = new PlayerID();
            this.playerID.read(_arg_1);
            this.career_id = _arg_1.readInt();
            this.sublime = _arg_1.readBoolean();
            this.career_wear_lvl = _arg_1.readUnsignedByte();
            this.hasJoin = (_arg_1.readBoolean() == false);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_867()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_867 = " PZoneCareerInfoChgRsp" (String#14510)


