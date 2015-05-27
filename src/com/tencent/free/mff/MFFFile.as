// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.mff.MFFFile

package com.tencent.free.mff
{
    import flash.utils.IExternalizable;
    import flash.utils.ByteArray;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_49;

    public class MFFFile implements IExternalizable 
    {

        public var mffName:String;
        public var mffType:String;
        public var mffLength:int;
        public var mffBytes:ByteArray;


        public function readExternal(_arg_1:IDataInput):void
        {
            this.mffName = XString.ReadString(_arg_1);
            this.mffType = XString.ReadString(_arg_1);
            this.mffLength = _arg_1.readUnsignedInt();
            this.mffBytes = new ByteArray();
            if (this.mffLength > 0){
                _arg_1.readBytes(this.mffBytes, 0, this.mffLength);
            };
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            XString.WriteString(_arg_1, this.mffName);
            XString.WriteString(_arg_1, this.mffType);
            this.mffLength = this.mffBytes.length;
            _arg_1.writeUnsignedInt(this.mffLength);
            if (this.mffLength > 0){
                _arg_1.writeBytes(this.mffBytes, 0, this.mffLength);
            };
        }

        public function dispose():void
        {
            this.mffName = null;
            this.mffType = null;
            this.mffLength = 0;
            if (this.mffBytes != null){
                this.mffBytes.clear();
                this.mffBytes = null;
            };
        }

        public /*  ©init. */ function _SafeStr_49()
        {
        }


    }
}//package com.tencent.free.mff

// _SafeStr_49 = " MFFFile" (String#1430)


