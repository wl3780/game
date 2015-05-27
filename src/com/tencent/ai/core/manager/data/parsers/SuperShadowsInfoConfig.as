// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SuperShadowsInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.data.SuperShadowInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_647;

    public class SuperShadowsInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dialogs:Array;

        public function SuperShadowsInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:SuperShadowInfo;
            this._dialogs = new Array();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.SuperShadowDialog;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new SuperShadowInfo();
                _local_6.decode(_local_3[_local_5]);
                this._dialogs.push(_local_6);
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            var _local_3:SuperShadowInfo;
            var _local_2:SuperShadowInfo;
            for each (_local_3 in this._dialogs) {
                if (_local_3.id == _arg_1){
                    _local_2 = _local_3;
                    break;
                };
            };
            return (_local_2);
        }

        public function findAll():Object
        {
            return (this._dialogs);
        }

        override public function clearConfig():void
        {
            this._dialogs = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:SuperShadowInfo;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this._dialogs = new Array();
            var _local_3:uint;
            while (_local_3 < _local_2) {
                _local_4 = new SuperShadowInfo();
                _local_4.read(_arg_1);
                this._dialogs.push(_local_4);
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_4:SuperShadowInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = this._dialogs.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_3:uint;
            while (_local_3 < _local_2) {
                _local_4 = this._dialogs[_local_3];
                _local_4.write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_647()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_647 = " SuperShadowsInfoConfig" (String#17285)


