package com.tencent.free.mff
{
    import com.tencent.free.utils.XString;
    
    import flash.utils.ByteArray;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import flash.utils.IExternalizable;

    public class MFFFile implements IExternalizable 
    {

        public var mffName:String;
        public var mffType:String;
        public var mffLength:int;
        public var mffBytes:ByteArray;

        public function readExternal(data:IDataInput):void
        {
            this.mffName = XString.ReadString(data);
            this.mffType = XString.ReadString(data);
            this.mffLength = data.readUnsignedInt();
            this.mffBytes = new ByteArray();
            if (this.mffLength > 0) {
                data.readBytes(this.mffBytes, 0, this.mffLength);
            }
        }

        public function writeExternal(data:IDataOutput):void
        {
            XString.WriteString(data, this.mffName);
            XString.WriteString(data, this.mffType);
            this.mffLength = this.mffBytes.length;
            data.writeUnsignedInt(this.mffLength);
            if (this.mffLength > 0) {
                data.writeBytes(this.mffBytes, 0, this.mffLength);
            }
        }

        public function dispose():void
        {
            this.mffName = null;
            this.mffType = null;
            this.mffLength = 0;
            if (this.mffBytes != null) {
                this.mffBytes.clear();
                this.mffBytes = null;
            }
        }

    }
}
