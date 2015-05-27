// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipEnhanceTypeInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.EquipAttribExtend;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_609;
    import __AS3__.vec.*;

    public class EquipEnhanceTypeInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _equipDict:Dictionary;

        public function EquipEnhanceTypeInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:XML;
            var _local_6:Vector.<EquipAttribExtend>;
            var _local_7:EquipAttribExtend;
            var _local_9:XML;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this._equipDict = new Dictionary();
            var _local_4:XMLList = _local_2.AvatarStrAttr;
            var _local_5:int = _local_4.length();
            var _local_8:int;
            while (_local_8 < _local_5) {
                _local_3 = _local_4[_local_8];
                _local_6 = new Vector.<EquipAttribExtend>();
                for each (_local_9 in _local_3.Attri) {
                    _local_7 = new EquipAttribExtend();
                    _local_7.type = _local_9.@type;
                    _local_7.data_1 = _local_9.@modulus;
                    _local_6.push(_local_7);
                };
                this._equipDict[int(_local_3.@type)] = _local_6;
                _local_8++;
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
            var _local_6:Vector.<EquipAttribExtend>;
            var _local_7:EquipAttribExtend;
            super.readConfig(_arg_1);
            this._equipDict = new Dictionary();
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_8:int;
            while (_local_8 < _local_2) {
                _local_4 = _arg_1.readUnsignedInt();
                _local_3 = _arg_1.readUnsignedInt();
                _local_6 = new Vector.<EquipAttribExtend>();
                _local_5 = 0;
                while (_local_5 < _local_3) {
                    _local_7 = new EquipAttribExtend();
                    _local_7.type = _arg_1.readUnsignedInt();
                    _local_7.data_1 = _arg_1.readUnsignedInt();
                    _local_7.data_2 = _arg_1.readUnsignedInt();
                    _local_6.push(_local_7);
                    _local_5++;
                };
                this._equipDict[_local_4] = _local_6;
                _local_8++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:Vector.<EquipAttribExtend>;
            var _local_4:EquipAttribExtend;
            var _local_5:*;
            var _local_6:int;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this._equipDict);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_5 in this._equipDict) {
                _arg_1.writeUnsignedInt(_local_5);
                _local_3 = this._equipDict[_local_5];
                _local_2 = _local_3.length;
                _arg_1.writeUnsignedInt(_local_2);
                _local_6 = 0;
                while (_local_6 < _local_2) {
                    _local_4 = _local_3[_local_6];
                    _arg_1.writeUnsignedInt(_local_4.type);
                    _arg_1.writeUnsignedInt(_local_4.data_1);
                    _arg_1.writeUnsignedInt(_local_4.data_2);
                    _local_6++;
                };
            };
        }

        public /*  ©init. */ function _SafeStr_609()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_609 = " EquipEnhanceTypeInfoConfig" (String#14978)


