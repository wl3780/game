// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_MissCdtnData

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_895;

    public class P_MissCdtnData implements ISerialize 
    {

        public var type:uint;
        public var finish_flag:int;
        public var count:int;


        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedShort();
            this.finish_flag = _arg_1.readByte();
            this.count = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
        }

        public function toString():String
        {
            return ((((((("P_MissCdtnData{type=" + this.type) + ",finish_flag=") + this.finish_flag) + ",count=") + this.count) + "}"));
        }

        public /*  ©init. */ function _SafeStr_895()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_895 = " P_MissCdtnData" (String#13979)


