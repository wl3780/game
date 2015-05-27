// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.EquipStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.enum.ItemConstants;
    import com.tencent.ai.core.data.WeaponInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_610;
    import __AS3__.vec.*;

    public class EquipStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dic:Dictionary;

        public function EquipStaticInfoConfig()
        {
            super(20131120);
            this._dic = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:EquipStaticInfo;
            var _local_4:XMLList;
            var _local_5:XML;
            var _local_8:int;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            _local_4 = _local_2.Equip;
            var _local_6:int = _local_4.length();
            var _local_7:int;
            while (_local_7 < _local_6) {
                _local_5 = _local_4[_local_7];
                _local_8 = int(_local_5.@type);
                if (_local_8 == ItemConstants.PropType_WEAPON){
                    _local_3 = new WeaponInfo();
                } else {
                    _local_3 = new EquipStaticInfo();
                };
                _local_3.decode(_local_5);
                _local_3.kind = ItemConstants.PropKind_EQUIP;
                this._dic[_local_3.id] = _local_3;
                _local_7++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._dic[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:EquipStaticInfo;
            var _local_1:Vector.<EquipStaticInfo> = new Vector.<EquipStaticInfo>();
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
            var _local_4:int;
            var _local_5:EquipStaticInfo;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readInt();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = _arg_1.readInt();
                if (_local_4 == ItemConstants.PropType_WEAPON){
                    _local_5 = new WeaponInfo();
                } else {
                    _local_5 = new EquipStaticInfo();
                };
                _local_5.readExternal(_arg_1);
                _local_5.kind = ItemConstants.PropKind_EQUIP;
                this._dic[_local_5.id] = _local_5;
                _local_2++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:int;
            var _local_4:int;
            super.writeConfig(_arg_1);
            var _local_2:Vector.<EquipStaticInfo> = (this.findAll() as Vector.<EquipStaticInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeInt(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _arg_1.writeInt(_local_2[_local_3].type);
                _local_2[_local_3].writeExternal(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_610()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_610 = " EquipStaticInfoConfig" (String#16748)


