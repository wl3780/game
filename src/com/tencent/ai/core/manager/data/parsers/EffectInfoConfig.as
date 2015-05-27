// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EffectInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.ai.core.data.EffectStaticInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_603;

    public class EffectInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var effectInfos:DictionaryEx;
        public var allEffectInfos:Array;

        public function EffectInfoConfig()
        {
            super(20131121);
            this.effectInfos = new DictionaryEx();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:EffectStaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.EffectInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new EffectStaticInfo();
                _local_6.decode(_local_3[_local_5]);
                this.effectInfos[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.effectInfos[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_1:EffectStaticInfo;
            if (this.allEffectInfos == null){
                this.allEffectInfos = [];
                var _local_2:int;
                var _local_3:* = this.effectInfos;
                for each (_local_1 in this.effectInfos) {
                    this.allEffectInfos.push(_local_1);
                };
            };
            return (this.allEffectInfos);
        }

        override public function clearConfig():void
        {
            this.effectInfos = new DictionaryEx();
            this.allEffectInfos = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:EffectStaticInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new EffectStaticInfo();
                _local_4.read(_arg_1);
                this.effectInfos[_local_4.id] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:EffectStaticInfo;
            super.writeConfig(_arg_1);
            var _local_2:int = this.effectInfos.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.effectInfos;
            for each (_local_3 in this.effectInfos) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_603()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_603 = " EffectInfoConfig" (String#15704)


