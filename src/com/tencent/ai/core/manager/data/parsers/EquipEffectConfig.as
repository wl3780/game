// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipEffectConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EquipEffect;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_605;
    import com.tencent.ai.core.data.*;

    public class EquipEffectConfig extends BaseBinaryConfig implements IConfig 
    {

        public var effectInfos:Dictionary;
        public var allEffectInfos:Array;

        public function EquipEffectConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:EquipEffect;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.EquipEffect;
            this.effectInfos = new Dictionary();
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new EquipEffect();
                _local_6.decode(_local_3[_local_5]);
                this.effectInfos[((((((("type:" + _local_6.type) + "rare:") + _local_6.rare) + "strengthen:") + _local_6.strengthen) + "career:") + _local_6.careerID)] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function findEquipEffect(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):EquipEffect
        {
            return (this.effectInfos[((((((("type:" + _arg_1) + "rare:") + _arg_2) + "strengthen:") + _arg_3) + "career:") + _arg_4)]);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (null);
        }

        override public function clearConfig():void
        {
            ((this.effectInfos) && ((this.effectInfos = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:EquipEffect;
            var _local_4:String;
            super.readConfig(_arg_1);
            this.effectInfos = new Dictionary();
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_5:int;
            while (_local_5 < _local_2) {
                _local_3 = new EquipEffect();
                _local_4 = XString.ReadString(_arg_1);
                _local_3.read(_arg_1);
                this.effectInfos[_local_4] = _local_3;
                _local_5++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:String;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this.effectInfos);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_3 in this.effectInfos) {
                XString.WriteString(_arg_1, _local_3);
                (this.effectInfos[_local_3] as EquipEffect).write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_605()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_605 = " EquipEffectConfig" (String#15371)


