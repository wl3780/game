// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MonsterBloodStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_622;

    public class MonsterBloodStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var m_diffHash:Dictionary;

        public function MonsterBloodStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XML;
            var _local_5:XMLList;
            var _local_6:Dictionary;
            var _local_7:XML;
            var _local_8:String;
            var _local_9:Array;
            this.m_diffHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Diff;
            for each (_local_4 in _local_3) {
                _local_5 = _local_4.Monster;
                _local_6 = new Dictionary();
                for each (_local_7 in _local_5) {
                    _local_8 = _local_7.toString();
                    _local_9 = _local_8.split(",");
                    _local_6[int(_local_7.@type)] = _local_9;
                };
                this.m_diffHash[int(_local_4.@level)] = _local_6;
            };
            return (true);
        }

        public function findBloodCount(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:Array;
            if (((this.m_diffHash) && (this.m_diffHash[_arg_1]))){
                _local_4 = this.m_diffHash[_arg_1][_arg_2];
                if (((_local_4) && ((_arg_3 <= _local_4.length)))){
                    return (_local_4[(_arg_3 - 1)]);
                };
            };
            return (1);
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
            this.m_diffHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:uint;
            var _local_4:Dictionary;
            var _local_5:uint;
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:Array;
            super.readConfig(_arg_1);
            this.m_diffHash = new Dictionary();
            var _local_2:uint = _arg_1.readUnsignedInt();
            while (_local_2--) {
                _local_3 = _arg_1.readUnsignedInt();
                _local_4 = new Dictionary();
                _local_5 = _arg_1.readUnsignedInt();
                while (_local_5--) {
                    _local_6 = _arg_1.readUnsignedInt();
                    _local_7 = _arg_1.readUnsignedInt();
                    _local_8 = [];
                    while (_local_7--) {
                        _local_8.push(String(_arg_1.readUnsignedInt()));
                    };
                    _local_4[_local_6] = _local_8;
                };
                this.m_diffHash[_local_3] = _local_4;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            var _local_4:Dictionary;
            var _local_5:uint;
            var _local_6:*;
            var _local_7:Array;
            var _local_8:uint;
            var _local_9:int;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.m_diffHash);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_3 in this.m_diffHash) {
                _arg_1.writeUnsignedInt(uint(_local_3));
                _local_4 = this.m_diffHash[_local_3];
                _local_5 = DictionaryEx.getLength(_local_4);
                _arg_1.writeUnsignedInt(_local_5);
                for (_local_6 in _local_4) {
                    _arg_1.writeUnsignedInt(uint(_local_6));
                    _local_7 = _local_4[_local_6];
                    _local_8 = _local_7.length;
                    _arg_1.writeUnsignedInt(_local_8);
                    _local_9 = 0;
                    while (_local_9 < _local_8) {
                        _arg_1.writeUnsignedInt(uint(_local_7[_local_9]));
                        _local_9++;
                    };
                };
            };
        }

        public /*  ©init. */ function _SafeStr_622()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_622 = " MonsterBloodStaticInfoConfig" (String#17288)


