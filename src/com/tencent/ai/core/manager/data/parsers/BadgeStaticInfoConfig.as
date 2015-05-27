// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.BadgeStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.BadgeInfo;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_591;
    import __AS3__.vec.*;

    public class BadgeStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dataInBadge:Dictionary;
        public var _dataInGroup:Dictionary;

        public function BadgeStaticInfoConfig()
        {
            super(20130427);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XML;
            var _local_5:BadgeInfo;
            var _local_6:Vector.<BadgeInfo>;
            this._dataInBadge = new Dictionary();
            this._dataInGroup = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.Item;
            for each (_local_4 in _local_3) {
                _local_5 = new BadgeInfo();
                _local_5.decode(_local_4);
                this._dataInBadge[_local_5.badge] = _local_5;
                this._dataInGroup[_local_5.group] = ((this._dataInGroup[_local_5.group]) || (new Vector.<BadgeInfo>()));
                _local_6 = this._dataInGroup[_local_5.group];
                _local_6.push(_local_5);
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._dataInBadge[_arg_1]);
        }

        public function findAll():Object
        {
            return (this._dataInBadge);
        }

        public function getBadgeInfoByGroup(_arg_1:int):Vector.<BadgeInfo>
        {
            return (this._dataInGroup[_arg_1]);
        }

        override public function clearConfig():void
        {
            this._dataInBadge = null;
            this._dataInGroup = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:BadgeInfo;
            var _local_5:Vector.<BadgeInfo>;
            super.readConfig(_arg_1);
            this._dataInBadge = new Dictionary();
            this._dataInGroup = new Dictionary();
            var _local_2:uint = _arg_1.readUnsignedInt();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new BadgeInfo();
                _local_4.read(_arg_1);
                this._dataInBadge[_local_4.badge] = _local_4;
                this._dataInGroup[_local_4.group] = ((this._dataInGroup[_local_4.group]) || (new Vector.<BadgeInfo>()));
                _local_5 = this._dataInGroup[_local_4.group];
                _local_5.push(_local_4);
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:BadgeInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this._dataInBadge);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this._dataInBadge;
            for each (_local_3 in this._dataInBadge) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_591()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_591 = " BadgeStaticInfoConfig" (String#15467)


