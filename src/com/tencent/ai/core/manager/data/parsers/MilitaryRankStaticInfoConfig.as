// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MilitaryRankStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.MilitaryRankInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_618;

    public class MilitaryRankStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var infoHash:Dictionary;

        public function MilitaryRankStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XML;
            var _local_5:MilitaryRankInfo;
            this.infoHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Rank;
            for each (_local_4 in _local_3) {
                _local_5 = new MilitaryRankInfo();
                _local_5.decode(_local_4);
                this.infoHash[_local_5.level] = _local_5;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.infoHash[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.infoHash);
        }

        override public function clearConfig():void
        {
            this.infoHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:MilitaryRankInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedInt();
            this.infoHash = new Dictionary();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new MilitaryRankInfo();
                _local_4.read(_arg_1);
                this.infoHash[_local_4.level] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:MilitaryRankInfo;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this.infoHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.infoHash;
            for each (_local_3 in this.infoHash) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_618()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_618 = " MilitaryRankStaticInfoConfig" (String#15098)


