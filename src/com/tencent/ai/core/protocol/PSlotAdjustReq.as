﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PSlotAdjustReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_SlotAdjust;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import com.tencent.ai.core.data.ItemInfo;
    import  ©init._SafeStr_1032;
    import __AS3__.vec.*;

    public class PSlotAdjustReq implements ISerialize 
    {

        public static const IN_CMD:int = 524437;
        public static const OUT_CMD:int = 524436;

        public var iRet:int;
        public var adjust_arr:Vector.<P_SlotAdjust>;
        public var result_arr:Vector.<P_SlotAdjust>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:P_SlotAdjust;
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                ProtocolHelper.handlerError(this.iRet, IN_CMD);
                return;
            };
            _local_3 = _arg_1.readUnsignedShort();
            this.result_arr = new Vector.<P_SlotAdjust>();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new P_SlotAdjust();
                _local_4.read(_arg_1);
                this.result_arr.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _local_3 = this.adjust_arr.length;
            _arg_1.writeShort(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.adjust_arr[_local_2].write(_arg_1);
                _local_2++;
            };
        }

        public function setReqestData(_arg_1:Array, _arg_2:Array):void
        {
            var _local_3:ItemInfo;
            var _local_4:int;
            var _local_5:int;
            var _local_6:P_SlotAdjust;
            this.adjust_arr = new Vector.<P_SlotAdjust>();
            _local_5 = _arg_1.length;
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_3 = _arg_1[_local_4];
                _local_6 = new P_SlotAdjust();
                _local_6.sid = _local_3.serialID;
                _local_6.id = _local_3.id;
                _local_6.slot = _arg_2[_local_4];
                this.adjust_arr.push(_local_6);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_1032()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1032 = " PSlotAdjustReq" (String#13706)


