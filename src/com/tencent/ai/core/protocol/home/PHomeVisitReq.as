// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.home.PHomeVisitReq

package com.tencent.ai.core.protocol.home
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_953;
    import __AS3__.vec.*;

    public class PHomeVisitReq implements ISerialize 
    {

        public static const IN_CMD:int = 0x1E0074;
        public static const OUT_CMD:int = 0x1E0073;

        public var ret:int;
        public var fis:Vector.<HomeFeedInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_4:HomeFeedInfo;
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            var _local_2:uint = _arg_1.readUnsignedShort();
            this.fis = new Vector.<HomeFeedInfo>();
            var _local_3:uint;
            while (_local_3 < _local_2) {
                _local_4 = new HomeFeedInfo();
                _local_4.read(_arg_1);
                this.fis.push(_local_4);
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_953()
        {
        }


    }
}//package com.tencent.ai.core.protocol.home

// _SafeStr_953 = " PHomeVisitReq" (String#16532)


