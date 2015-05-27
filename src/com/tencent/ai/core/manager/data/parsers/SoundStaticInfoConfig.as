// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SoundStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SoundPackageInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_642;
    import com.tencent.ai.core.data.*;

    public class SoundStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _soundPackageInfoHash:Dictionary;
        public var _all:Array;

        public function SoundStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:SoundPackageInfo;
            var _local_5:XML;
            this._soundPackageInfoHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.SoundPackageInfo;
            for each (_local_5 in _local_3) {
                _local_4 = new SoundPackageInfo();
                _local_4.decode(_local_5);
                this._soundPackageInfoHash[_local_4.id] = _local_4;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._soundPackageInfoHash[int(_arg_1)]);
        }

        public function findAll():Object
        {
            var _local_1:SoundPackageInfo;
            if (!this._all){
                this._all = [];
                for each (_local_1 in this._soundPackageInfoHash) {
                    this._all.push(_local_1);
                };
            };
            return (this._all);
        }

        override public function clearConfig():void
        {
            this._soundPackageInfoHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:SoundPackageInfo;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this._soundPackageInfoHash = new Dictionary();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new SoundPackageInfo();
                _local_4.read(_arg_1);
                this._soundPackageInfoHash[_local_4.id] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:SoundPackageInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this._soundPackageInfoHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this._soundPackageInfoHash;
            for each (_local_3 in this._soundPackageInfoHash) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_642()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_642 = " SoundStaticInfoConfig" (String#16340)


