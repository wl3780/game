// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.protocol.data.P_Tetrad

package com.tencent.ai.core.protocol.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_922;

    public class P_Tetrad implements ISerialize 
    {

        public var type:uint;
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

        public function clone(_arg_1:Object):void
        {
            this.type = _arg_1.type;
            this.data_1 = _arg_1.date1;
            this.data_2 = _arg_1.data2;
            this.data_3 = _arg_1.data3;
        }

        public /*  ©init. */ function _SafeStr_922()
        {
        }


    }
}//package com.tencent.ai.core.protocol.data

// _SafeStr_922 = " P_Tetrad" (String#16502)


