// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PGetUinFriendsRsp2

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_UinStatus;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1003;
    import __AS3__.vec.*;

    public class PGetUinFriendsRsp2 implements ISerialize 
    {

        public static const IN_CMD:int = 1508264;

        public var uins:Vector.<P_UinStatus>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.uins = new Vector.<P_UinStatus>();
            _local_3 = _arg_1.readShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.uins[_local_2] = new P_UinStatus();
                this.uins[_local_2].read(_arg_1);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1003()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1003 = " PGetUinFriendsRsp2" (String#14657)


