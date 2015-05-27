// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MailHandlerStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ScriptInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_616;

    public class MailHandlerStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var infoHash:Dictionary;


        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:ScriptInfo;
            var _local_5:XML;
            this.infoHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Handler;
            var _local_6:int;
            var _local_7:* = _local_3;
            for each (_local_5 in _local_3) {
                _local_4 = new ScriptInfo();
                _local_4.decode(_local_5.Script[0]);
                this.infoHash[int(_local_5.@type)] = _local_4;
            };
            return (false);
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
            var _local_3:uint;
            var _local_4:ScriptInfo;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.infoHash = new Dictionary();
            while (_local_2--) {
                _local_3 = _arg_1.readUnsignedInt();
                _local_4 = new ScriptInfo();
                _local_4.read(_arg_1);
                this.infoHash[_local_3] = _local_4;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            var _local_4:ScriptInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.infoHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_5:int;
            var _local_6:* = this.infoHash;
            for (_local_3 in this.infoHash) {
                _arg_1.writeUnsignedInt(uint(_local_3));
                _local_4 = this.infoHash[_local_3];
                _local_4.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_616()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_616 = " MailHandlerStaticInfoConfig" (String#14819)


