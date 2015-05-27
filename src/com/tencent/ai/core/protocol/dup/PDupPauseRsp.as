// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.dup.PDupPauseRsp

package com.tencent.ai.core.protocol.dup
{
    import com.tencent.ai.core.protocol.PBaseDupProtocol;
    import com.tencent.ai.core.enum.ProtocolIDDef;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.PlayerID;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_939;
    import __AS3__.vec.*;

    public class PDupPauseRsp extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = ProtocolIDDef.DUP_CMD_PAUSE_RSP;//589952

        public var playerIDs:Vector.<PlayerID>;


        override public function read(_arg_1:IDataInput):void
        {
            var _local_4:PlayerID;
            super.read(_arg_1);
            var _local_2:int = _arg_1.readUnsignedShort();
            this.playerIDs = new Vector.<PlayerID>();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new PlayerID();
                _local_4.read(_arg_1);
                this.playerIDs.push(_local_4);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_939()
        {
        }


    }
}//package com.tencent.ai.core.protocol.dup

// _SafeStr_939 = " PDupPauseRsp" (String#13985)


