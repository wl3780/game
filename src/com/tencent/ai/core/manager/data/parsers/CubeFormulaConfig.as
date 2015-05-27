// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.CubeFormulaConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.CubeFormulaInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_597;
    import __AS3__.vec.*;

    public class CubeFormulaConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _cubeFormulaInfoVect:Vector.<CubeFormulaInfo>;

        public function CubeFormulaConfig()
        {
            super(20130418);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:CubeFormulaInfo;
            var _local_4:XML;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_5:XMLList = _local_2.CubeFormula;
            var _local_6:int = _local_5.length();
            this._cubeFormulaInfoVect = new Vector.<CubeFormulaInfo>();
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_4 = _local_5[_local_7];
                _local_3 = new CubeFormulaInfo();
                _local_3.decode(_local_4);
                this._cubeFormulaInfoVect.push(_local_3);
                _local_7++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            var _local_4:CubeFormulaInfo;
            var _local_2:Vector.<CubeFormulaInfo> = new Vector.<CubeFormulaInfo>();
            var _local_3:CubeFormulaInfo = (_arg_1 as CubeFormulaInfo);
            var _local_5:int;
            var _local_6:* = this._cubeFormulaInfoVect;
            for each (_local_4 in this._cubeFormulaInfoVect) {
                if (_local_4.equals(_local_3)){
                    _local_2.push(_local_4);
                };
            };
            return (_local_2);
        }

        public function findAll():Object
        {
            return (this._cubeFormulaInfoVect);
        }

        override public function clearConfig():void
        {
            ((this._cubeFormulaInfoVect) && ((this._cubeFormulaInfoVect = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:CubeFormulaInfo;
            super.readConfig(_arg_1);
            this._cubeFormulaInfoVect = new Vector.<CubeFormulaInfo>();
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_4:int;
            while (_local_4 < _local_2) {
                _local_3 = new CubeFormulaInfo();
                _local_3.read(_arg_1);
                this._cubeFormulaInfoVect.push(_local_3);
                _local_4++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            var _local_2:int = this._cubeFormulaInfoVect.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                this._cubeFormulaInfoVect[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_597()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_597 = " CubeFormulaConfig" (String#15905)


