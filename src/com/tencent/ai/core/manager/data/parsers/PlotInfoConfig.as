// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.PlotInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.data.PlotInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_632;
    import com.tencent.ai.core.data.*;

    public class PlotInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _all:Array;

        public function PlotInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:PlotInfo;
            this._all = new Array();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.PlotInfo;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new PlotInfo();
                _local_6.decode(_local_3[_local_5]);
                this._all.push(_local_6);
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (this._all);
        }

        override public function clearConfig():void
        {
            this._all = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:PlotInfo;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedInt();
            this._all = new Array();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new PlotInfo();
                _local_4.read(_arg_1);
                this._all.push(_local_4);
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_4:PlotInfo;
            super.writeConfig(_arg_1);
            var _local_2:int = this._all.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = this._all[_local_3];
                _local_4.write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_632()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_632 = " PlotInfoConfig" (String#16982)


