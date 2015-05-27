// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mission.PRemoveXMissReq

package com.tencent.ai.core.protocol.mission
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_MissionData;
    import com.tencent.ai.core.net.ProtocolHelper;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_967;

    public class PRemoveXMissReq implements ISerialize 
    {

        public static const IN_CMD:int = 525592;
        public static const OUT_CMD:int = 525591;

        public var miss_id:uint;
        public var result:int;
        public var x_miss:Vector.<P_MissionData>;


        public function read(_arg_1:IDataInput):void
        {
            this.result = _arg_1.readUnsignedInt();
            if (this.result != 0){
                ProtocolHelper.handlerError2(this.result, IN_CMD);
                return;
            };
            this.miss_id = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.miss_id);
        }

        public /*  ©init. */ function _SafeStr_967()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mission

// _SafeStr_967 = " PRemoveXMissReq" (String#17258)


