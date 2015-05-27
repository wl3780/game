// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PayData

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_291;

    public class PayData implements ISerialize 
    {

        public var nameTitleID:uint;
        public var nameTitleTime:uint;
        public var backgroundID:uint;
        public var backgroundTime:uint;


        public function read(_arg_1:IDataInput):void
        {
            this.nameTitleID = _arg_1.readUnsignedInt();
            this.nameTitleTime = _arg_1.readUnsignedInt();
            this.backgroundID = _arg_1.readUnsignedInt();
            this.backgroundTime = _arg_1.readUnsignedInt();
            _arg_1.readUnsignedInt();
            _arg_1.readUnsignedInt();
            _arg_1.readUnsignedInt();
            _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
            _arg_1.writeInt(0);
        }

        public /*  ©init. */ function _SafeStr_291()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_291 = " PayData" (String#17333)


