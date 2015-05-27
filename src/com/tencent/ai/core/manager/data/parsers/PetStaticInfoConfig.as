// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.PetStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.PetStaticInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_631;

    public class PetStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var staticInfos:Dictionary;

        public function PetStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:PetStaticInfo;
            this.staticInfos = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Pet;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new PetStaticInfo();
                _local_7.decode(_local_6);
                this.staticInfos[_local_7.petID] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.staticInfos[_arg_1]);
        }

        public function getAllBattleSkillsBy(_arg_1:int, _arg_2:int):Dictionary
        {
            var _local_5:Dictionary;
            var _local_6:*;
            var _local_3:Dictionary = new Dictionary();
            var _local_4:PetStaticInfo = (this.staticInfos[_arg_1] as PetStaticInfo);
            while (_local_4) {
                _local_5 = _local_4.aptds[_arg_2];
                var _local_7:int;
                var _local_8:* = _local_5;
                for (_local_6 in _local_5) {
                    _local_3[_local_6] = _local_5[_local_6];
                };
                _local_4 = (this.staticInfos[_local_4.evolePetID] as PetStaticInfo);
            };
            return (_local_3);
        }

        public function findAll():Object
        {
            var _local_2:PetStaticInfo;
            var _local_1:Array = [];
            for each (_local_2 in this.staticInfos) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        override public function clearConfig():void
        {
            this.staticInfos = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:PetStaticInfo;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.staticInfos = new Dictionary();
            while (_local_2--) {
                _local_3 = new PetStaticInfo();
                _local_3.read(_arg_1);
                this.staticInfos[_local_3.petID] = _local_3;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:PetStaticInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.staticInfos);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.staticInfos;
            for each (_local_3 in this.staticInfos) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_631()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_631 = " PetStaticInfoConfig" (String#17282)


