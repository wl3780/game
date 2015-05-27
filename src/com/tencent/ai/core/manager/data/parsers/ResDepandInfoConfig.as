// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.ResDepandInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.tencent.ai.core.data.ResDepandInfo;
    import com.tencent.ai.core.data.AssetRefIDInfo;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import  ©init._SafeStr_634;
    import __AS3__.vec.*;

    public class ResDepandInfoConfig extends BaseBinaryConfig implements IConfig 
    {

        public var resDepandDict:Dictionary;

        public function ResDepandInfoConfig()
        {
            super(20131120);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Vector.<ResDepandInfo>;
            var _local_6:XMLList;
            var _local_7:ResDepandInfo;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            this.resDepandDict = new Dictionary();
            _local_6 = _local_2.EffectIDs.EffectID;
            _local_4 = _local_6.length();
            _local_5 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = new ResDepandInfo();
                _local_7.decode(_local_6[_local_3]);
                _local_5.push(_local_7);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.EFFECT_IDS] = _local_5;
            _local_6 = _local_2.InteractIDs.InteractID;
            _local_4 = _local_6.length();
            _local_5 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = new ResDepandInfo();
                _local_7.decode(_local_6[_local_3]);
                _local_5.push(_local_7);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.INTERACT_IDS] = _local_5;
            _local_6 = _local_2.MonsterIDs.MonsterID;
            _local_4 = _local_6.length();
            _local_5 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = new ResDepandInfo();
                _local_7.decode(_local_6[_local_3]);
                _local_5.push(_local_7);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.MONSTER_IDS] = _local_5;
            _local_6 = _local_2.SkillIDs.SkillID;
            _local_4 = _local_6.length();
            _local_5 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = new ResDepandInfo();
                _local_7.decode(_local_6[_local_3]);
                _local_5.push(_local_7);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.SKILL_IDS] = _local_5;
            _local_6 = _local_2.ActivityMonsters.DupID;
            _local_4 = _local_6.length();
            _local_5 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_4) {
                _local_7 = new ResDepandInfo();
                _local_7.decode(_local_6[_local_3]);
                _local_5.push(_local_7);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.ACTIVITY_MONSTER_IDS] = _local_5;
            return (true);
        }

        public function find(_arg_1:*):Object
        {
            return (null);
        }

        public function findAll():Object
        {
            return (this.resDepandDict);
        }

        override public function clearConfig():void
        {
            ((this.resDepandDict) && ((this.resDepandDict = null)));
        }

        override public function readConfig(_arg_1:IDataInput):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Vector.<ResDepandInfo>;
            var _local_5:ResDepandInfo;
            super.readConfig(_arg_1);
            this.resDepandDict = new Dictionary();
            _local_2 = _arg_1.readShort();
            _local_4 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_5 = new ResDepandInfo();
                _local_5.read(_arg_1);
                _local_4.push(_local_5);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.EFFECT_IDS] = _local_4;
            _local_2 = _arg_1.readShort();
            _local_4 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_5 = new ResDepandInfo();
                _local_5.read(_arg_1);
                _local_4.push(_local_5);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.INTERACT_IDS] = _local_4;
            _local_2 = _arg_1.readShort();
            _local_4 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_5 = new ResDepandInfo();
                _local_5.read(_arg_1);
                _local_4.push(_local_5);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.MONSTER_IDS] = _local_4;
            _local_2 = _arg_1.readShort();
            _local_4 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_5 = new ResDepandInfo();
                _local_5.read(_arg_1);
                _local_4.push(_local_5);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.SKILL_IDS] = _local_4;
            _local_2 = _arg_1.readShort();
            _local_4 = new Vector.<ResDepandInfo>();
            _local_3 = 0;
            while (_local_3 < _local_2) {
                _local_5 = new ResDepandInfo();
                _local_5.read(_arg_1);
                _local_4.push(_local_5);
                _local_3++;
            };
            this.resDepandDict[AssetRefIDInfo.ACTIVITY_MONSTER_IDS] = _local_4;
        }

        override public function writeConfig(_arg_1:IDataOutput):void
        {
            var _local_2:Vector.<ResDepandInfo>;
            var _local_3:int;
            var _local_4:int;
            var _local_5:ResDepandInfo;
            super.writeConfig(_arg_1);
            _local_2 = this.resDepandDict[AssetRefIDInfo.EFFECT_IDS];
            _local_3 = _local_2.length;
            _arg_1.writeShort(_local_3);
            _local_4 = 0;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_5.write(_arg_1);
                _local_4++;
            };
            _local_2 = this.resDepandDict[AssetRefIDInfo.INTERACT_IDS];
            _local_3 = _local_2.length;
            _arg_1.writeShort(_local_3);
            _local_4 = 0;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_5.write(_arg_1);
                _local_4++;
            };
            _local_2 = this.resDepandDict[AssetRefIDInfo.MONSTER_IDS];
            _local_3 = _local_2.length;
            _arg_1.writeShort(_local_3);
            _local_4 = 0;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_5.write(_arg_1);
                _local_4++;
            };
            _local_2 = this.resDepandDict[AssetRefIDInfo.SKILL_IDS];
            _local_3 = _local_2.length;
            _arg_1.writeShort(_local_3);
            _local_4 = 0;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_5.write(_arg_1);
                _local_4++;
            };
            _local_2 = this.resDepandDict[AssetRefIDInfo.ACTIVITY_MONSTER_IDS];
            _local_3 = _local_2.length;
            _arg_1.writeShort(_local_3);
            _local_4 = 0;
            while (_local_4 < _local_3) {
                _local_5 = _local_2[_local_4];
                _local_5.write(_arg_1);
                _local_4++;
            };
        }

        public /*  ©init. */ function _SafeStr_634()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_634 = " ResDepandInfoConfig" (String#16175)


