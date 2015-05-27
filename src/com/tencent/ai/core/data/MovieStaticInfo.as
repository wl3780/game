// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.MovieStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_281;

    public class MovieStaticInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var name:String;
        public var url:String;
        public var winWidth:int;
        public var winHeight:int;
        public var fileType:int;
        public var skip:Boolean;
        public var flow:Boolean;


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.name = String(_arg_1.@name);
            this.url = String(_arg_1.@url);
            this.winWidth = int(_arg_1.@winWidth);
            this.winHeight = int(_arg_1.@winHeight);
            this.fileType = int(_arg_1.@fileType);
            this.skip = (int(_arg_1.@skip) == 1);
            this.flow = (int(_arg_1.@flow) == 1);
        }

        public function encode()
        {
            var _local_1:XML = <MovieStaticInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@name = this.name;
            _local_1.@url = this.url;
            _local_1.@winWidth = this.winWidth;
            _local_1.@winHeight = this.winHeight;
            _local_1.@fileType = this.fileType;
            _local_1.@skip = ((this.skip) ? 1 : 0);
            _local_1.@flow = ((this.flow) ? 1 : 0);
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.name = XString.ReadString(_arg_1);
            this.url = XString.ReadString(_arg_1);
            this.winWidth = _arg_1.readShort();
            this.winHeight = _arg_1.readShort();
            this.fileType = _arg_1.readByte();
            this.skip = (_arg_1.readByte() == 1);
            this.flow = (_arg_1.readByte() == 1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            XString.WriteString(_arg_1, this.name);
            XString.WriteString(_arg_1, this.url);
            _arg_1.writeShort(this.winWidth);
            _arg_1.writeShort(this.winHeight);
            _arg_1.writeByte(this.fileType);
            if (this.skip == true){
                _arg_1.writeByte(0);
            } else {
                _arg_1.writeByte(1);
            };
            if (this.flow == true){
                _arg_1.writeByte(0);
            } else {
                _arg_1.writeByte(1);
            };
        }

        public /*  ©init. */ function _SafeStr_281()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_281 = " MovieStaticInfo" (String#15833)


