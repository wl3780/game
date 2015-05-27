// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.AutorunStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.data.AutorunInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_590;
    import __AS3__.vec.*;

    public class AutorunStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var loginRunHash:Dictionary;
        public var runHash:Dictionary;

        public function AutorunStaticInfoConfig()
        {
            super(20130404);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XML;
            var _local_5:XMLList;
            var _local_6:XML;
            var _local_7:int;
            var _local_8:XMLList;
            var _local_9:int;
            var _local_10:Vector.<ScriptInfo>;
            var _local_11:int;
            var _local_12:XML;
            var _local_13:ScriptInfo;
            var _local_14:AutorunInfo;
            this.loginRunHash = new Dictionary();
            this.runHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XML = _local_2.LoginRun[0];
            for each (_local_4 in _local_3.Item) {
                _local_7 = int(_local_4.@id);
                _local_8 = _local_4.Script;
                _local_9 = _local_8.length();
                _local_10 = new Vector.<ScriptInfo>();
                _local_11 = 0;
                while (_local_11 < _local_9) {
                    _local_12 = _local_8[_local_11];
                    _local_13 = new ScriptInfo();
                    _local_13.decode(_local_12);
                    _local_10.push(_local_13);
                    _local_11++;
                };
                this.loginRunHash[_local_7] = _local_10;
            };
            _local_5 = _local_2.Run;
            for each (_local_6 in _local_5) {
                _local_14 = new AutorunInfo();
                _local_14.decode(_local_6);
                this.runHash[_local_14.id] = _local_14;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (this.runHash);
        }

        public function getLoginRunScripts(_arg_1:int):Vector.<ScriptInfo>
        {
            return (this.loginRunHash[_arg_1]);
        }

        public function getRunScripts(_arg_1:int):Vector.<ScriptInfo>
        {
            var _local_2:AutorunInfo = this.runHash[_arg_1];
            if (_local_2){
                return (_local_2.scriptList);
            };
            return (null);
        }

        public function isOnce(_arg_1:int):Boolean
        {
            var _local_2:AutorunInfo = this.runHash[_arg_1];
            if (_local_2){
                return (_local_2.once);
            };
            return (true);
        }

        public function getRunInfoByEvent(_arg_1:String):Vector.<AutorunInfo>
        {
            var _local_3:AutorunInfo;
            var _local_2:Vector.<AutorunInfo> = new Vector.<AutorunInfo>();
            for each (_local_3 in this.runHash) {
                if (_local_3.eventType == _arg_1){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        override public function clearConfig():void
        {
            this.loginRunHash = null;
            this.runHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_6:uint;
            var _local_7:uint;
            var _local_8:Vector.<ScriptInfo>;
            var _local_9:int;
            var _local_10:ScriptInfo;
            var _local_11:AutorunInfo;
            super.readConfig(_arg_1);
            this.loginRunHash = new Dictionary();
            var _local_2:uint = _arg_1.readUnsignedInt();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_6 = _arg_1.readUnsignedInt();
                _local_7 = _arg_1.readUnsignedInt();
                _local_8 = new Vector.<ScriptInfo>();
                _local_9 = 0;
                while (_local_9 < _local_7) {
                    _local_10 = new ScriptInfo();
                    _local_10.read(_arg_1);
                    _local_8.push(_local_10);
                    _local_9++;
                };
                this.loginRunHash[_local_6] = _local_8;
                _local_3++;
            };
            this.runHash = new Dictionary();
            var _local_4:uint = _arg_1.readUnsignedInt();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_11 = new AutorunInfo();
                _local_11.read(_arg_1);
                this.runHash[_local_11.id] = _local_11;
                _local_5++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            var _local_4:uint;
            var _local_5:*;
            var _local_6:Vector.<ScriptInfo>;
            var _local_7:uint;
            var _local_8:ScriptInfo;
            var _local_9:AutorunInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.loginRunHash);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_3 in this.loginRunHash) {
                _arg_1.writeUnsignedInt(uint(_local_3));
                _local_6 = this.loginRunHash[_local_3];
                _local_7 = _local_6.length;
                _arg_1.writeUnsignedInt(_local_7);
                for each (_local_8 in _local_6) {
                    _local_8.write(_arg_1);
                };
            };
            _local_4 = DictionaryEx.getLength(this.runHash);
            _arg_1.writeUnsignedInt(_local_4);
            for (_local_5 in this.runHash) {
                _local_9 = this.runHash[_local_5];
                _local_9.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_590()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_590 = " AutorunStaticInfoConfig" (String#14216)


