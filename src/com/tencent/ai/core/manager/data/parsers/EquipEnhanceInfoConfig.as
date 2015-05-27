// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipEnhanceInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EquipEnhanceInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_606;

    public class EquipEnhanceInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _equipEnhanceInfoDict:Dictionary;

        public function EquipEnhanceInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:EquipEnhanceInfo;
            var _local_4:XML;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this._equipEnhanceInfoDict = new Dictionary();
            var _local_5:XMLList = _local_2.AvatarStrConf;
            var _local_6:int = _local_5.length();
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_4 = _local_5[_local_7];
                _local_3 = new EquipEnhanceInfo();
                _local_3.decode(_local_4);
                this._equipEnhanceInfoDict[_local_3.equipEnhanceBasicInfo.toString()] = _local_3;
                _local_7++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._equipEnhanceInfoDict[_arg_1]);
        }

        public function findAll():Object
        {
            return (this._equipEnhanceInfoDict);
        }

        override public function clearConfig():void
        {
            ((this._equipEnhanceInfoDict) && ((this._equipEnhanceInfoDict = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_2:EquipEnhanceInfo;
            super.readConfig(_arg_1);
            this._equipEnhanceInfoDict = new Dictionary();
            var _local_3:int = _arg_1.readUnsignedInt();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2 = new EquipEnhanceInfo();
                _local_2.read(_arg_1);
                this._equipEnhanceInfoDict[_local_2.equipEnhanceBasicInfo.toString()] = _local_2;
                _local_4++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this._equipEnhanceInfoDict);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this._equipEnhanceInfoDict;
            for (_local_3 in this._equipEnhanceInfoDict) {
                (this._equipEnhanceInfoDict[_local_3] as EquipEnhanceInfo).write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_606()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_606 = " EquipEnhanceInfoConfig" (String#14228)


