// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ServerMsgInfo

package com.tencent.ai.core.data
{
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_328;

    public class ServerMsgInfo 
    {

        public var type:int;
        public var data_1:int;
        public var data_2:int;
        public var data_3:int;


        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedInt();
            this.data_1 = _arg_1.readInt();
            this.data_2 = _arg_1.readInt();
            this.data_3 = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.type);
            _arg_1.writeInt(this.data_1);
            _arg_1.writeInt(this.data_2);
            _arg_1.writeInt(this.data_3);
        }

        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@data_type);
            this.data_1 = int(_arg_1.@data_1);
            this.data_2 = int(_arg_1.@data_2);
            this.data_3 = int(_arg_1.@data_3);
        }

        public /*  ©init. */ function _SafeStr_328()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_328 = " ServerMsgInfo" (String#15362)


