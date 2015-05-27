// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.GemCombinStaticInfo

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import __AS3__.vec.Vector;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_258;
    import __AS3__.vec.*;

    public class GemCombinStaticInfo implements IExternalizable 
    {

        public var id:int;
        public var upgradeID:int;
        public var grade:int;
        public var type:int;
        public var materials:Vector.<ServerMsgInfo>;


        public function decode(_arg_1:XML):void
        {
            var _local_3:int;
            var _local_4:int;
            this.upgradeID = int(_arg_1.@upgrade_gem_id);
            this.id = int(_arg_1.@cur_gem_id);
            this.grade = int(_arg_1.@cur_gem_grade);
            this.type = int(_arg_1.@cur_gem_type);
            this.materials = new Vector.<ServerMsgInfo>();
            var _local_2:XMLList = _arg_1.delitems;
            _local_4 = _local_2.length();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                this.materials[_local_3] = new ServerMsgInfo();
                this.materials[_local_3].decode(_local_2[_local_3]);
                _local_3++;
            };
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.upgradeID);
            _arg_1.writeInt(this.grade);
            _arg_1.writeInt(this.type);
            _local_3 = this.materials.length;
            _arg_1.writeByte(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.materials[_local_2].write(_arg_1);
                _local_2++;
            };
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:ServerMsgInfo;
            this.id = _arg_1.readInt();
            this.upgradeID = _arg_1.readInt();
            this.grade = _arg_1.readInt();
            this.type = _arg_1.readInt();
            this.materials = new Vector.<ServerMsgInfo>();
            _local_3 = _arg_1.readUnsignedByte();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ServerMsgInfo();
                _local_4.read(_arg_1);
                this.materials[_local_2] = _local_4;
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_258()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_258 = " GemCombinStaticInfo" (String#14111)


