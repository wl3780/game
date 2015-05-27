// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.NameStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.free.utils.XString;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_627;
    import __AS3__.vec.*;

    public class NameStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var nameHash:Dictionary;

        public function NameStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:XML;
            var _local_4:uint;
            var _local_5:Vector.<String>;
            var _local_6:XML;
            this.nameHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            for each (_local_3 in _local_2.Names) {
                _local_4 = uint(_local_3.@type);
                _local_5 = new Vector.<String>();
                for each (_local_6 in _local_3.Name) {
                    _local_5.push(_local_6.toString());
                };
                this.nameHash[_local_4] = _local_5;
            };
            return (true);
        }

        public function getNames(_arg_1:int):Vector.<String>
        {
            return (this.nameHash[_arg_1]);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (null);
        }

        override public function clearConfig():void
        {
            this.nameHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_5:Vector.<String>;
            super.readConfig(_arg_1);
            this.nameHash = new Dictionary();
            var _local_2:uint = _arg_1.readUnsignedInt();
            while (_local_2--) {
                _local_3 = _arg_1.readUnsignedInt();
                _local_4 = _arg_1.readUnsignedInt();
                _local_5 = new Vector.<String>();
                while (_local_4--) {
                    _local_5.push(XString.ReadString(_arg_1));
                };
                this.nameHash[_local_3] = _local_5;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:*;
            var _local_4:Vector.<String>;
            var _local_5:uint;
            var _local_6:String;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.nameHash);
            _arg_1.writeUnsignedInt(_local_2);
            for (_local_3 in this.nameHash) {
                _arg_1.writeUnsignedInt(uint(_local_3));
                _local_4 = this.nameHash[_local_3];
                _local_5 = _local_4.length;
                _arg_1.writeUnsignedInt(_local_5);
                for each (_local_6 in _local_4) {
                    XString.WriteString(_arg_1, _local_6);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_627()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_627 = " NameStaticInfoConfig" (String#14567)


