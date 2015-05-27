// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_QQUinGroup

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_913;
    import __AS3__.vec.*;

    public class P_QQUinGroup implements ISerialize 
    {

        public var uin:uint;
        public var group_ids:Vector.<uint>;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.uin = _arg_1.readUnsignedInt();
            this.group_ids = new Vector.<uint>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.group_ids.push(_arg_1.readUnsignedShort());
                _local_2++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_913()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_913 = " P_QQUinGroup" (String#16955)


