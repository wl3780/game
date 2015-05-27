// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.PetStaticInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.utils.IXMLSerialize;
    import com.tencent.ai.core.utils.ISerialize;
    import flash.utils.Dictionary;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_304;

    public class PetStaticInfo implements IXMLSerialize, ISerialize 
    {

        public var petType:int;
        public var petFactory:String;
        public var petID:int;
        public var petAIID:int;
        public var petGroupID:int;
        public var evolePetID:int;
        public var evoleLevel:int;
        public var aptds:Dictionary;
        public var description:String = "";
        public var height:int;
        public var petName:String;
        public var basePetID:int;
        public var couponsPrice:int;
        public var scorePrice:int;
        public var attackType:int;


        public function decode(_arg_1:XML):void
        {
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:int;
            var _local_7:XML;
            var _local_8:Dictionary;
            var _local_9:XMLList;
            var _local_10:int;
            var _local_11:int;
            var _local_12:XML;
            var _local_13:PetStaticSkillInfo;
            this.petID = int(_arg_1.@pet_id);
            this.basePetID = int(_arg_1.@base_pet_id);
            this.petAIID = int(_arg_1.@aiID);
            this.petGroupID = int(_arg_1.@group_id);
            this.evolePetID = int(_arg_1.@evole_id);
            this.evoleLevel = int(_arg_1.@evole_level);
            this.height = int(_arg_1.@height);
            this.petName = String(_arg_1.@pet_name);
            this.couponsPrice = int(_arg_1.@tocken_price);
            this.scorePrice = int(_arg_1.@score_price);
            this.attackType = int(_arg_1.@attack_type);
            var _local_2:XML = _arg_1.description[0];
            if (_local_2 != null){
                this.description = _local_2.toString();
            };
            this.aptds = new Dictionary();
            var _local_3:XML = _arg_1.Aptds[0];
            if (_local_3 != null){
                _local_4 = _local_3.Aptd;
                _local_5 = _local_4.length();
                _local_6 = 0;
                while (_local_6 < _local_5) {
                    _local_7 = _local_4[_local_6];
                    _local_8 = new Dictionary();
                    _local_9 = _local_7.Skills;
                    _local_10 = _local_9.length();
                    _local_11 = 0;
                    while (_local_11 < _local_10) {
                        _local_12 = _local_9[_local_11];
                        _local_13 = new PetStaticSkillInfo();
                        _local_13.decode(_local_12);
                        _local_8[_local_13.learnLevel] = _local_13;
                        _local_11++;
                    };
                    this.aptds[int(_local_7.@aptitude)] = _local_8;
                    _local_6++;
                };
            };
        }

        public function encode()
        {
            return (null);
        }

        public function read(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:Dictionary;
            var _local_5:uint;
            var _local_6:PetStaticSkillInfo;
            this.petID = _arg_1.readInt();
            this.basePetID = _arg_1.readInt();
            this.petAIID = _arg_1.readInt();
            this.petGroupID = _arg_1.readInt();
            this.evolePetID = _arg_1.readInt();
            this.evoleLevel = _arg_1.readInt();
            this.height = _arg_1.readInt();
            this.couponsPrice = _arg_1.readInt();
            this.scorePrice = _arg_1.readInt();
            this.attackType = _arg_1.readUnsignedByte();
            this.petName = XString.ReadString(_arg_1);
            this.description = XString.ReadString(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.aptds = new Dictionary();
            while (_local_2--) {
                _local_3 = _arg_1.readUnsignedInt();
                _local_4 = new Dictionary();
                _local_5 = _arg_1.readUnsignedInt();
                while (_local_5--) {
                    _local_6 = new PetStaticSkillInfo();
                    _local_6.read(_arg_1);
                    _local_4[_local_6.learnLevel] = _local_6;
                };
                this.aptds[_local_3] = _local_4;
            };
        }

        public function write(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            var _local_4:Dictionary;
            var _local_5:PetStaticSkillInfo;
            _arg_1.writeInt(this.petID);
            _arg_1.writeInt(this.basePetID);
            _arg_1.writeInt(this.petAIID);
            _arg_1.writeInt(this.petGroupID);
            _arg_1.writeInt(this.evolePetID);
            _arg_1.writeInt(this.evoleLevel);
            _arg_1.writeInt(this.height);
            _arg_1.writeInt(this.couponsPrice);
            _arg_1.writeInt(this.scorePrice);
            _arg_1.writeByte(this.attackType);
            XString.WriteString(_arg_1, this.petName);
            XString.WriteString(_arg_1, this.description);
            var _local_2:uint = DictionaryEx.getLength(this.aptds);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_3 in this.aptds) {
                _arg_1.writeInt(int(_local_3));
                _local_4 = this.aptds[_local_3];
                _arg_1.writeUnsignedInt(DictionaryEx.getLength(_local_4));
                for each (_local_5 in _local_4) {
                    _local_5.write(_arg_1);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_304()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_304 = " PetStaticInfo" (String#17129)


