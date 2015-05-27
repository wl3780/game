// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SuitStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.SuitStaticInfo;
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.manager.data.DEFINE;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_646;
    import __AS3__.vec.*;

    public class SuitStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var _dic:Dictionary;

        public function SuitStaticInfoConfig()
        {
            super(20131120);
            this._dic = new Dictionary();
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:SuitStaticInfo;
            var _local_4:XMLList;
            var _local_5:XMLList;
            var _local_6:XML;
            var _local_9:int;
            var _local_10:int;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            _local_4 = _local_2.Suit;
            var _local_7:int = _local_4.length();
            var _local_8:int;
            while (_local_8 < _local_7) {
                _local_6 = _local_4[_local_8];
                _local_3 = new SuitStaticInfo();
                _local_3.decode(_local_6);
                _local_5 = _local_6.member_item;
                _local_3.members = new Vector.<EquipStaticInfo>();
                _local_10 = _local_5.length();
                _local_9 = 0;
                while (_local_9 < _local_10) {
                    if (DEFINE.DM.getItemStaticInfo(int(_local_5[_local_9].@data)) == null){
                        throw (Error("can't be null"));
                    };
                    _local_3.members.push(DEFINE.DM.getItemStaticInfo(int(_local_5[_local_9].@data)));
                    _local_9++;
                };
                this._dic[_local_3.id] = _local_3;
                _local_8++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this._dic[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:SuitStaticInfo;
            var _local_1:Vector.<SuitStaticInfo> = new Vector.<SuitStaticInfo>();
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
            var _local_4:SuitStaticInfo;
            super.readConfig(_arg_1);
            _local_3 = _arg_1.readUnsignedShort();
            _local_2 = 0;
            while (_local_2 < _local_3) {
                _local_4 = new SuitStaticInfo();
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
            var _local_2:Vector.<SuitStaticInfo> = (this.findAll() as Vector.<SuitStaticInfo>);
            _local_4 = _local_2.length;
            _arg_1.writeShort(_local_4);
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_2[_local_3].writeExternal(_arg_1);
                _local_3++;
            };
        }

        public /*  ©init. */ function _SafeStr_646()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_646 = " SuitStaticInfoConfig" (String#17501)


