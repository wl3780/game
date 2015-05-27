// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.data.JNStruct

package com.tencent.ai.core.activity.womenJH.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_24;
    import __AS3__.vec.*;

    public class JNStruct implements ISerialize 
    {

        public var supportValue:uint;
        public var lastPetSid:uint;
        public var flowerChanceTotal:uint;
        public var flowerChanceToday:uint;
        public var flowerTime:uint;
        public var ranks:Vector.<JNSuperEvolveRank>;
        public var first:uint;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:uint;
            var _local_4:JNSuperEvolveRank;
            this.supportValue = _arg_1.readUnsignedInt();
            this.lastPetSid = _arg_1.readUnsignedInt();
            this.flowerChanceTotal = _arg_1.readUnsignedByte();
            this.flowerChanceToday = _arg_1.readUnsignedByte();
            this.flowerTime = _arg_1.readUnsignedShort();
            this.ranks = new Vector.<JNSuperEvolveRank>();
            var _local_2:uint = _arg_1.readUnsignedShort();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_4 = new JNSuperEvolveRank();
                _local_4.read(_arg_1);
                this.ranks.push(_local_4);
                _local_3++;
            };
            this.first = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_24()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.data

// _SafeStr_24 = " JNStruct" (String#16298)


