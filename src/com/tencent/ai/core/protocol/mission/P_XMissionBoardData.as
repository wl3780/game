// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.mission.P_XMissionBoardData

package com.tencent.ai.core.protocol.mission
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_964;

    public class P_XMissionBoardData implements ISerialize 
    {

        public var miss_id:uint;
        public var miss_rank:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.miss_id = _arg_1.readUnsignedInt();
            this.miss_rank = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_964()
        {
        }


    }
}//package com.tencent.ai.core.protocol.mission

// _SafeStr_964 = " P_XMissionBoardData" (String#14948)


