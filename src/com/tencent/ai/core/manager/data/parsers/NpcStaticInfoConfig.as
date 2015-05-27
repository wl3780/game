// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.NpcStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.NpcStaticInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_628;
    import com.tencent.ai.core.data.*;

    public class NpcStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var npcInfoHash:Dictionary;

        public function NpcStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:NpcStaticInfo;
            this.npcInfoHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.NpcStaticInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new NpcStaticInfo();
                _local_6.decode(_local_3[_local_5]);
                this.npcInfoHash[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.npcInfoHash[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.npcInfoHash);
        }

        override public function clearConfig():void
        {
            this.npcInfoHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:NpcStaticInfo;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.npcInfoHash = new Dictionary();
            while (_local_2--) {
                _local_3 = new NpcStaticInfo();
                _local_3.read(_arg_1);
                this.npcInfoHash[_local_3.id] = _local_3;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:NpcStaticInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.npcInfoHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.npcInfoHash;
            for each (_local_3 in this.npcInfoHash) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_628()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_628 = " NpcStaticInfoConfig" (String#17234)


