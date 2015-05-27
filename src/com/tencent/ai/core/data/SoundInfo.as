// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.SoundInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_333;

    public class SoundInfo implements IXMLSerialize, ISerialize 
    {

        public var id:int;
        public var mp3ID:int;
        public var swfID:int;
        public var rate:Number;
        public var dontPlay:Boolean;


        public function decode(_arg_1:XML):void
        {
            this.id = int(_arg_1.@id);
            this.mp3ID = int(_arg_1.@mp3ID);
            this.rate = Number(_arg_1.@rate);
            this.swfID = int(_arg_1.@swfID);
            this.dontPlay = (String(_arg_1.@dontPlay) == "1");
        }

        public function encode()
        {
            var _local_1:XML = <SoundInfo/>
            ;
            _local_1.@id = this.id;
            _local_1.@mp3ID = this.mp3ID;
            _local_1.@rate = this.rate.toFixed(4);
            _local_1.@swfID = this.swfID;
            _local_1.@dontPlay = int(this.dontPlay);
            return (_local_1);
        }

        public function read(_arg_1:IDataInput):void
        {
            this.id = _arg_1.readInt();
            this.mp3ID = _arg_1.readInt();
            this.rate = _arg_1.readDouble();
            this.swfID = _arg_1.readInt();
            this.dontPlay = _arg_1.readBoolean();
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.id);
            _arg_1.writeInt(this.mp3ID);
            _arg_1.writeDouble(this.rate);
            _arg_1.writeInt(this.swfID);
            _arg_1.writeBoolean(this.dontPlay);
        }

        public /*  ©init. */ function _SafeStr_333()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_333 = " SoundInfo" (String#15209)


