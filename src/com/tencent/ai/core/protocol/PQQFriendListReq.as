﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PQQFriendListReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_QQUinGroup;
    import com.tencent.ai.core.protocol.data.P_QQGroupInfo;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1022;
    import __AS3__.vec.*;

    public class PQQFriendListReq implements ISerialize 
    {

        public static const IN_CMD:int = 524670;
        public static const OUT_CMD:int = 524669;

        public var req_type:uint;
        public var skey:String;
        public var result:int;
        public var qq:Vector.<P_QQUinGroup>;
        public var group_info:Vector.<P_QQGroupInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_QQUinGroup;
            var _local_5:P_QQGroupInfo;
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError(this.result, IN_CMD);
                return;
            };
            this.qq = new Vector.<P_QQUinGroup>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_QQUinGroup();
                _local_4.read(_arg_1);
                this.qq.push(_local_4);
                _local_2++;
            };
            this.group_info = new Vector.<P_QQGroupInfo>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = new P_QQGroupInfo();
                _local_5.read(_arg_1);
                this.group_info.push(_local_5);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.req_type);
            _arg_1.writeShort(Constants.MAX_SKEY_SIZE);
            XString.WriteChars(_arg_1, this.skey, Constants.MAX_SKEY_SIZE);
        }

        public /*  ©init. */ function _SafeStr_1022()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1022 = " PQQFriendListReq" (String#14141)


