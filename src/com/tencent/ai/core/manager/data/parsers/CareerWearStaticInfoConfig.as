// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.CareerWearStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.CareerWearStaticInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_593;
    import __AS3__.vec.*;

    public class CareerWearStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        private static const VERSION:uint = 1;

        public var _dic:Dictionary;

        public function CareerWearStaticInfoConfig()
        {
            super(VERSION);
            this._dic = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:CareerWearStaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Wear;
            _local_5 = _local_3.length();
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_6 = new CareerWearStaticInfo();
                _local_6.decode(_local_3[_local_4]);
                this._dic[((((_local_6.careerID + "_") + _local_6.level) + "_") + _local_6.careerTypeLimit)] = _local_6;
                _local_4++;
            };
            return (true);
        }

        public function findCareerWear(_arg_1:int, _arg_2:int, _arg_3:int=0):CareerWearStaticInfo
        {
            var _local_4:CareerWearStaticInfo = (this._dic[((((_arg_1 + "_") + _arg_2) + "_") + _arg_3)] as CareerWearStaticInfo);
            return ((((_local_4 == null)) ? this._dic[(((_arg_1 + "_1") + "_") + _arg_3)] : _local_4));
        }

        public function find(_arg_1:*):Object
        {
            return (this._dic[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:CareerWearStaticInfo;
            var _local_1:Vector.<CareerWearStaticInfo> = new Vector.<CareerWearStaticInfo>();
            var _local_3:int;
            var _local_4:* = this._dic;
            for each (_local_2 in this._dic) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        override public function clearConfig():void
        {
            this._dic = new Dictionary();
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:CareerWearStaticInfo;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new CareerWearStaticInfo();
                _local_4.readExternal(_arg_1);
                this._dic[((((_local_4.careerID + "_") + _local_4.level) + "_") + _local_4.careerTypeLimit)] = _local_4;
                _local_2++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<CareerWearStaticInfo> = (this.findAll() as Vector.<CareerWearStaticInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeShort(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2[_local_3].writeExternal(_arg_1);
                _local_3++;
            };
        }

        override public function getVersion():uint
        {
            return (VERSION);
        }

        public /*  ©init. */ function _SafeStr_593()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_593 = " CareerWearStaticInfoConfig" (String#15611)


