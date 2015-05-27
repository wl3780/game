// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipCombinInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EquipCombinInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_604;

    public class EquipCombinInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _equipCombinInfoDict:Dictionary;

        public function EquipCombinInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:EquipCombinInfo;
            var _local_4:XML;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this._equipCombinInfoDict = new Dictionary();
            var _local_5:XMLList = _local_2.CombinItem;
            var _local_6:int = _local_5.length();
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_4 = _local_5[_local_7];
                _local_3 = new EquipCombinInfo();
                _local_3.decode(_local_4);
                this._equipCombinInfoDict[_local_3.itemID] = _local_3;
                _local_7++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._equipCombinInfoDict[_arg_1]);
        }

        public function findAll():Object
        {
            return (this._equipCombinInfoDict);
        }

        override public function clearConfig():void
        {
            ((this._equipCombinInfoDict) && ((this._equipCombinInfoDict = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_2:EquipCombinInfo;
            super.readConfig(_arg_1);
            this._equipCombinInfoDict = new Dictionary();
            var _local_3:int = _arg_1.readUnsignedInt();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2 = new EquipCombinInfo();
                _local_2.read(_arg_1);
                this._equipCombinInfoDict[_local_2.itemID] = _local_2;
                _local_4++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this._equipCombinInfoDict);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this._equipCombinInfoDict;
            for (_local_3 in this._equipCombinInfoDict) {
                (this._equipCombinInfoDict[_local_3] as EquipCombinInfo).write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_604()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_604 = " EquipCombinInfoConfig" (String#16223)


