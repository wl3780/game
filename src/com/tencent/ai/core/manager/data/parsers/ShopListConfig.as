// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.ShopListConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ShopInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_637;
    import __AS3__.vec.*;

    public class ShopListConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dic:Dictionary;

        public function ShopListConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:ShopInfo;
            var _local_7:Vector.<int>;
            var _local_8:int;
            var _local_9:int;
            var _local_10:XMLList;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Shop;
            _local_5 = _local_3.length();
            this._dic = new Dictionary();
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_2 = _local_3[_local_4];
                _local_6 = new ShopInfo();
                _local_7 = new Vector.<int>();
                _local_10 = _local_2.shop_data;
                _local_9 = _local_10.length();
                _local_8 = 0;
                while (_local_8 < _local_9) {
                    _local_7.push(int(_local_10[_local_8].@data));
                    _local_8++;
                };
                _local_6.list = _local_7;
                _local_6.id = int(_local_2.@shop_id);
                _local_6.npcID = int(_local_2.@npc_id);
                _local_6.type = int(_local_2.@shop_type);
                this._dic[_local_6.npcID] = _local_6;
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
            var _local_2:ShopInfo;
            var _local_1:Vector.<ShopInfo> = new Vector.<ShopInfo>();
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
            var _local_4:ShopInfo;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ShopInfo();
                _local_4.read(_arg_1);
                this._dic[_local_4.npcID] = _local_4;
                _local_2++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<ShopInfo> = (this.findAll() as Vector.<ShopInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2[_local_3].write(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_637()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_637 = " ShopListConfig" (String#14258)


