// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.PSkillSyncRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.protocol.data.P_SkillInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1030;
    import __AS3__.vec.*;

    public class PSkillSyncRsp implements ISerialize 
    {

        public static const RSP:int = 527012;

        public var result:int;
        public var numSkill:int;
        public var skillList:Vector.<P_SkillInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:P_SkillInfo;
            this.result = _arg_1.readInt();
            this.skillList = new Vector.<P_SkillInfo>();
            this.numSkill = _arg_1.readUnsignedShort();
            var _local_2:int;
            while (_local_2 < this.numSkill) {
                _local_3 = new P_SkillInfo();
                _local_3.read(_arg_1);
                this.skillList.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1030()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1030 = " PSkillSyncRsp" (String#16040)


