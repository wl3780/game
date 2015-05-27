// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_WarSoulData

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.WarSoulInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_925;
    import __AS3__.vec.*;

    public class P_WarSoulData implements ISerialize 
    {

        public var version:uint;
        public var maxPackSize:int;
        public var numPackWarSoul:int;
        public var packWarSoulList:Vector.<WarSoulInfo>;
        public var maxStorageSize:int;
        public var numStorageWarSoul:int;
        public var storageWarSoulList:Vector.<WarSoulInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:WarSoulInfo;
            this.version = _arg_1.readUnsignedInt();
            this.maxPackSize = _arg_1.readUnsignedShort();
            this.numPackWarSoul = _arg_1.readUnsignedShort();
            this.packWarSoulList = new Vector.<WarSoulInfo>(this.numPackWarSoul, true);
            _local_2 = 0;
            while (_local_2 < this.numPackWarSoul) {
                _local_3 = new WarSoulInfo();
                _local_3.read(_arg_1);
                this.packWarSoulList[_local_2] = _local_3;
                _local_2++;
            };
            this.maxStorageSize = _arg_1.readUnsignedShort();
            this.numStorageWarSoul = _arg_1.readUnsignedShort();
            this.storageWarSoulList = new Vector.<WarSoulInfo>(this.numStorageWarSoul, true);
            _local_2 = 0;
            while (_local_2 < this.numStorageWarSoul) {
                _local_3 = new WarSoulInfo();
                _local_3.read(_arg_1);
                this.storageWarSoulList[_local_2] = _local_3;
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_925()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_925 = " P_WarSoulData" (String#15491)


