// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.CommonCDConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.CommonCDInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_596;
    import __AS3__.vec.*;

    public class CommonCDConfig extends BaseBinaryConfig implements IConfig 
    {

        private static const VERSION:uint = 1;

        public var _dic:Dictionary;

        public function CommonCDConfig()
        {
            super(VERSION);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:CommonCDInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.PublicCD;
            _local_5 = _local_3.length();
            this._dic = new Dictionary();
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_2 = _local_3[_local_4];
                _local_6 = new CommonCDInfo();
                _local_6.id = int(_local_2.@cd_type);
                _local_6.cdLimit = (int(_local_2.@cd_time) * 1000);
                this._dic[_local_6.id] = _local_6;
                _local_4++;
            };
            this._dic[0] = new CommonCDInfo();
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._dic[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:CommonCDInfo;
            var _local_1:Vector.<CommonCDInfo> = new Vector.<CommonCDInfo>();
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
            var _local_4:CommonCDInfo;
            super.readConfig(_arg_1);
            this._dic = new Dictionary();
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new CommonCDInfo();
                _local_4.read(_arg_1);
                this._dic[_local_4.id] = _local_4;
                _local_2++;
            };
            this._dic[0] = new CommonCDInfo();
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<CommonCDInfo> = (this.findAll() as Vector.<CommonCDInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        override public function getVersion():uint
        {
            return (VERSION);
        }

        public /*  ©init. */ function _SafeStr_596()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_596 = " CommonCDConfig" (String#14213)


