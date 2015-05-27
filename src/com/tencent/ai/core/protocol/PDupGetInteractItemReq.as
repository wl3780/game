// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PDupGetInteractItemReq

package com.tencent.ai.core.protocol
{
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_InteractItemtInfo;
    import com.tencent.free.logging.error;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_990;
    import __AS3__.vec.*;

    public class PDupGetInteractItemReq extends PBaseDupProtocol 
    {

        public static const IN_CMD:int = 589882;
        public static const OUT_CMD:int = 589881;

        public var scene_id:int;
        public var sequence_no:uint;
        public var iRet:int;
        public var itemNumber:int;
        public var items:Vector.<P_InteractItemtInfo>;


        override public function read(_arg_1:IDataInput):void
        {
            var _local_3:P_InteractItemtInfo;
            super.read(_arg_1);
            this.iRet = _arg_1.readInt();
            if (this.iRet != 0){
                error("[PDupGetInteractItemReq]>>>read:iRet=", this.iRet);
                return;
            };
            this.sequence_no = _arg_1.readUnsignedInt();
            this.itemNumber = _arg_1.readUnsignedShort();
            this.items = new Vector.<P_InteractItemtInfo>();
            var _local_2:int;
            while (_local_2 < this.itemNumber) {
                _local_3 = new P_InteractItemtInfo();
                _local_3.read(_arg_1);
                this.items.push(_local_3);
                _local_2++;
            };
        }

        override public function write(_arg_1:IDataOutput):void
        {
            super.write(_arg_1);
            _arg_1.writeByte(this.scene_id);
            _arg_1.writeUnsignedInt(this.sequence_no);
        }

        public /*  ©init. */ function _SafeStr_990()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_990 = " PDupGetInteractItemReq" (String#15635)


