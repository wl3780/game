// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.ItemStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.ItemStaticInfo;
    import com.tencent.ai.core.enum.ItemConstants;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_615;
    import __AS3__.vec.*;

    public class ItemStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dic:Dictionary;

        public function ItemStaticInfoConfig()
        {
            super(20131120);
            this._dic = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_2:ItemStaticInfo;
            var _local_3:XMLList;
            var _local_4:int;
            var _local_5:int;
            var _local_6:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            _local_3 = _local_6.Item;
            _local_5 = _local_3.length();
            _local_4 = 0;
            while (_local_4 < _local_5) {
                _local_6 = _local_3[_local_4];
                _local_2 = new ItemStaticInfo();
                _local_2.decode(_local_6);
                _local_2.kind = (((int(_local_6.@item_type))==1) ? ItemConstants.PropKind_COMBAT : ItemConstants.PropKind_COMMON);
                this._dic[_local_2.id] = _local_2;
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
            var _local_2:ItemStaticInfo;
            var _local_1:Vector.<ItemStaticInfo> = new Vector.<ItemStaticInfo>();
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
            var _local_4:ItemStaticInfo;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new ItemStaticInfo();
                _local_4.readExternal(_arg_1);
                this._dic[_local_4.id] = _local_4;
                _local_2++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<ItemStaticInfo> = (this.findAll() as Vector.<ItemStaticInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2[_local_3].writeExternal(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_615()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_615 = " ItemStaticInfoConfig" (String#16451)


