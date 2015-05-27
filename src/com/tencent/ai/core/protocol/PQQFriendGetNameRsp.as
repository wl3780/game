// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PQQFriendGetNameRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_QQUinName;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1021;
    import __AS3__.vec.*;

    public class PQQFriendGetNameRsp implements ISerialize 
    {

        public static const IN_CMD:int = 524672;

        public var type:int;
        public var player_name:Vector.<P_QQUinName>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.type = _arg_1.readInt();
            this.player_name = new Vector.<P_QQUinName>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.player_name[_local_2] = new P_QQUinName();
                this.player_name[_local_2].read(_arg_1);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1021()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1021 = " PQQFriendGetNameRsp" (String#16448)


