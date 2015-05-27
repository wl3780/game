// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.activity.womenJH.data.NJStruct

package com.tencent.ai.core.activity.womenJH.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_26;
    import __AS3__.vec.*;

    public class NJStruct implements ISerialize 
    {

        public var justiceValue:uint;
        public var lastPetSID:uint;
        public var primaryArrestChanceTotal:uint;
        public var primaryArrestChanceToday:uint;
        public var arrestStatuses:Vector.<uint>;
        public var ranks:Vector.<JNSuperEvolveRank>;
        public var first:uint;


        public function read(_arg_1:IDataInput):void
        {
            var _local_4:JNSuperEvolveRank;
            this.justiceValue = _arg_1.readUnsignedInt();
            this.lastPetSID = _arg_1.readUnsignedInt();
            this.primaryArrestChanceTotal = _arg_1.readUnsignedByte();
            this.primaryArrestChanceToday = _arg_1.readUnsignedByte();
            this.arrestStatuses = new Vector.<uint>();
            var _local_2:uint;
            while (_local_2 < 6) {
                this.arrestStatuses.push(_arg_1.readUnsignedByte());
                _local_2++;
            };
            this.ranks = new Vector.<JNSuperEvolveRank>();
            var _local_3:uint = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new JNSuperEvolveRank();
                _local_4.read(_arg_1);
                this.ranks.push(_local_4);
                _local_2++;
            };
            this.first = _arg_1.readUnsignedByte();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_26()
        {
        }


    }
}//package com.tencent.ai.core.activity.womenJH.data

// _SafeStr_26 = " NJStruct" (String#15053)


