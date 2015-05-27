// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.CubeItemConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.CubeItemInfo;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_598;

    public class CubeItemConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _cubeItemInfoDict:Dictionary;

        public function CubeItemConfig()
        {
            super(20130418);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:CubeItemInfo;
            var _local_4:XML;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_5:XMLList = _local_2.CubeItem;
            var _local_6:int = _local_5.length();
            this._cubeItemInfoDict = new Dictionary();
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_4 = _local_5[_local_7];
                _local_3 = new CubeItemInfo();
                _local_3.decode(_local_4);
                if (_local_3.onboard_flag == 1){
                    this._cubeItemInfoDict[_local_3.getKeyStr()] = _local_3;
                };
                _local_7++;
            };
            return (true);
        }

        public function findCubeItemInfo(_arg_1:*, _arg_2:int):Object
        {
            return (this._cubeItemInfoDict[((_arg_1 + ",") + _arg_2)]);
        }

        public function find(_arg_1:*):Object
        {
            return (this._cubeItemInfoDict);
        }

        public function findAll():Object
        {
            return (this._cubeItemInfoDict);
        }

        override public function clearConfig():void
        {
            ((this._cubeItemInfoDict) && ((this._cubeItemInfoDict = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_2:CubeItemInfo;
            super.readConfig(_arg_1);
            this._cubeItemInfoDict = new Dictionary();
            var _local_3:int = _arg_1.readUnsignedInt();
            var _local_4:int;
            while (_local_4 < _local_3) {
                _local_2 = new CubeItemInfo();
                _local_2.read(_arg_1);
                this._cubeItemInfoDict[_local_2.getKeyStr()] = _local_2;
                _local_4++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            super.writeConfig(_arg_1);
            var _local_2:int = DictionaryEx.getLength(this._cubeItemInfoDict);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this._cubeItemInfoDict;
            for (_local_3 in this._cubeItemInfoDict) {
                (this._cubeItemInfoDict[_local_3] as CubeItemInfo).write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_598()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_598 = " CubeItemConfig" (String#14840)


