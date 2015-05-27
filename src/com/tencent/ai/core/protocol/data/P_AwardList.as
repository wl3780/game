// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_AwardList

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ServerMsgInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_874;
    import __AS3__.vec.*;

    public class P_AwardList implements ISerialize 
    {

        public var awards:Vector.<ServerMsgInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ServerMsgInfo;
            _local_3 = _arg_1.readUnsignedShort();
            this.awards = new Vector.<ServerMsgInfo>();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ServerMsgInfo();
                _local_4.read(_arg_1);
                this.awards.push(_local_4);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_874()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_874 = " P_AwardList" (String#15863)


