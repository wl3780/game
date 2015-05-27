// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MonsterStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_623;
    import com.tencent.ai.core.data.*;

    public class MonsterStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var staticInfos:DictionaryEx;

        public function MonsterStaticInfoConfig()
        {
            super(20131128);
            this.staticInfos = new DictionaryEx();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:MonsterStaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.MonsterStaticInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new MonsterStaticInfo();
                _local_7.decode(_local_6);
                this.staticInfos[_local_7.monsterID] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.staticInfos[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:MonsterStaticInfo;
            var _local_1:Array = [];
            for each (_local_2 in this.staticInfos) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        override public function clearConfig():void
        {
            this.staticInfos = new DictionaryEx();
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:MonsterStaticInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new MonsterStaticInfo();
                _local_4.read(_arg_1);
                this.staticInfos[_local_4.monsterID] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:MonsterStaticInfo;
            super.writeConfig(_arg_1);
            var _local_2:int = this.staticInfos.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.staticInfos;
            for each (_local_3 in this.staticInfos) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_623()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_623 = " MonsterStaticInfoConfig" (String#16763)


