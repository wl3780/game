// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.ConditionStaticInfo

package com.tencent.ai.core.data
{
    import flash.utils.IExternalizable;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataOutput;
    import flash.utils.IDataInput;
    import  ©init._SafeStr_228;

    public class ConditionStaticInfo implements IExternalizable, ISerialize 
    {

        public var type:int;
        public var desc:String;
        public var data1:int;
        public var data2:int;
        public var data3:int;


        public function decode(_arg_1:XML):void
        {
            this.type = int(_arg_1.@type);
            this.data1 = int(_arg_1.@data1);
            this.data2 = int(_arg_1.@data2);
            this.data3 = int(_arg_1.@data3);
            this.desc = String(_arg_1.@desc);
            if (this.desc == "0"){
                this.desc = "";
            };
        }

        public function encode():XML
        {
            var _local_1:XML = <condition/>
            ;
            _local_1.@type = this.type;
            _local_1.@data1 = this.data1;
            _local_1.@data2 = this.data2;
            _local_1.@data3 = this.data3;
            _local_1.@desc = this.desc;
            return (_local_1);
        }

        public function writeExternal(_arg_1:IDataOutput):void
        {
            _arg_1.writeInt(this.type);
            _arg_1.writeInt(this.data1);
            _arg_1.writeInt(this.data2);
            _arg_1.writeInt(this.data3);
            _arg_1.writeUTF(this.desc);
        }

        public function readExternal(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readInt();
            this.data1 = _arg_1.readInt();
            this.data2 = _arg_1.readInt();
            this.data3 = _arg_1.readInt();
            this.desc = _arg_1.readUTF();
        }

        public function read(_arg_1:IDataInput):void
        {
            this.readExternal(_arg_1);
        }

        public function write(_arg_1:IDataOutput):void
        {
            this.writeExternal(_arg_1);
        }

        public /*  ©init. */ function _SafeStr_228()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_228 = " ConditionStaticInfo" (String#16616)


