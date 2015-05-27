// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.DupStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.DupPlanetInfo;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.DupStaticInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_602;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class DupStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dupPlanetInfos:Dictionary;
        public var _dupStaticInfos:Dictionary;

        public function DupStaticInfoConfig()
        {
            super(20131120);
            this._dupPlanetInfos = new Dictionary();
            this._dupStaticInfos = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:DupPlanetInfo;
            var _local_7:Vector.<DupStaticInfo>;
            var _local_8:int;
            var _local_9:int;
            var _local_10:DupStaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.DupPlanetInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new DupPlanetInfo();
                _local_6.decode(_local_3[_local_5]);
                this._dupPlanetInfos[_local_6.id] = _local_6;
                _local_7 = _local_6.dupStaticInfos;
                _local_8 = _local_7.length;
                _local_9 = 0;
                while (_local_9 < _local_8) {
                    _local_10 = _local_7[_local_9];
                    this._dupStaticInfos[_local_10.id] = _local_10;
                    _local_9++;
                };
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._dupPlanetInfos[_arg_1]);
        }

        public function findAll():Object
        {
            return (this._dupPlanetInfos);
        }

        public function findDupStaticInfo(_arg_1:int):DupStaticInfo
        {
            if (_arg_1 > 10000){
                _arg_1 = (_arg_1 / 10);
            };
            return (this._dupStaticInfos[_arg_1]);
        }

        override public function clearConfig():void
        {
            this._dupPlanetInfos = new Dictionary();
            this._dupStaticInfos = new Dictionary();
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:DupPlanetInfo;
            var _local_5:Vector.<DupStaticInfo>;
            var _local_6:int;
            var _local_7:int;
            var _local_8:DupStaticInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedShort();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new DupPlanetInfo();
                _local_4.read(_arg_1);
                this._dupPlanetInfos[_local_4.id] = _local_4;
                _local_5 = _local_4.dupStaticInfos;
                _local_6 = _local_5.length;
                _local_7 = 0;
                while (_local_7 < _local_6) {
                    _local_8 = _local_5[_local_7];
                    this._dupStaticInfos[_local_8.id] = _local_8;
                    _local_7++;
                };
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:DupPlanetInfo;
            var _local_4:int;
            var _local_5:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<DupPlanetInfo> = new Vector.<DupPlanetInfo>();
            for each (_local_3 in this._dupPlanetInfos) {
                _local_2.push(_local_3);
            };
            _local_4 = _local_2.length;
            _arg_1.writeShort(_local_4);
            _local_5 = 0;
            while (_local_5 < _local_4) {
                _local_2[_local_5].write(_arg_1);
                _local_5++;
            };
        }

        public /*  ©init. */ function _SafeStr_602()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_602 = " DupStaticInfoConfig" (String#17087)


