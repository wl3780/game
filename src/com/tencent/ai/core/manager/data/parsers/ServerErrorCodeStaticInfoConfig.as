// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.ServerErrorCodeStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ServerErrorCodeInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_636;

    public class ServerErrorCodeStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var errorHash:Dictionary;

        public function ServerErrorCodeStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XML;
            var _local_5:ServerErrorCodeInfo;
            this.errorHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Error;
            for each (_local_4 in _local_3) {
                _local_5 = new ServerErrorCodeInfo();
                _local_5.decode(_local_4);
                this.errorHash[_local_5.code] = _local_5;
            };
            return (false);
        }

        public function find(_arg_1:*):Object
        {
            return (this.errorHash[_arg_1]);
        }

        public function findAll():Object
        {
            return (this.errorHash);
        }

        override public function clearConfig():void
        {
            this.errorHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:ServerErrorCodeInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedInt();
            this.errorHash = new Dictionary();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new ServerErrorCodeInfo();
                _local_4.read(_arg_1);
                this.errorHash[_local_4.code] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:ServerErrorCodeInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.errorHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.errorHash;
            for each (_local_3 in this.errorHash) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_636()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_636 = " ServerErrorCodeStaticInfoConfig" (String#13874)


