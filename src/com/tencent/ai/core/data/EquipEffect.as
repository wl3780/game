// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EquipEffect

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_248;

    public class EquipEffect implements IXMLSerialize, ISerialize 
    {

        public var type:int;
        public var rare:int;
        public var strengthen:int;
        public var effectType:int;
        public var careerID:int;
        public var effectArg:Array;


        public function decode(_arg_1:XML):void
        {
            this.type = _arg_1.@type;
            this.rare = _arg_1.@rare;
            this.strengthen = _arg_1.@strengthen;
            this.effectType = _arg_1.@effectType;
            this.careerID = _arg_1.@careerID;
            this.effectArg = String(_arg_1.@effectArg).split(",");
        }

        public function encode()
        {
            return ("");
        }

        public function read(_arg_1:IDataInput):void
        {
            this.type = _arg_1.readUnsignedByte();
            this.rare = _arg_1.readUnsignedByte();
            this.strengthen = _arg_1.readUnsignedByte();
            this.effectType = _arg_1.readUnsignedByte();
            this.careerID = _arg_1.readUnsignedByte();
            var _local_2:int = _arg_1.readUnsignedByte();
            this.effectArg = [];
            var _local_3:int;
            while (_local_3 < _local_2) {
                this.effectArg.push(_arg_1.readUTF());
                _local_3++;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            _arg_1.writeByte(this.type);
            _arg_1.writeByte(this.rare);
            _arg_1.writeByte(this.strengthen);
            _arg_1.writeByte(this.effectType);
            _arg_1.writeByte(this.careerID);
            var _local_2:int = this.effectArg.length;
            _arg_1.writeByte(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _arg_1.writeUTF(this.effectArg[_local_3]);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_248()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_248 = " EquipEffect" (String#16118)


