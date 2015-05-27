// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.XPConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_651;
    import __AS3__.vec.*;

    public class XPConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _maxXPConsts:Vector.<int>;

        public function XPConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.MaxExp;
            _local_5 = _local_3.length();
            this._maxXPConsts = new Vector.<int>(_local_5);
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_2 = _local_3[_local_4];
                this._maxXPConsts[int(_local_2.@level)] = int(_local_2.@max_exp);
                _local_4++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._maxXPConsts[_arg_1]);
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
            super.readConfig(_arg_1);
            this._maxXPConsts = _arg_1.readObject();
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            super.writeConfig(_arg_1);
            _arg_1.writeObject(this._maxXPConsts);
        }

        public /*  ©init. */ function _SafeStr_651()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_651 = " XPConfig" (String#14357)


