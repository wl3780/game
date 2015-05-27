// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ClientDataRecord

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_225;

    public class ClientDataRecord implements ISerialize 
    {

        public var first32Real:uint = 0;
        public var first32Virtual:uint = 0;
        public var middle32Real:uint = 0;
        public var middle32Virtual:uint = 0;


        public function read(_arg_1:IDataInput):void
        {
            this.first32Real = _arg_1.readUnsignedInt();
            this.first32Virtual = _arg_1.readUnsignedInt();
            this.middle32Real = _arg_1.readUnsignedInt();
            this.middle32Virtual = _arg_1.readUnsignedInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeUnsignedInt(this.first32Real);
            _arg_1.writeUnsignedInt(this.first32Virtual);
            _arg_1.writeUnsignedInt(this.middle32Real);
            _arg_1.writeUnsignedInt(this.middle32Virtual);
        }

        public /*  ©init. */ function _SafeStr_225()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_225 = " ClientDataRecord" (String#14240)


