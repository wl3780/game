﻿package com.tencent.ai.core.manager.data
{
    import com.tencent.ai.core.data.AutorunInfo;
    import com.tencent.ai.core.data.BadgeInfo;
    import com.tencent.ai.core.data.BubbleDialog;
    import com.tencent.ai.core.data.CareerInfo;
    import com.tencent.ai.core.data.CareerWearStaticInfo;
    import com.tencent.ai.core.data.CasualGameStaticInfo;
    import com.tencent.ai.core.data.CommonCDInfo;
    import com.tencent.ai.core.data.CubeFormulaInfo;
    import com.tencent.ai.core.data.CubeItemInfo;
    import com.tencent.ai.core.data.DupPlanetInfo;
    import com.tencent.ai.core.data.DupStaticInfo;
    import com.tencent.ai.core.data.EffectStaticInfo;
    import com.tencent.ai.core.data.EquipAttribExtend;
    import com.tencent.ai.core.data.EquipCombinInfo;
    import com.tencent.ai.core.data.EquipEffect;
    import com.tencent.ai.core.data.EquipEnhanceLevelInfo;
    import com.tencent.ai.core.data.EquipStaticInfo;
    import com.tencent.ai.core.data.EthnicInfo;
    import com.tencent.ai.core.data.FactoryInfo;
    import com.tencent.ai.core.data.GemCombinStaticInfo;
    import com.tencent.ai.core.data.InteractItemStaticInfo;
    import com.tencent.ai.core.data.ItemStaticInfo;
    import com.tencent.ai.core.data.MapDataInfo;
    import com.tencent.ai.core.data.MilitaryRankInfo;
    import com.tencent.ai.core.data.MissionStaticInfo;
    import com.tencent.ai.core.data.MonsterAIInfo;
    import com.tencent.ai.core.data.MonsterStaticInfo;
    import com.tencent.ai.core.data.MovieStaticInfo;
    import com.tencent.ai.core.data.MultiDialogInfo;
    import com.tencent.ai.core.data.NpcStaticInfo;
    import com.tencent.ai.core.data.PetAIInfo;
    import com.tencent.ai.core.data.PetServiceSkillGroup;
    import com.tencent.ai.core.data.PetStaticInfo;
    import com.tencent.ai.core.data.ProductStaticInfo;
    import com.tencent.ai.core.data.SSTypeInfo;
    import com.tencent.ai.core.data.SceneInfo;
    import com.tencent.ai.core.data.ScriptInfo;
    import com.tencent.ai.core.data.ServerErrorCodeInfo;
    import com.tencent.ai.core.data.ShopInfo;
    import com.tencent.ai.core.data.SkillGroup;
    import com.tencent.ai.core.data.SoundPackageInfo;
    import com.tencent.ai.core.data.SpecialFuncInfo;
    import com.tencent.ai.core.data.SpecialStatusInfo;
    import com.tencent.ai.core.data.SuitStaticInfo;
    import com.tencent.ai.core.data.SuperShadowInfo;
    import com.tencent.ai.core.data.WarSoulStaticInfo;
    import com.tencent.ai.core.player.IMainPlayerModel;
    import com.tencent.free.setup.data.ConfDef;
    
    import flash.events.IEventDispatcher;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;

    public interface IDataManager extends IEventDispatcher 
    {

        function get runtime():IRuntimeData;
        function get mainModel():IMainPlayerModel;
        function get assetRefTable():IAssetRefTable;
        function getConfText(_arg_1:String):String;
        function getFlashVar(_arg_1:String):Object;
        function getConfItem(_arg_1:String):ConfDef;
        function setConfig(_arg_1:String, _arg_2:IConfig):void;
        function getConfig(_arg_1:String):IConfig;
        function getEquipStaticInfo(_arg_1:int):EquipStaticInfo;
        function getItemStaticInfo(_arg_1:int):ItemStaticInfo;
        function getAllEquipStaticInfos():Vector.<EquipStaticInfo>;
        function getAllItemStaticInfos():Vector.<ItemStaticInfo>;
        function getSuitStaticInfo(_arg_1:int):SuitStaticInfo;
        function getEthnicInfo(_arg_1:int):EthnicInfo;
        function getMonsterStaticInfo(_arg_1:int):MonsterStaticInfo;
        function getPetStaticInfo(_arg_1:int):PetStaticInfo;
        function getMaxXPValue(_arg_1:int):int;
        function getAllMonsterStaticInfo():Array;
        function getAllPetStaticInfo():Array;
        function getAllPetBattleSkillsBy(_arg_1:int, _arg_2:int):Dictionary;
        function getMonsterAIInfo(_arg_1:int):MonsterAIInfo;
        function getPetAIInfo(_arg_1:int):PetAIInfo;
        function getInteractItemStaticInfo(_arg_1:int):InteractItemStaticInfo;
        function getAllInteractItemStaticInfo():Dictionary;
        function getEffectInfo(_arg_1:int):EffectStaticInfo;
        function getEffectStaticInfos():Array;
        function getNpcStaticInfo(_arg_1:int):NpcStaticInfo;
        function getSpecialFuncInfo(_arg_1:int):SpecialFuncInfo;
        function getSpecialStatusInfo(_arg_1:int):SpecialStatusInfo;
        function getSSTypeInfo(_arg_1:int):SSTypeInfo;
        function getEthnicID(_arg_1:int):int;
        function getCareerInfo(_arg_1:int):CareerInfo;
        function getAllEthnicInfos():Vector.<EthnicInfo>;
        function getCityInfos():Dictionary;
        function getCitySceneInfo(_arg_1:int):SceneInfo;
        function getDupPlanetInfos():Dictionary;
        function getDupPlanetInfo(_arg_1:int):DupPlanetInfo;
        function getDupStaticInfo(_arg_1:int):DupStaticInfo;
        function getFactoryInfos(_arg_1:String):Vector.<FactoryInfo>;
        function getDupLoadingInfos():Array;
        function getLostFocusTips():Array;
        function getSkillGroup(_arg_1:int):SkillGroup;
        function getSkillGroups():Vector.<SkillGroup>;
        function getSkillGroupsWTLevel(_arg_1:int):Vector.<SkillGroup>;
        function getScriptDescriptions(_arg_1:int=0):Array;
        function getVKeyInfos():Array;
        function getMotionInfos():Array;
        function getMissionStaticInfo(_arg_1:uint):MissionStaticInfo;
        function getAllMissionStaticInfo():Vector.<MissionStaticInfo>;
        function getSoundPackageInfo(_arg_1:int):SoundPackageInfo;
        function getAllSoundPackageInfos():Array;
        function getAllPlotInfos():Array;
        function getAllNpcInfos():Vector.<NpcStaticInfo>;
        function getCasualGameStaticInfo(_arg_1:uint):CasualGameStaticInfo;
        function getAllCasualGameStaticInfo():Vector.<CasualGameStaticInfo>;
        function getDialogInfo(_arg_1:int):MultiDialogInfo;
        function getAllDialogInfos():Array;
        function getSuperShadowInfo(_arg_1:int):SuperShadowInfo;
        function getAllSuperShadowInfos():Array;
        function getMovieStaticInfo(_arg_1:int):MovieStaticInfo;
        function getAllMovieStaticInfos():Array;
        function getCareerWearStaticInfo(_arg_1:int, _arg_2:int, _arg_3:int):CareerWearStaticInfo;
        function getCommonCDInfo(_arg_1:int):CommonCDInfo;
        function getAllCommonCDInfos():Vector.<CommonCDInfo>;
        function getMailHandler(_arg_1:int):ScriptInfo;
        function getAllMailHandler():Dictionary;
        function getBadgeInfo(_arg_1:int):BadgeInfo;
        function getAllBadgeInfoInBadge():Dictionary;
        function getBadgeInfoByGroup(_arg_1:int):Vector.<BadgeInfo>;
        function getMilitaryRankInfo(_arg_1:int):MilitaryRankInfo;
        function getAllMilitaryRankInfos():Dictionary;
        function getBubbleDialogInfo(_arg_1:int):BubbleDialog;
        function getMapDataInfo(_arg_1:int):MapDataInfo;
        function getServerErrorCodeInfo(_arg_1:int):ServerErrorCodeInfo;
        function getAllResDepandInfo():Dictionary;
        function getShopInfo(_arg_1:int):ShopInfo;
        function getPositiveSkills(_arg_1:int):Vector.<int>;
        function getCostSkill(_arg_1:int):int;
        function getAllCostSkillBy(_arg_1:int):Vector.<int>;
        function getSublimeSkill(_arg_1:int):int;
        function checkCostSkillNeedTrans(_arg_1:int):Boolean;
        function getNames(_arg_1:int):Vector.<String>;
        function getMissionAwardXP(_arg_1:int, _arg_2:int):int;
        function getLoginRunScripts(_arg_1:int):Vector.<ScriptInfo>;
        function getRunScripts(_arg_1:int):Vector.<ScriptInfo>;
        function getAllRunScripts():Dictionary;
        function getRunInfoByEvent(_arg_1:String):Vector.<AutorunInfo>;
        function isRunScriptOnce(_arg_1:int):Boolean;
        function getEquipCombinInfo(_arg_1:int):EquipCombinInfo;
        function getEquipEnhanceLackInfo(_arg_1:String):int;
        function getEquipEnhanceLevelInfo(_arg_1:int):EquipEnhanceLevelInfo;
        function getEquipEnhanceTypeInfo(_arg_1:int):Vector.<EquipAttribExtend>;
        function getCubeItemInfo(_arg_1:String, _arg_2:int):CubeItemInfo;
        function getCubeFormulaInfo(_arg_1:CubeFormulaInfo):Vector.<CubeFormulaInfo>;
        function getCubeFormulaInfoAll():Vector.<CubeFormulaInfo>;
        function getAllSOConfig():Dictionary;
        function getPetServiceSkillGroup(_arg_1:int):PetServiceSkillGroup;
        function getPetSkillGroup(_arg_1:int):SkillGroup;
        function appendSkillGroup(_arg_1:Object, _arg_2:int=1):void;
        function changeSkillGroupDataType(_arg_1:int, _arg_2:Boolean=false):void;
        function getSkillGroupDataType():int;
        function findMonsterBloodCount(_arg_1:int, _arg_2:int, _arg_3:int):int;
        function getFakeAIInfo(_arg_1:int):MonsterAIInfo;
        function getEquipEffect(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):EquipEffect;
        function convertConfigXMLToBytes(_arg_1:String, _arg_2:Object, _arg_3:ByteArray):Boolean;
        function getAllProductStaticInfo():Vector.<ProductStaticInfo>;
        function getProductStaticInfo(_arg_1:uint):ProductStaticInfo;
        function getGemCombinStaticInfo(_arg_1:int):GemCombinStaticInfo;
        function getAllGemCombinStaticInfo():Vector.<GemCombinStaticInfo>;
        function getWarSoulStaticInfo(_arg_1:int, _arg_2:int, _arg_3:int):WarSoulStaticInfo;

    }
}
