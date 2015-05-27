// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_QQUserInfo

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_915;
    import __AS3__.vec.*;

    public class P_QQUserInfo implements ISerialize 
    {

        public var uin:uint;
        public var register_flag:uint;
        public var group_ids:Vector.<uint>;
        public var nick_name:String;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            this.uin = _arg_1.readUnsignedInt();
            this.register_flag = _arg_1.readUnsignedByte();
            this.group_ids = new Vector.<uint>();
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                this.group_ids.push(_arg_1.readUnsignedShort());
                _local_2++;
            };
            this.nick_name = XString.ReadChars(_arg_1, 32);
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public /*  ©init. */ function _SafeStr_915()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_915 = " P_QQUserInfo" (String#15050)


