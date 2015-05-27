// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.CasualGameStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_224;

    public class CasualGameStaticInfo implements ISerialize 
    {

        public var id:int;
        public var name:String;
        public var url:String;
        public var thumbURL:String;
        public var practiceKey:int;
        public var actualKey:int;


        public function decode(_arg_1:XML):void
        {
            if (int(_arg_1.@type) == 1){
                this.id = int(_arg_1.@id);
                this.name = String(_arg_1.@name);
                this.url = String(_arg_1.@url);
                this.thumbURL = String(_arg_1.@icon_url);
                this.practiceKey = int(_arg_1.@uin);
            } else {
                this.actualKey = int(_arg_1.@uin);
            };
        }

        public function toString():String
        {
            var _local_1:Array = ["[CasualGameStaticInfo][Devin]>>>toString:", this.id, this.name, this.url, this.practiceKey, this.actualKey];
            return (_local_1.join("\t"));
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.practiceKey = _arg_1.readInt();
            this.actualKey = _arg_1.readInt();
            this.name = _arg_1.readUTF();
            this.url = _arg_1.readUTF();
            this.thumbURL = _arg_1.readUTF();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.practiceKey);
            _arg_1.writeInt(this.actualKey);
            _arg_1.writeUTF(this.name);
            _arg_1.writeUTF(this.url);
            _arg_1.writeUTF(this.thumbURL);
        }

        public /*  ©init. */ function _SafeStr_224()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_224 = " CasualGameStaticInfo" (String#16991)


