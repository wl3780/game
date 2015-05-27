// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SkillGroupConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.free.utils.DictionaryEx;
    import com.tencent.ai.core.enum.SkillGroupDataType;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.events.DataManagerEvent;
    import com.tencent.ai.core.data.SkillGroup;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_638;
    import com.tencent.ai.core.data.*;
    import __AS3__.vec.*;

    public class SkillGroupConfig extends BaseBinaryConfig implements IConfig 
    {

        public var skillsDict:DictionaryEx;
        public var _normalDict:DictionaryEx;
        public var _pvpSkillDict:DictionaryEx;
        private var _dataType:int;

        public function SkillGroupConfig()
        {
            super(20121121);
            this._normalDict = new DictionaryEx();
            this._pvpSkillDict = new DictionaryEx();
            this.changeDataType(SkillGroupDataType.PVE_PLAYER_SKILL);
        }

        public function append(_arg_1:Object, _arg_2:int):void
        {
            var _local_3:DictionaryEx = this.skillsDict;
            this.skillsDict = this._pvpSkillDict;
            this.parse(_arg_1);
            this.skillsDict = _local_3;
        }

        public function changeDataType(_arg_1:int, _arg_2:Boolean=false):void
        {
            this._dataType = _arg_1;
            this.skillsDict = (((_arg_1 == SkillGroupDataType.PVE_PLAYER_SKILL)) ? this._normalDict : this._pvpSkillDict);
            if (_arg_2){
                AICore.data.dispatchEvent(new DataManagerEvent(DataManagerEvent.ON_STATIC_SKILL_DATA_CHANGE));
            };
        }

        public function getDataType():int
        {
            return (this._dataType);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_6:SkillGroup;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XMLList = _local_2.SkillGroup;
            var _local_4:int = _local_3.length();
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = new SkillGroup();
                _local_6.decode(_local_3[_local_5]);
                this.skillsDict[_local_6.id] = _local_6;
                _local_5++;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            var _local_2:Object = this.skillsDict[_arg_1];
            if ((((_local_2 == null)) && ((this._dataType == SkillGroupDataType.PVP_PLAYER_SKILL)))){
                _local_2 = this._normalDict[_arg_1];
            };
            return (_local_2);
        }

        public function findAll():Object
        {
            var _local_2:SkillGroup;
            var _local_1:Vector.<SkillGroup> = new Vector.<SkillGroup>();
            var _local_3:int;
            var _local_4:* = this.skillsDict;
            for each (_local_2 in this.skillsDict) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        public function findWTLevel(_arg_1:int):Vector.<SkillGroup>
        {
            var _local_3:SkillGroup;
            var _local_2:Vector.<SkillGroup> = new Vector.<SkillGroup>();
            for each (_local_3 in this.skillsDict) {
                if (_local_3.id <= 10000){
                    if (_local_3.actionID == _arg_1){
                        _local_2.push(_local_3);
                    };
                } else {
                    if (int((_local_3.id * 0.01)) == _arg_1){
                        _local_2.push(_local_3);
                    };
                };
            };
            return (_local_2);
        }

        override public function clearConfig():void
        {
            this._normalDict = new DictionaryEx();
            this._pvpSkillDict = new DictionaryEx();
            this.changeDataType(SkillGroupDataType.PVE_PLAYER_SKILL);
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_4:SkillGroup;
            super.readConfig(_arg_1);
            var _local_2:int = _arg_1.readUnsignedInt();
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = new SkillGroup();
                _local_4.read(_arg_1);
                this.skillsDict[_local_4.id] = _local_4;
                _local_3++;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:SkillGroup;
            super.writeConfig(_arg_1);
            var _local_2:int = this.skillsDict.length;
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.skillsDict;
            for each (_local_3 in this.skillsDict) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_638()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_638 = " SkillGroupConfig" (String#15185)


