// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PZonePropItemShortcutReq

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1083;

    public class PZonePropItemShortcutReq implements ISerialize 
    {

        public static const IN_CMD:int = 524360;
        public static const OUT_CMD:int = 524359;

        public var oShortcutItems:Vector.<int>;
        public var iRet:int;


        public function read(_arg_1:IDataInput):void
        {
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                ProtocolHelper.handlerError(this.iRet, IN_CMD);
                return;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _local_3 = this.oShortcutItems.length;
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _arg_1.writeInt(this.oShortcutItems[_local_2]);
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_1083()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1083 = " PZonePropItemShortcutReq" (String#15749)


