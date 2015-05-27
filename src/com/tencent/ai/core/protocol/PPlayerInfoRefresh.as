// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PPlayerInfoRefresh

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1014;

    public class PPlayerInfoRefresh implements ISerialize 
    {

        public static const IN_CMD:int = ProtocolIDDef.ZONE_CMD_PLAYER_INFO_REFRESH;//524472

        public var pk_win_round:int;
        public var pk_round:int;
        public var match_pk_win_round:int;
        public var match_pk_round:int;
        public var pk_exp:int;
        public var pk_win_point:int;
        public var pk_lvl:int;
        public var pk_lvl_exp_begin:int;
        public var pk_lvl_exp_end:int;


        public function read(_arg_1:IDataInput):void
        {
            this.pk_win_round = _arg_1.readUnsignedInt();
            this.pk_round = _arg_1.readUnsignedInt();
            this.match_pk_win_round = _arg_1.readInt();
            this.match_pk_round = _arg_1.readInt();
            this.pk_exp = _arg_1.readInt();
            this.pk_win_point = _arg_1.readInt();
            this.pk_lvl = _arg_1.readShort();
            this.pk_lvl_exp_begin = _arg_1.readInt();
            this.pk_lvl_exp_end = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1014()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1014 = " PPlayerInfoRefresh" (String#17381)


