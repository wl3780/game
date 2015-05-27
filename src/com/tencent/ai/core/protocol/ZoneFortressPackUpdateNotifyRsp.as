// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.ZoneFortressPackUpdateNotifyRsp

package com.tencent.ai.core.protocol
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.LibBuildingBasicInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_1100;
    import __AS3__.vec.*;

    public class ZoneFortressPackUpdateNotifyRsp implements ISerialize 
    {

        public static const IN_CMD:int = 525866;
        public static const OUT_CMD:int = 525865;

        public var ret:int;
        public var delBuildings:Vector.<uint>;
        public var addBuildings:Vector.<LibBuildingBasicInfo>;
        public var newBuildings:Vector.<uint>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:LibBuildingBasicInfo;
            this.ret = _arg_1.readInt();
            if (this.ret != 0){
                return;
            };
            this.delBuildings = new Vector.<uint>();
            _local_2 = _arg_1.readUnsignedShort();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.delBuildings.push(_arg_1.readUnsignedInt());
                _local_3++;
            };
            this.addBuildings = new Vector.<LibBuildingBasicInfo>();
            _local_2 = _arg_1.readUnsignedShort();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_4 = new LibBuildingBasicInfo();
                _local_4.read(_arg_1);
                this.addBuildings.push(_local_4);
                _local_3++;
            };
            this.newBuildings = new Vector.<uint>();
            _local_2 = _arg_1.readUnsignedShort();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                this.newBuildings.push(_arg_1.readUnsignedInt());
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_1100()
        {
        }


    }
}//package com.tencent.ai.core.protocol

// _SafeStr_1100 = " ZoneFortressPackUpdateNotifyRsp" (String#15008)


