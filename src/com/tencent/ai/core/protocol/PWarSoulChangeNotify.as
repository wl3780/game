// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PWarSoulChangeNotify

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import com.tencent.ai.core.protocol.data.P_WarSoulData;
    import com.tencent.ai.core.protocol.data.P_WarSoulPanelData;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1053;
    import __AS3__.vec.*;

    public class PWarSoulChangeNotify implements ISerialize 
    {

        public static const RSP:int = 526986;

        public var isNew:int;
        public var numMsg:int;
        public var awardList:Vector.<ServerMsgInfo>;
        public var warSoulData:P_WarSoulData;
        public var panelData:P_WarSoulPanelData;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:ServerMsgInfo;
            this.isNew = _arg_1.readUnsignedByte();
            this.numMsg = _arg_1.readUnsignedShort();
            this.awardList = new Vector.<ServerMsgInfo>(this.numMsg, true);
            var _local_2:int;
            while (_local_2 < this.numMsg) {
                _local_3 = new ServerMsgInfo();
                _local_3.read(_arg_1);
                this.awardList[_local_2] = _local_3;
                _local_2++;
            };
            this.warSoulData = new P_WarSoulData();
            this.warSoulData.read(_arg_1);
            this.panelData = new P_WarSoulPanelData();
            this.panelData.read(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1053()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1053 = " PWarSoulChangeNotify" (String#17681)


