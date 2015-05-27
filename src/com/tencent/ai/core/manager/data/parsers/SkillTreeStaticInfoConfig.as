// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.SkillTreeStaticInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import flash.utils.IDataInput;
    import com.tencent.free.utils.DictionaryEx;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_639;
    import __AS3__.vec.*;

    public class SkillTreeStaticInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var m_skillTreeHash:Dictionary;

        public function SkillTreeStaticInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:XML;
            var _local_4:SkillTreeInfo;
            this.m_skillTreeHash = new Dictionary();
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_5:int;
            var _local_6:* = _local_2.SkillTree;
            for each (_local_3 in _local_2.SkillTree) {
                _local_4 = new SkillTreeInfo();
                _local_4.decode(_local_3);
                this.m_skillTreeHash[_local_4.careerID] = _local_4;
            };
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (null);
        }

        public function getPositiveSkills(_arg_1:int):Vector.<int>
        {
            var _local_2:SkillTreeInfo = this.m_skillTreeHash[_arg_1];
            if (_local_2){
                return (_local_2.positiveSkillList);
            };
            return (new Vector.<int>());
        }

        public function getCostSkill(_arg_1:int):int
        {
            var _local_2:SkillTreeInfo = this.m_skillTreeHash[_arg_1];
            if (_local_2){
                return (_local_2.costSkill);
            };
            return (0);
        }

        public function getAllCostSkillBy(_arg_1:int):Vector.<int>
        {
            var _local_2:Vector.<int> = new Vector.<int>();
            var _local_3:int = this.getCostSkill(_arg_1);
            if (_local_3){
                _local_2.push(_local_3);
            };
            var _local_4:int = int(((_arg_1 % 100) / 10));
            if (_local_4){
                _arg_1 = (int((_arg_1 / 100)) * 100);
                _local_3 = this.getCostSkill(_arg_1);
                if (_local_3){
                    _local_2.push(_local_3);
                };
            };
            return (_local_2);
        }

        public function getSublimeSkill(_arg_1:int):int
        {
            var _local_2:SkillTreeInfo = this.m_skillTreeHash[_arg_1];
            if (_local_2){
                return (_local_2.sublimeSkill);
            };
            return (0);
        }

        private function isCostSkill(_arg_1:int):Boolean
        {
            var _local_2:SkillTreeInfo;
            for each (_local_2 in this.m_skillTreeHash) {
                if (_local_2.costSkill == _arg_1){
                    return (true);
                };
            };
            return (false);
        }

        public function checkCostSkillNeedTrans(_arg_1:int):Boolean
        {
            var _local_2:SkillTreeInfo;
            for each (_local_2 in this.m_skillTreeHash) {
                if (_local_2.costSkill == _arg_1){
                    return ((int(((_local_2.careerID % 100) / 10)) > 0));
                };
            };
            return (false);
        }

        override public function clearConfig():void
        {
            this.m_skillTreeHash = null;
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_3:SkillTreeInfo;
            super.readConfig(_arg_1);
            var _local_2:uint = _arg_1.readUnsignedInt();
            this.m_skillTreeHash = new Dictionary();
            while (_local_2--) {
                _local_3 = new SkillTreeInfo();
                _local_3.read(_arg_1);
                this.m_skillTreeHash[_local_3.careerID] = _local_3;
            };
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_3:SkillTreeInfo;
            super.writeConfig(_arg_1);
            var _local_2:uint = DictionaryEx.getLength(this.m_skillTreeHash);
            _arg_1.writeUnsignedInt(_local_2);
            var _local_4:int;
            var _local_5:* = this.m_skillTreeHash;
            for each (_local_3 in this.m_skillTreeHash) {
                _local_3.write(_arg_1);
            };
        }

        public /*  ©init. */ function _SafeStr_639()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

import com.tencent.ai.core.utils.ISerialize;
import com.tencent.ai.core.utils.IXMLSerialize;
import __AS3__.vec.Vector;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;
import  ©init._SafeStr_640;
import __AS3__.vec.*;

class SkillTreeInfo implements ISerialize, IXMLSerialize 
{

    public var careerID:int;
    public var costSkill:int;
    public var sublimeSkill:int;
    public var positiveSkillList:Vector.<int>;

    public function SkillTreeInfo()
    {
        super();
    }

    public function read(_arg_1:IDataInput):void
    {
        this.careerID = _arg_1.readInt();
        this.costSkill = _arg_1.readInt();
        this.sublimeSkill = _arg_1.readInt();
        var _local_2:uint = _arg_1.readUnsignedInt();
        this.positiveSkillList = new Vector.<int>();
        var _local_3:int;
        while (_local_3 < _local_2) {
            this.positiveSkillList.push(_arg_1.readInt());
            _local_3++;
        };
    }

    public function write(_arg_1:IDataOutput):void
    {
        var _local_2:int;
        _arg_1.writeInt(this.careerID);
        _arg_1.writeInt(this.costSkill);
        _arg_1.writeInt(this.sublimeSkill);
        _arg_1.writeUnsignedInt(this.positiveSkillList.length);
        for each (_local_2 in this.positiveSkillList) {
            _arg_1.writeInt(_local_2);
        };
    }

    public function decode(_arg_1:XML):void
    {
        this.careerID = int(_arg_1.@careerID);
        this.costSkill = int(_arg_1.@costSkill);
        this.sublimeSkill = int(_arg_1.@sublimeSkill);
        var _local_2:Array = String(_arg_1.@positiveSkills).split(",");
        var _local_3:int = _local_2.length;
        this.positiveSkillList = new Vector.<int>(_local_3, true);
        var _local_4:int;
        while (_local_4 < _local_3) {
            this.positiveSkillList[_local_4] = int(_local_2[_local_4]);
            _local_4++;
        };
    }

    public function encode()
    {
        return (null);
    }

    public /*  ©init. */ function _SafeStr_640()
    {
    }


}

// _SafeStr_639 = " SkillTreeStaticInfoConfig" (String#17492)
// _SafeStr_640 = " SkillTreeInfo" (String#17495)


