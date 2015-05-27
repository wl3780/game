// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.MissionAwardXPConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_619;
    import __AS3__.vec.*;

    public class MissionAwardXPConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _maxXPConsts:Vector.<Vector.<int>>;

        public function MissionAwardXPConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:Vector.<int>;
            var _local_9:XMLList;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Level;
            _local_5 = _local_3.length();
            this._maxXPConsts = new Vector.<Vector.<int>>(_local_5);
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_2 = _local_3[_local_4];
                _local_9 = _local_2.Exp;
                _local_7 = _local_9.length();
                _local_8 = new Vector.<int>(_local_7);
                this._maxXPConsts[int(_local_2.@level)] = _local_8;
                _local_6 = 0;
                while (_local_6 < _local_7) {
                    _local_8[int(_local_9[_local_6].@idx)] = int(_local_9[_local_6].@value);
                    _local_6++;
                };
                _local_4++;
            };
            return (true);
        }

        public function getValue(_arg_1:int, _arg_2:int):int
        {
            return (this._maxXPConsts[_arg_1][_arg_2]);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (null);
        }

        override public function clearConfig():void
        {
            this._maxXPConsts = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Vector.<int>;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readInt();
            this._maxXPConsts = new Vector.<Vector.<int>>(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_5 = _arg_1.readInt();
                if (_local_5 > 0){
                    _local_6 = new Vector.<int>(_local_5);
                    _local_4 = 0;
                    while (_local_4 < _local_5) {
                        _local_6[_local_4] = _arg_1.readInt();
                        _local_4++;
                    };
                    this._maxXPConsts[_local_2] = _local_6;
                };
                _local_2++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:Vector.<int>;
            super.writeConfig(_arg_1);
            _local_3 = this._maxXPConsts.length;
            _arg_1.writeInt(_local_3);
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_6 = this._maxXPConsts[_local_2];
                if (_local_6){
                    _local_5 = _local_6.length;
                    _arg_1.writeInt(_local_5);
                    _local_4 = 0;
                    while (_local_4 < _local_5) {
                        _arg_1.writeInt(_local_6[_local_4]);
                        _local_4++;
                    };
                } else {
                    _arg_1.writeInt(0);
                };
                _local_2++;
            };
        }

        public /*  ©init. */ function _SafeStr_619()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_619 = " MissionAwardXPConfig" (String#14186)


