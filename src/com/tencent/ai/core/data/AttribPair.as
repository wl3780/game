// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.AttribPair

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IExternalizable;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_214;

    public class AttribPair implements ISerialize, IExternalizable 
    {

        public var type:int;
        public var data_1:Number;
        public var data_2:Number;
        public var data_3:Number;


        public function decodeXML(_arg_1:XML):void
        {
            this.type = int(_arg_1.@data_type);
            this.data_1 = Number(_arg_1.@data_1);
            this.data_2 = Number(_arg_1.@data_2);
            this.data_3 = Number(_arg_1.@data_3);
        }

        public function encodeXML(_arg_1:XML):void
        {
            if (_arg_1 != null){
                _arg_1.@data_type = this.type;
                _arg_1.@data_1 = this.data_1;
                _arg_1.@data_2 = this.data_2;
                _arg_1.@data_3 = this.data_3;
            };
        }

        public function toString():String
        {
            return (((((((this.type + " ") + this.data_1) + " ") + this.data_2) + " ") + this.data_3));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedInt();
            this.data_1 = _arg_1.readInt();
            this.data_2 = _arg_1.readInt();
            this.data_3 = _arg_1.readInt();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.data_1);
            _arg_1.writeInt(this.data_2);
            _arg_1.writeInt(this.data_3);
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            this.write(_arg_1);
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            this.read(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_214()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_214 = " AttribPair" (String#14000)


