// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipEnhanceLackInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_607;

    public class EquipEnhanceLackInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _equipDict:Dictionary;

        public function EquipEnhanceLackInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:XML;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this._equipDict = new Dictionary();
            var _local_4:XMLList = _local_2.AvatarStrAttr;
            var _local_5:int = _local_4.length();
            var _local_6:int;
            while (_local_6 < _local_5) {
                _local_3 = _local_4[_local_6];
                this._equipDict[this.getKey(_local_3.@type, _local_3.@lack)] = int(_local_3.@modulus);
                _local_6++;
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

        private function getKey(_arg_1:int, _arg_2:int):String
        {
            return (((_arg_1 + ",") + _arg_2));
        }

        override public function clearConfig():void
        {
            ((this._equipDict) && ((this._equipDict = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:String;
            super.readConfig(_arg_1);
            this._equipDict = new Dictionary();
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_4:int;
            while (_local_4 < _local_2) {
                _local_3 = XString.ReadString(_arg_1);
                this._equipDict[_local_3] = _arg_1.readUnsignedInt();
                _local_4++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this._equipDict);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this._equipDict;
            for (_local_3 in this._equipDict) {
                XString.WriteString(_arg_1, _local_3);
                _arg_1.writeUnsignedInt(this._equipDict[_local_3]);
            };
        }

        public /*  ©init. */ function _SafeStr_607()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_607 = " EquipEnhanceLackInfoConfig" (String#14471)


