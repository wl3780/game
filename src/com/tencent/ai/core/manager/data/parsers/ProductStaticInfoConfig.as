// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.ProductStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ProductStaticInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_633;
    import __AS3__.vec.*;

    public class ProductStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dic:Dictionary;

        public function ProductStaticInfoConfig()
        {
            super(20131120);
            this._dic = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:ProductStaticInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.BuyItem;
            _local_5 = _local_3.length();
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_6 = new ProductStaticInfo();
                _local_6.decode(_local_3[_local_4]);
                this._dic[_local_6.id] = _local_6;
                _local_4++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._dic[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:ProductStaticInfo;
            var _local_1:Vector.<ProductStaticInfo> = new Vector.<ProductStaticInfo>();
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
            var _local_4:ProductStaticInfo;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ProductStaticInfo();
                _local_4.read(_arg_1);
                this._dic[_local_4.id] = _local_4;
                _local_2++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<ProductStaticInfo> = (this.findAll() as Vector.<ProductStaticInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_633()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_633 = " ProductStaticInfoConfig" (String#16985)


