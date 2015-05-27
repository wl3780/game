// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.cityContext.ZoneObjectUpdateRsp

package com.tencent.ai.core.protocol.cityContext
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_870;
    import __AS3__.vec.*;

    public class ZoneObjectUpdateRsp implements ISerialize 
    {

        public static const IN_CMD:int = 524562;

        public var scene_id:int;
        public var obj_num:int;
        public var objs:Vector.<ZoneObjectInfo>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_3:ZoneObjectInfo;
            this.scene_id = _arg_1.readUnsignedShort();
            this.obj_num = _arg_1.readUnsignedShort();
            this.objs = new Vector.<ZoneObjectInfo>();
            var _local_2:int;
            while (_local_2 < this.obj_num) {
                _local_3 = new ZoneObjectInfo();
                _local_3.read(_arg_1);
                this.objs.push(_local_3);
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_870()
        {
        }


    }
}//package com.tencent.ai.core.protocol.cityContext

// _SafeStr_870 = " ZoneObjectUpdateRsp" (String#15938)


