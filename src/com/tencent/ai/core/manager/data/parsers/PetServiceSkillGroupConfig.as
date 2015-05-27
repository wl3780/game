// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.PetServiceSkillGroupConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.PetServiceSkillGroup;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_630;
    import __AS3__.vec.*;

    public class PetServiceSkillGroupConfig extends BaseBinaryConfig implements IConfig 
    {

        public var skillsDict:Dictionary;

        public function PetServiceSkillGroupConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:PetServiceSkillGroup;
            this.skillsDict = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.SkillGroup;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new PetServiceSkillGroup();
                _local_6.decode(_local_3[_local_5]);
                this.skillsDict[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (this.skillsDict[_arg_1]);
        }

        public function findAll():Object
        {
            var _local_2:PetServiceSkillGroup;
            var _local_1:Vector.<PetServiceSkillGroup> = new Vector.<PetServiceSkillGroup>();
            var _local_3:int;
            var _local_4:* = this.skillsDict;
            for each (_local_2 in this.skillsDict) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        override public function clearConfig():void
        {
            this.skillsDict = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:PetServiceSkillGroup;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.skillsDict = new Dictionary();
            while (_local_2--) {
                _local_3 = new PetServiceSkillGroup();
                _local_3.read(_arg_1);
                this.skillsDict[_local_3.id] = _local_3;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:PetServiceSkillGroup;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.skillsDict);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.skillsDict;
            for each (_local_3 in this.skillsDict) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_630()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_630 = " PetServiceSkillGroupConfig" (String#17048)


