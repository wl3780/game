// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.data.parsers.DefineInfoConfig

package com.tencent.ai.core.manager.data.parsers
{
    import com.tencent.ai.core.manager.data.BaseBinaryConfig;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.enum.WeaponHurtEIDDef;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.arg.script.CreateEffectArg;
    import com.tencent.ai.core.data.arg.script.CreateInteractArg;
    import com.tencent.ai.core.enum.WeaponArgDef;
    import com.tencent.ai.core.data.TingeInfo;
    import com.tencent.ai.core.data.AdjustColorInfo;
    import com.tencent.ai.core.data.arg.ParticleEffectArg;
    import com.tencent.ai.core.data.AssetRefIDInfo;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.enum.KeynoteDef;
    import com.tencent.ai.core.data.arg.script.ShakeScriptArg;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.enum.HurtShakeDef;
    import com.tencent.ai.core.actor.model.Attribute;
    import com.tencent.ai.core.enum.CommonValueDef;
    import  ©init._SafeStr_599;
    import __AS3__.vec.*;
    import com.tencent.ai.core.actor.model.*;
    import com.tencent.ai.core.enum.*;

    public class DefineInfoConfig extends BaseBinaryConfig implements IConfig 
    {


        private function getArrayFromXml(_arg_1:XMLList):Array
        {
            return (String(_arg_1.toXMLString()).split(","));
        }

        protected function collectDefSoundIDs(_arg_1:XML):void
        {
            var _local_2:Array = SoundDef.CITY_LOAD_SOUND_IDS;
            _local_2.push(SoundDef.UPGRADE_SOUND_ID);
            var _local_3:Array = String(_arg_1.@playerWalkSounds).split(",");
            _local_2.push.apply(_local_2, _local_3);
            var _local_4:Array = String(_arg_1.@playerRunSounds).split(",");
            _local_2.push.apply(_local_2, _local_4);
            _local_2 = SoundDef.DUP_LOAD_SOUND_IDS;
            _local_2.push(SoundDef.LAND_SOUND_ID);
            _local_2.push(SoundDef.PLAYER_SHAKE_SOUND_ID);
            _local_2.push(SoundDef.PICKUP_COIN_SOUND_ID);
            _local_2.push(SoundDef.PICKUP_MOTION_SOUND_ID);
            _local_2.push(SoundDef.ROOM_CLEAN_SOUND_ID);
            _local_2.push(SoundDef.BOSS_KILLED_SOUND_ID);
            _local_2.push(SoundDef.HPMP_SOUND_ID);
        }

        protected function parseWeaponHurtEIDDef(_arg_1:XML):WeaponHurtEIDDef
        {
            var _local_2:WeaponHurtEIDDef = new WeaponHurtEIDDef();
            _local_2.id = int(_arg_1.@id);
            _local_2.normalEID = int(_arg_1.@normalEID);
            _local_2.criEID = int(_arg_1.@criEID);
            _local_2.missEID = int(_arg_1.@missEID);
            _local_2.breakEID = int(_arg_1.@breakEID);
            _local_2.backEID = int(_arg_1.@backEID);
            return (_local_2);
        }

        protected function parseWeaponArgDef(_arg_1:XML):WeaponArgDef
        {
            var _local_3:XMLList;
            var _local_4:XML;
            var _local_6:Dictionary;
            var _local_9:int;
            var _local_10:CreateEffectArg;
            var _local_11:CreateInteractArg;
            var _local_2:WeaponArgDef = new WeaponArgDef();
            var _local_5:int;
            _local_2.weaponCID = int(_arg_1.@weaponCID);
            var _local_7:XML = _arg_1.EffectScriptArgs[0];
            if (_local_7 != null){
                _local_3 = _local_7.ScriptArg;
                _local_5 = _local_3.length();
                _local_6 = new Dictionary();
                _local_9 = 0;
                while (_local_9 < _local_5) {
                    _local_10 = new CreateEffectArg();
                    _local_4 = _local_3[_local_9];
                    _local_10.decode(_local_4);
                    _local_6[_local_10.weaponArgID] = _local_10;
                    _local_9++;
                };
                _local_2.effectScriptArgs = _local_6;
            };
            var _local_8:XML = _arg_1.InteractScriptArgs[0];
            if (_local_8 != null){
                _local_3 = _local_8.ScriptArg;
                _local_5 = _local_3.length();
                _local_6 = new Dictionary();
                _local_9 = 0;
                while (_local_9 < _local_5) {
                    _local_11 = new CreateInteractArg();
                    _local_4 = _local_3[_local_9];
                    _local_11.decode(_local_4);
                    _local_6[_local_11.weaponArgID] = _local_11;
                    _local_9++;
                };
                _local_2.interactScriptArgs = _local_6;
            };
            return (_local_2);
        }

        protected function parseDefEffectArg(_arg_1:XML):Object
        {
            var _local_9:TingeInfo;
            var _local_10:AdjustColorInfo;
            var _local_2:Object = {
                "index":int(_arg_1.@index),
                "effectType":int(_arg_1.@effectType)
            };
            var _local_3:ParticleEffectArg = new ParticleEffectArg();
            var _local_4:XML = _arg_1.Arg[0];
            _local_3.iconEffectId = int(_local_4.@effectId);
            var _local_5:Array = String(_local_4.@frameIds).split(",");
            var _local_6:int;
            while (_local_6 < _local_5.length) {
                _local_3.iconFrameIds.push(int(_local_5[_local_6]));
                _local_6++;
            };
            _local_3.numGeneration = int(_local_4.@num);
            _local_3.deltaRotation = int(_local_4.@dRotation);
            _local_3.emissAngle = int(_local_4.@angle);
            _local_3.emissVelocity = int(_local_4.@v);
            _local_3.slowFactor = int(_local_4.@g);
            _local_3.pauseFrames = int(_local_4.@pause);
            _local_3.fadeFrames = int(_local_4.@fade);
            _local_3.randFactor = int(_local_4.@rand);
            _local_3.soundID = int(_local_4.@soundID);
            _local_2.arg = _local_3;
            var _local_7:XML = _arg_1.Tinge[0];
            if (_local_7 != null){
                _local_9 = new TingeInfo();
                _local_9.decode(_local_7);
                _local_2.tingeInfo = _local_9;
            };
            var _local_8:XML = _arg_1.AdjustColor[0];
            if (_local_8 != null){
                _local_10 = new AdjustColorInfo();
                _local_10.decode(_local_8);
                _local_2.adjustColorInfo = _local_10;
            };
            return (_local_2);
        }

        protected function parseCareerDepend(_arg_1:XML):AssetRefIDInfo
        {
            var _local_2:AssetRefIDInfo = new AssetRefIDInfo();
            if (_arg_1.hasOwnProperty("@dpSoundID")){
                _local_2.soundIDs = Vector.<int>(this.getArrayFromXml(_arg_1.@dpSoundID));
            };
            if (_arg_1.hasOwnProperty("@dpInteractID")){
                _local_2.interactIDs = Vector.<int>(this.getArrayFromXml(_arg_1.@dpInteractID));
            };
            if (_arg_1.hasOwnProperty("@dpEffectID")){
                _local_2.effectIDs = Vector.<int>(this.getArrayFromXml(_arg_1.@dpEffectID));
            };
            if (_arg_1.hasOwnProperty("@dpMonsterID")){
                _local_2.monsterIDs = Vector.<int>(this.getArrayFromXml(_arg_1.@dpMonsterID));
            };
            return (_local_2);
        }

        protected function parseSpecialInteractKeynoteDef(_arg_1:XML):KeynoteDef
        {
            var _local_5:int;
            var _local_6:ScriptInfo;
            var _local_2:KeynoteDef = new KeynoteDef();
            _local_2.interval = int(_arg_1.@interval);
            _local_2.mode = int(_arg_1.@mode);
            _local_2.offsetX = int(_arg_1.@offsetX);
            _local_2.offsetY = int(_arg_1.@offsetY);
            var _local_3:XMLList = _arg_1.Arg;
            var _local_4:int = _local_3.length();
            _local_5 = 0;
            while (_local_5 < _local_4) {
                _local_6 = new ScriptInfo();
                _local_2.imagesOffsetXs.push(_local_3[_local_5].image[0].@offsetX.toString());
                _local_2.imagesOffsetYs.push(_local_3[_local_5].image[0].@offsetY.toString());
                _local_2.imagesURL.push(_local_3[_local_5].image[0].toString());
                _local_6.decode(_local_3[_local_5].Script[0]);
                _local_2.imagesScript.push(_local_6);
                if (_local_3[_local_5].Script[1] != null){
                    _local_6 = new ScriptInfo();
                    _local_6.decode(_local_3[_local_5].Script[1]);
                    _local_2.imagesSecondScript.push(_local_6);
                } else {
                    _local_6 = new ScriptInfo();
                    _local_6.cmd = "";
                    _local_2.imagesSecondScript.push(_local_6);
                };
                _local_5++;
            };
            return (_local_2);
        }

        public function parse(_arg_1:Object):Boolean
        {
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:XML;
            var _local_7:int;
            var _local_14:WeaponHurtEIDDef;
            var _local_15:WeaponArgDef;
            var _local_16:ShakeScriptArg;
            var _local_17:int;
            var _local_18:Dictionary;
            var _local_19:Dictionary;
            var _local_20:int;
            var _local_21:String;
            var _local_22:String;
            var _local_23:Boolean;
            var _local_24:AN;
            var _local_25:Dictionary;
            var _local_26:Object;
            var _local_27:Dictionary;
            var _local_28:AssetRefIDInfo;
            var _local_29:Dictionary;
            var _local_30:Dictionary;
            var _local_31:KeynoteDef;
            var _local_2:XML = (((_arg_1 is String)) ? new XML(_arg_1) : (_arg_1 as XML));
            var _local_3:XML = _local_2.HurtSoundDef[0];
            if (_local_3 != null){
                _local_4 = _local_3.SoundID;
                _local_5 = _local_4.length();
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_6 = _local_4[_local_7];
                    SoundDef.HURT_SOUND_IDS[int(_local_6.@materialType)] = int(int(_local_6.@id));
                    _local_7++;
                };
            };
            var _local_8:XML = _local_2.SoundDef[0];
            if (_local_8 != null){
                SoundDef.LAND_SOUND_ID = int(_local_8.@landSound);
                SoundDef.PLAYER_SHAKE_SOUND_ID = int(_local_8.@playerShakeSound);
                SoundDef.PICKUP_COIN_SOUND_ID = int(_local_8.@pickUpCoin);
                SoundDef.PICKUP_MOTION_SOUND_ID = int(_local_8.@pickUpMotion);
                SoundDef.ROOM_CLEAN_SOUND_ID = int(_local_8.@roomClean);
                SoundDef.BOSS_KILLED_SOUND_ID = int(_local_8.@bossKilled);
                SoundDef.UPGRADE_SOUND_ID = int(_local_8.@upgrade);
                SoundDef.HPMP_SOUND_ID = int(_local_8.@hpmp);
            };
            var _local_9:XML = _local_2.WeaponHurtEIDDef[0];
            if (_local_9 != null){
                _local_4 = _local_9.HurtEID;
                _local_5 = _local_4.length();
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_14 = this.parseWeaponHurtEIDDef(_local_4[_local_7]);
                    WeaponHurtEIDDef.EIDS[_local_14.id] = _local_14;
                    _local_7++;
                };
            };
            var _local_10:XML = _local_2.WeaponArgDefs[0];
            if (_local_10 != null){
                _local_4 = _local_10.WeaponArgDef;
                _local_5 = _local_4.length();
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_15 = this.parseWeaponArgDef(_local_4[_local_7]);
                    WeaponArgDef.ARG_DEF[_local_15.weaponCID] = _local_15;
                    _local_7++;
                };
            };
            var _local_11:XML = _local_2.HurtShakeDef[0];
            if (_local_11 != null){
                _local_4 = _local_11.ShakeArg;
                _local_5 = _local_4.length();
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_6 = _local_4[_local_7];
                    _local_16 = new ShakeScriptArg();
                    _local_16.decode(_local_6);
                    _local_17 = int(_local_6.@id);
                    HurtShakeDef.SHAKE_ARGS[_local_17] = _local_16;
                    _local_7++;
                };
            };
            var _local_12:XML = _local_2.AN[0];
            if (_local_12 != null){
                _local_4 = _local_12.Attrib;
                _local_5 = _local_4.length();
                _local_18 = AN.ATTRIB;
                _local_19 = new Dictionary();
                Attribute.SET_BIND_NAMES = _local_19;
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_6 = _local_4[_local_7];
                    _local_20 = int(_local_6.@type);
                    _local_21 = String(_local_6.@atrribName);
                    _local_22 = String(_local_6.@attribType);
                    _local_23 = !((String(_local_6.@attribBind) == "false"));
                    _local_24 = new AN(_local_20, _local_21, _local_22, _local_23);
                    _local_24.attribValue = _local_24.getValue(_local_6.@attribValue);
                    _local_24.ignore = (int(_local_6.@ignore) == 1);
                    _local_18[_local_20] = _local_24;
                    if (_local_23){
                        _local_19[_local_21] = true;
                    };
                    _local_7++;
                };
            };
            _local_6 = _local_2.SSIDDef[0];
            if (_local_6 != null){
                CommonValueDef.SS_ID_LAND_PROTECTED = int(_local_6.@protectedSSID);
                CommonValueDef.SS_ID_REVIVE_PROTECTED = int(_local_6.@reviveSSID);
            };
            _local_6 = _local_2.DefEffectArgs[0];
            if (_local_6 != null){
                _local_4 = _local_6.DefEffectArg;
                _local_5 = _local_4.length();
                _local_25 = CommonValueDef.DEF_EFFECT_ARGS;
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_26 = this.parseDefEffectArg(_local_4[_local_7]);
                    _local_25[_local_26.index] = _local_26;
                    _local_7++;
                };
            };
            _local_6 = _local_2.CareerDepandDict[0];
            if (_local_6 != null){
                _local_4 = _local_6.CareerDepand;
                _local_5 = _local_4.length();
                _local_27 = CommonValueDef.CAREER_DEPAND_DICT;
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_6 = _local_4[_local_7];
                    _local_28 = this.parseCareerDepend(_local_6);
                    _local_27[int(_local_6.@id)] = _local_28;
                    _local_7++;
                };
            };
            this.collectDefSoundIDs(_local_8);
            _local_6 = _local_2.MaxSkillDepandDict[0];
            if (_local_6 != null){
                _local_4 = _local_6.MaxSkillDepand;
                _local_5 = _local_4.length();
                _local_29 = CommonValueDef.MAX_SKILL_DEPAND_DICT;
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    _local_6 = _local_4[_local_7];
                    _local_29[int(_local_6.@actionID)] = {
                        "effectID":int(_local_6.@effectID),
                        "des":String(_local_6.@effectID)
                    };
                    _local_7++;
                };
            };
            var _local_13:XML = _local_2.SpecialInteractInfos[0];
            if (_local_13 != null){
                _local_4 = _local_13.SpecialInteractInfo;
                _local_5 = _local_4.length();
                _local_30 = CommonValueDef.SPECIAL_INTERACT_DIC;
                _local_7 = 0;
                while (_local_7 < _local_5) {
                    if (_local_4[_local_7].@type == "0"){
                        _local_31 = this.parseSpecialInteractKeynoteDef(_local_4[_local_7].Keynote[0]);
                        _local_30[_local_4[_local_7].@id.toString()] = _local_31;
                    };
                    _local_7++;
                };
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

        public /*  ©init. */ function _SafeStr_599()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.parsers

// _SafeStr_599 = " DefineInfoConfig" (String#14423)


