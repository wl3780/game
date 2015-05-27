// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.WarSoulStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.WarSoulStaticInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_649;

    public class WarSoulStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var staticInfos:Dictionary;

        public function WarSoulStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:XML;
            var _local_7:int;
            var _local_8:int;
            var _local_9:XMLList;
            var _local_10:int;
            var _local_11:int;
            var _local_12:XML;
            var _local_13:WarSoulStaticInfo;
            this.staticInfos = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.WarSoul;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_3[_local_5];
                _local_7 = int(_local_6.@quality);
                _local_8 = int(_local_6.@level);
                _local_9 = _local_6.war_soul;
                _local_10 = _local_9.length();
                _local_11 = 0;
                while (_local_11 < _local_10) {
                    _local_12 = _local_9[_local_11];
                    _local_13 = new WarSoulStaticInfo();
                    _local_13.quality = _local_7;
                    _local_13.level = _local_8;
                    _local_13.decode(_local_12);
                    this.staticInfos[_local_13.toKey()] = _local_13;
                    _local_11++;
                };
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            throw (new Error("此方法无效。"));
        }

        public function findWarSoul(_arg_1:int, _arg_2:int, _arg_3:int):WarSoulStaticInfo
        {
            return (this.staticInfos[((((_arg_1 + "_") + _arg_2) + "_") + _arg_3)]);
        }

        public function findAll():Object
        {
            return (this.staticInfos);
        }

        override public function clearConfig():void
        {
            this.staticInfos = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:WarSoulStaticInfo;
            super.readConfig(_arg_1);
            this.staticInfos = new Dictionary();
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new WarSoulStaticInfo();
                _local_4.read(_arg_1);
                this.staticInfos[_local_4.toKey()] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:WarSoulStaticInfo;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this.staticInfos);
            _arg_1.writeShort(_local_2);
            var _local_4:int;
            var _local_5:* = this.staticInfos;
            for each (_local_3 in this.staticInfos) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_649()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_649 = " WarSoulStaticInfoConfig" (String#16709)


