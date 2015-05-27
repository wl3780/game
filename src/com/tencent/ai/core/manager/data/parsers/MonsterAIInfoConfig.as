// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MonsterAIInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_621;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class MonsterAIInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var aiDicts:Dictionary;

        public function MonsterAIInfoConfig()
        {
            super(20131120);
            this.aiDicts = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:MonsterAIInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.MonsterAIInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = new MonsterAIInfo();
                _local_7.decode(_local_6);
                this.aiDicts[_local_7.aiID] = _local_7;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.aiDicts[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:MonsterAIInfo;
            var _local_1:Vector.<MonsterAIInfo> = new Vector.<MonsterAIInfo>();
            var _local_3:int;
            var _local_4:* = this.aiDicts;
            for each (_local_2 in this.aiDicts) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        override public function clearConfig():void
        {
            this.aiDicts = new Dictionary();
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:MonsterAIInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new MonsterAIInfo();
                _local_4.read(_arg_1);
                this.aiDicts[_local_4.aiID] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            var _local_2:Vector.<MonsterAIInfo> = (this.findAll() as Vector.<MonsterAIInfo>);
            var _local_3:int = _local_2.length;
            _arg_1.writeShort(_local_3);
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2[_local_4].write(_arg_1);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_621()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_621 = " MonsterAIInfoConfig" (String#15380)


