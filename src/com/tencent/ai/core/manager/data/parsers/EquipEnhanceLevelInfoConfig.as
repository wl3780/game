// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipEnhanceLevelInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EquipEnhanceLevelInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_608;
    import __AS3__.vec.*;

    public class EquipEnhanceLevelInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        private var _equipDict:Dictionary;

        public function EquipEnhanceLevelInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:XML;
            var _local_6:EquipEnhanceLevelInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this._equipDict = new Dictionary();
            var _local_4:XMLList = _local_2.AvatarStrAttr;
            var _local_5:int = _local_4.length();
            var _local_7:int;
            while (_local_7 < _local_5) {
                _local_3 = _local_4[_local_7];
                _local_6 = new EquipEnhanceLevelInfo();
                _local_6.attackVect = Vector.<int>(_local_3.Attack.Modulus.@value.toXMLString().split("\n"));
                _local_6.defenceVect = Vector.<int>(_local_3.Defence.Modulus.@value.toXMLString().split("\n"));
                _local_6.mgDefenceVect = Vector.<int>(_local_3.MgDefence.Modulus.@value.toXMLString().split("\n"));
                this._equipDict[int(_local_3.@avatar_level)] = _local_6;
                _local_7++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._equipDict[_arg_1]);
        }

        public function findAll():Object
        {
            return (this._equipDict);
        }

        override public function clearConfig():void
        {
            ((this._equipDict) && ((this._equipDict = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:EquipEnhanceLevelInfo;
            super.readConfig(_arg_1);
            this._equipDict = new Dictionary();
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_7:int;
            while (_local_7 < _local_2) {
                _local_4 = _arg_1.readUnsignedInt();
                _local_6 = new EquipEnhanceLevelInfo();
                _local_6.attackVect = new Vector.<int>();
                _local_3 = _arg_1.readUnsignedInt();
                _local_5 = 0;
                while (_local_5 < _local_3) {
                    _local_6.attackVect.push(_arg_1.readUnsignedInt());
                    _local_5++;
                };
                _local_6.defenceVect = new Vector.<int>();
                _local_3 = _arg_1.readUnsignedInt();
                _local_5 = 0;
                while (_local_5 < _local_3) {
                    _local_6.defenceVect.push(_arg_1.readUnsignedInt());
                    _local_5++;
                };
                _local_6.mgDefenceVect = new Vector.<int>();
                _local_3 = _arg_1.readUnsignedInt();
                _local_5 = 0;
                while (_local_5 < _local_3) {
                    _local_6.mgDefenceVect.push(_arg_1.readUnsignedInt());
                    _local_5++;
                };
                this._equipDict[_local_4] = _local_6;
                _local_7++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:EquipEnhanceLevelInfo;
            var _local_5:*;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this._equipDict);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_5 in this._equipDict) {
                _arg_1.writeUnsignedInt(_local_5);
                _local_4 = this._equipDict[_local_5];
                _local_2 = _local_4.attackVect.length;
                _arg_1.writeUnsignedInt(_local_2);
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _arg_1.writeUnsignedInt(_local_4.attackVect[_local_3]);
                    _local_3++;
                };
                _local_2 = _local_4.defenceVect.length;
                _arg_1.writeUnsignedInt(_local_2);
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _arg_1.writeUnsignedInt(_local_4.defenceVect[_local_3]);
                    _local_3++;
                };
                _local_2 = _local_4.mgDefenceVect.length;
                _arg_1.writeUnsignedInt(_local_2);
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _arg_1.writeUnsignedInt(_local_4.mgDefenceVect[_local_3]);
                    _local_3++;
                };
            };
        }

        public /*  ©init. */ function _SafeStr_608()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_608 = " EquipEnhanceLevelInfoConfig" (String#15521)


