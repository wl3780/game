// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetExtraBuff

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_294;

    public class PetExtraBuff implements ISerialize 
    {

        public var bAutoRecover:Boolean = true;
        public var bAutoPickIcon:Boolean = true;
        public var bAutoPickItem:Boolean = true;


        public function read(_arg_1:IDataInput):void
        {
            var _local_2:uint = _arg_1.readShort();
            if (_local_2 > 0){
                this.bAutoRecover = (_arg_1.readByte() == 1);
                _local_2--;
            };
            if (_local_2 > 0){
                this.bAutoPickIcon = (_arg_1.readByte() == 1);
                _local_2--;
            };
            if (_local_2 > 0){
                this.bAutoPickItem = (_arg_1.readByte() == 1);
                _local_2--;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeShort(3);
            _arg_1.writeByte(((this.bAutoRecover) ? 1 : 0));
            _arg_1.writeByte(((this.bAutoPickIcon) ? 1 : 0));
            _arg_1.writeByte(((this.bAutoPickItem) ? 1 : 0));
        }

        public /*  ©init. */ function _SafeStr_294()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_294 = " PetExtraBuff" (String#17570)


