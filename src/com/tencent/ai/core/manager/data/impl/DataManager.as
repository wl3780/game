package com.tencent.ai.core.manager.data.impl
{
    import com.tencent.ai.core.AICore;
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
    import com.tencent.ai.core.enum.CareerIDDef;
    import com.tencent.ai.core.enum.ConfKey;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.IAssetRefTable;
    import com.tencent.ai.core.manager.data.IConfig;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.manager.data.IRuntimeData;
    import com.tencent.ai.core.manager.data.parsers.AutorunStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.BadgeStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.BubbleDialogInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.CareerWearStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.CasualGameStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.CityInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.CommonCDConfig;
    import com.tencent.ai.core.manager.data.parsers.CubeFormulaConfig;
    import com.tencent.ai.core.manager.data.parsers.CubeItemConfig;
    import com.tencent.ai.core.manager.data.parsers.DefineInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.DialogsInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.DupLoadingInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.DupStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EffectInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EquipCombinInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EquipEffectConfig;
    import com.tencent.ai.core.manager.data.parsers.EquipEnhanceLackInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EquipEnhanceLevelInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EquipEnhanceTypeInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EquipStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.EthnicInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.FactoryInfosConfig;
    import com.tencent.ai.core.manager.data.parsers.GemCombinInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.InteractItemStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.ItemStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MailHandlerStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MapDataInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MilitaryRankStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MissionAwardXPConfig;
    import com.tencent.ai.core.manager.data.parsers.MissionStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MonsterAIInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MonsterBloodStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MonsterStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MotionInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.MovieStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.NameStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.NpcStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.PetAIInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.PetServiceSkillGroupConfig;
    import com.tencent.ai.core.manager.data.parsers.PetStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.PlotInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.ProductStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.ResDepandInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.SOConfig;
    import com.tencent.ai.core.manager.data.parsers.SSTypeInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.ScriptDescriptionConfig;
    import com.tencent.ai.core.manager.data.parsers.ServerErrorCodeStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.ShopListConfig;
    import com.tencent.ai.core.manager.data.parsers.SkillGroupConfig;
    import com.tencent.ai.core.manager.data.parsers.SkillTreeStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.SoundStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.SpecialFuncInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.SpecialStatusInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.SuitStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.SuperShadowsInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.VKeyInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.WarSoulStaticInfoConfig;
    import com.tencent.ai.core.manager.data.parsers.XPConfig;
    import com.tencent.ai.core.player.IMainPlayerModel;
    import com.tencent.ai.core.player.IPlayerModelManager;
    import com.tencent.ai.core.utils.binary.TypeInfo;
    import com.tencent.ai.core.utils.binary.equal;
    import com.tencent.free.logging.debug;
    import com.tencent.free.logging.logToLabel;
    import com.tencent.free.setup.GLOBAL_DEF;
    import com.tencent.free.setup.data.AttrDef;
    import com.tencent.free.setup.data.ConfDef;
    
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import flash.utils.getTimer;
    import flash.utils.setTimeout;

    public class DataManager extends EventDispatcher implements IDataManager 
    {

        public static var EXT_CONFIG_CLASS:Dictionary = new Dictionary();

        protected var m_confsCache:Dictionary;
        protected var m_runtimeData:RuntimeData;
        protected var m_mainModel:IMainPlayerModel;
        protected var m_assetRefTable:IAssetRefTable;
        protected var m_configs:Dictionary;
        protected var m_flashVars:Object;
        protected var m_missionStaticInfoConfig:MissionStaticInfoConfig;
        protected var m_propStaticInfoConfig:ItemStaticInfoConfig;
        protected var m_gemCombinConfig:GemCombinInfoConfig;
        protected var m_equipStaticInfoConfig:EquipStaticInfoConfig;
        protected var m_suitStaticInfoConfig:SuitStaticInfoConfig;
        protected var m_ethnicConfig:EthnicInfoConfig;
        protected var m_equipEffectInfoConfig:EffectInfoConfig;
        protected var m_cityInfoConfig:CityInfoConfig;
        protected var m_skillInfoConfig:SkillGroupConfig;
        protected var m_petServiceSkillInfoConfig:PetServiceSkillGroupConfig;
        protected var m_dupInfoConfig:DupStaticInfoConfig;
        protected var m_monsterStaticInfos:MonsterStaticInfoConfig;
        protected var m_monsterAIInfoConfig:MonsterAIInfoConfig;
        protected var m_petStaticInfos:PetStaticInfoConfig;
        protected var m_petAIInfoConfig:PetAIInfoConfig;
        protected var m_interactStaticInfos:InteractItemStaticInfoConfig;
        protected var m_npcInfoConfig:NpcStaticInfoConfig;
        protected var m_sfInfoConfig:SpecialFuncInfoConfig;
        protected var m_ssTypeInfoConfig:SSTypeInfoConfig;
        protected var m_ssInfoConfig:SpecialStatusInfoConfig;
        protected var m_factoryInfosConfig:FactoryInfosConfig;
        protected var m_sDesConfig:ScriptDescriptionConfig;
        protected var m_vkeyConfig:VKeyInfoConfig;
        protected var m_motionInfoConfig:MotionInfoConfig;
        protected var m_soundInfoConfig:SoundStaticInfoConfig;
        protected var m_plotInfoConfig:PlotInfoConfig;
        protected var m_xpConfig:XPConfig;
        protected var m_cgsiConfig:CasualGameStaticInfoConfig;
        protected var m_psiConfig:ProductStaticInfoConfig;
        protected var m_cwsiConfig:CareerWearStaticInfoConfig;
        protected var m_dialogInfoConfig:DialogsInfoConfig;
        protected var m_superShadowInfoConfig:SuperShadowsInfoConfig;
        protected var m_mailHandlerInfoConfig:MailHandlerStaticInfoConfig;
        protected var m_bubbleDialogInfoConfig:BubbleDialogInfoConfig;
        protected var m_mapDataInfoConfig:MapDataInfoConfig;
        protected var m_badgeStaticInfoConfig:BadgeStaticInfoConfig;
        protected var m_militaryRankStaticInfoConfig:MilitaryRankStaticInfoConfig;
        protected var m_serverErrorCodeStaticInfoConfig:ServerErrorCodeStaticInfoConfig;
        protected var m_resDepandInfoConfig:ResDepandInfoConfig;
        protected var m_skillTreeInfoConfig:SkillTreeStaticInfoConfig;
        protected var m_nameStaticInfoConfig:NameStaticInfoConfig;
        protected var m_autorunStaticInfoConfig:AutorunStaticInfoConfig;
        protected var m_equipCombinInfoConfig:EquipCombinInfoConfig;
        protected var m_equipEnhanceLackInfoConfig:EquipEnhanceLackInfoConfig;
        protected var m_equipEnhanceLevelInfoConfig:EquipEnhanceLevelInfoConfig;
        protected var m_equipEnhanceTypeInfoConfig:EquipEnhanceTypeInfoConfig;
        protected var m_cubeItemConfig:CubeItemConfig;
        protected var m_cubeFormulaConfig:CubeFormulaConfig;
        protected var m_movieStaticInfoConfig:MovieStaticInfoConfig;
        protected var m_commonCDInfoConfig:CommonCDConfig;
        protected var m_shopListConfig:ShopListConfig;
        protected var m_msnAwardXPConfig:MissionAwardXPConfig;
        protected var m_soConfig:SOConfig;
        protected var m_monsterBlood:MonsterBloodStaticInfoConfig;
        protected var m_equipEffectConfig:EquipEffectConfig;
        protected var m_warSoulStaticConfig:WarSoulStaticInfoConfig;
        protected var m_dupLoadingInfoConfig:DupLoadingInfoConfig;
        
		private var _currentPaseIndex:int;
        private var _currentPaseConfs:Vector.<ConfDef>;
        private var _sync:Boolean;
        private var _rebuilded:Boolean = false;
        private var _xmlConfigs:Dictionary;


        public function initialize(_arg_1:Dictionary, _arg_2:Boolean=false):void
        {
            var _local_3:int = getTimer();
            this.setDEFINE(_arg_1[GLOBAL_DEF.CONFIG_DEFINE]);
            this.m_flashVars = _arg_1[GLOBAL_DEF.CONFIG_FLASH_VARS];
            this.m_runtimeData = new RuntimeData();
            this.m_runtimeData.initialize(_arg_1[GLOBAL_DEF.CONFIG_SERVER_INFO]);
            this.iniConfig();
            this.m_assetRefTable = new AssetRefTable();
            this._currentPaseIndex = 0;
            this._currentPaseConfs = _arg_1[GLOBAL_DEF.CONFIG_CONFS];
            this._sync = _arg_2;
            this.paseConfs();
        }

        protected function iniConfig():void
        {
            this.m_confsCache = new Dictionary();
            this.m_configs = new Dictionary();
            this.m_missionStaticInfoConfig = this.newConfig(ConfKey.K_MISSION_INFO, MissionStaticInfoConfig);
            this.m_propStaticInfoConfig = this.newConfig(ConfKey.K_ITEM_INFO, ItemStaticInfoConfig);
            this.m_gemCombinConfig = this.newConfig(ConfKey.K_GEM_COMBIM_INFO, GemCombinInfoConfig);
            this.m_equipStaticInfoConfig = this.newConfig(ConfKey.K_EQUIP_INFO, EquipStaticInfoConfig);
            this.m_suitStaticInfoConfig = this.newConfig(ConfKey.K_SUIT_INFO, SuitStaticInfoConfig);
            this.m_ethnicConfig = this.newConfig(ConfKey.K_ETHNIC_INFO, EthnicInfoConfig);
            this.m_equipEffectInfoConfig = this.newConfig(ConfKey.K_EFFECT_INFO, EffectInfoConfig);
            this.m_cityInfoConfig = this.newConfig(ConfKey.K_CITY_INFO, CityInfoConfig);
            this.m_skillInfoConfig = this.newConfig(ConfKey.k_P_SKILL_INFO, SkillGroupConfig);
            this.m_configs[ConfKey.K_M_SKILL_INFO] = this.m_skillInfoConfig;
            this.m_configs[ConfKey.k_PET_SKILL_INFO] = this.m_skillInfoConfig;
            this.m_petServiceSkillInfoConfig = this.newConfig(ConfKey.k_PET_S_SKILL_INFO, PetServiceSkillGroupConfig);
            this.m_dupInfoConfig = this.newConfig(ConfKey.K_DUP_INFO, DupStaticInfoConfig);
            this.m_dupLoadingInfoConfig = this.newConfig(ConfKey.K_DUPTIPS_INFO, DupLoadingInfoConfig);
            this.m_monsterStaticInfos = this.newConfig(ConfKey.K_MONSTER_STATIC_INFO, MonsterStaticInfoConfig);
            this.m_monsterAIInfoConfig = this.newConfig(ConfKey.K_MONSTER_AI_INFO, MonsterAIInfoConfig);
            this.m_petStaticInfos = this.newConfig(ConfKey.K_PET_STATIC_INFO, PetStaticInfoConfig);
            this.m_petAIInfoConfig = this.newConfig(ConfKey.K_PET_AI_INFO, PetAIInfoConfig);
            this.m_interactStaticInfos = this.newConfig(ConfKey.K_INTERACT_STATIC_INFO, InteractItemStaticInfoConfig);
            this.m_npcInfoConfig = this.newConfig(ConfKey.K_NPC_INFO, NpcStaticInfoConfig);
            this.m_sfInfoConfig = this.newConfig(ConfKey.K_SF_INFO, SpecialFuncInfoConfig);
            this.m_ssTypeInfoConfig = this.newConfig(ConfKey.K_SS_TYPE_INFO, SSTypeInfoConfig);
            this.m_ssInfoConfig = this.newConfig(ConfKey.K_SS_INFO, SpecialStatusInfoConfig);
            this.m_factoryInfosConfig = this.newConfig(ConfKey.K_FACTORY_INFO, FactoryInfosConfig);
            this.m_sDesConfig = this.newConfig(ConfKey.K_SCRIPT_INFO, ScriptDescriptionConfig);
            this.m_vkeyConfig = this.newConfig(ConfKey.K_VKEY_INFO, VKeyInfoConfig);
            this.m_motionInfoConfig = this.newConfig(ConfKey.K_MOTION_INFO, MotionInfoConfig);
            this.m_soundInfoConfig = this.newConfig(ConfKey.K_SOUND_INFO, SoundStaticInfoConfig);
            this.m_mailHandlerInfoConfig = this.newConfig(ConfKey.K_MAIL_HANDLER_INFO, MailHandlerStaticInfoConfig);
            this.m_badgeStaticInfoConfig = this.newConfig(ConfKey.K_BADGE_INFO, BadgeStaticInfoConfig);
            this.m_militaryRankStaticInfoConfig = this.newConfig(ConfKey.K_MILITARY_RANK_INFO, MilitaryRankStaticInfoConfig);
            this.m_plotInfoConfig = this.newConfig(ConfKey.K_PLOT_INFO, PlotInfoConfig);
            this.m_xpConfig = this.newConfig(ConfKey.K_MAX_XP_INFO, XPConfig);
            this.m_msnAwardXPConfig = this.newConfig(ConfKey.K_MISSION_AWARD_XP, MissionAwardXPConfig);
            this.m_cgsiConfig = this.newConfig(ConfKey.K_CASUAL_GAME_INFO, CasualGameStaticInfoConfig);
            this.m_psiConfig = this.newConfig(ConfKey.K_PRODUCT_INFO, ProductStaticInfoConfig);
            this.m_cwsiConfig = this.newConfig(ConfKey.K_CAREER_WEAR_INFO, CareerWearStaticInfoConfig);
            this.m_dialogInfoConfig = this.newConfig(ConfKey.K_DIALOG_INFO, DialogsInfoConfig);
            this.m_superShadowInfoConfig = this.newConfig(ConfKey.K_SUPERSHADOW_INFO, SuperShadowsInfoConfig);
            this.m_movieStaticInfoConfig = this.newConfig(ConfKey.K_MOVIE_INFO, MovieStaticInfoConfig);
            this.m_commonCDInfoConfig = this.newConfig(ConfKey.K_COMMON_CD_INFO, CommonCDConfig);
            this.m_shopListConfig = this.newConfig(ConfKey.K_SHOP_LIST_INFO, ShopListConfig);
            this.m_configs[ConfKey.K_DEFINE_INFO] = this.newConfig(ConfKey.K_DEFINE_INFO, DefineInfoConfig);
            this.m_skillTreeInfoConfig = this.newConfig(ConfKey.K_SKILL_TREE_INFO, SkillTreeStaticInfoConfig);
            this.m_nameStaticInfoConfig = this.newConfig(ConfKey.K_NAME_INFO, NameStaticInfoConfig);
            this.m_autorunStaticInfoConfig = this.newConfig(ConfKey.K_AUTORUN, AutorunStaticInfoConfig);
            this.m_equipCombinInfoConfig = this.newConfig(ConfKey.K_EQUIP_COMBIN_INFO, EquipCombinInfoConfig);
            this.m_equipEnhanceLackInfoConfig = this.newConfig(ConfKey.K_EQUIP_ENHANCE_LACK_INFO, EquipEnhanceLackInfoConfig);
            this.m_equipEnhanceLevelInfoConfig = this.newConfig(ConfKey.K_EQUIP_ENHANCE_LEVEL_INFO, EquipEnhanceLevelInfoConfig);
            this.m_equipEnhanceTypeInfoConfig = this.newConfig(ConfKey.K_EQUIP_ENHANCE_TYPE_INFO, EquipEnhanceTypeInfoConfig);
            this.m_cubeItemConfig = this.newConfig(ConfKey.K_CUBE_ITEM, CubeItemConfig);
            this.m_cubeFormulaConfig = this.newConfig(ConfKey.K_CUBE_FORMULA, CubeFormulaConfig);
            this.m_monsterBlood = this.newConfig(ConfKey.K_MONSTER_BLOOD, MonsterBloodStaticInfoConfig);
            this.m_equipEffectConfig = this.newConfig(ConfKey.K_EQUIP_EFFECT, EquipEffectConfig);
            this.m_warSoulStaticConfig = this.newConfig(ConfKey.K_WAR_SOUL, WarSoulStaticInfoConfig);
            this.m_bubbleDialogInfoConfig = this.newConfig(ConfKey.K_BUBBLE_DIALOG_INFO, BubbleDialogInfoConfig);
            this.m_mapDataInfoConfig = this.newConfig(ConfKey.MAP_DATA_INFO, MapDataInfoConfig);
            this.m_serverErrorCodeStaticInfoConfig = this.newConfig(ConfKey.K_SERVER_ERROR_CODE_INFO, ServerErrorCodeStaticInfoConfig);
            this.m_resDepandInfoConfig = this.newConfig(ConfKey.K_RES_DEPAND_INFO, ResDepandInfoConfig);
            this.m_soConfig = this.newConfig(ConfKey.K_SO_INFO, SOConfig);
        }

        protected function newConfig(key:String, _arg_2:Class)
        {
            var _local_3:Class = EXT_CONFIG_CLASS[key];
            if (_local_3 == null){
                _local_3 = _arg_2;
            };
            var _local_4:IConfig = new _local_3() as IConfig;
            this.m_configs[key] = _local_4;
            return (_local_4);
        }

        protected function paseConfs():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:ConfDef;
            var _local_7:String;
            var _local_8:IConfig;
            var _local_9:String;
            var _local_10:ByteArray;
            if (this._currentPaseConfs != null){
                _local_3 = getTimer();
                _local_2 = _local_3;
                _local_1 = _local_2;
                _local_4 = this._currentPaseConfs.length;
                _local_5 = this._currentPaseIndex;
                while (_local_5 < _local_4) {
                    _local_6 = this._currentPaseConfs[_local_5];
                    _local_7 = _local_6.key;
                    _local_8 = this.m_configs[_local_7];
                    if (_local_8 != null){
                        _local_10 = _local_6.byteArray;
                        if ((((_local_10.length > 3)) && ((String.fromCharCode(_local_10[0], _local_10[1], _local_10[2]) == "FAI")))){
                            _local_10.position = 0;
                            _local_8.readConfig(_local_10);
                        } else {
                            if (_local_10.length > 0){
                                _local_10.position = 0;
                                _local_9 = _local_10.readUTFBytes(_local_10.length);
                                _local_8.parse(_local_9);
                            };
                        };
                    };
                    this.m_confsCache[_local_7] = _local_6;
                    if (((!(this._sync)) && (((getTimer() - _local_1) > 500)))){
                        this._currentPaseIndex = (_local_5 + 1);
                        logToLabel((((("解析配置文件进度[" + this._currentPaseIndex) + "/") + _local_4) + "]"));
                        setTimeout(this.paseConfs, 50);
                        return;
                    };
                    _local_5++;
                };
            };
            _local_2 = getTimer();
            dispatchEvent(new Event(Event.INIT));
        }

        public function saveConfsAndTest():void
        {
            this.rebuildForTest();
            this.campareDatas();
        }

        private function campareDatas():void
        {
            var _local_1:Boolean;
            var _local_3:String;
            var _local_4:Array;
            this._xmlConfigs;
            this.m_configs;
            var _local_2:Array = ["badge_info"];
            for (_local_3 in this._xmlConfigs) {
                if (_local_3 != "badge_info"){
                    _local_4 = TypeInfo.describeType(this._xmlConfigs[_local_3]).getPublicPropertyNames();
                    if ((((_local_4.length > 0)) && ((_local_2.indexOf(_local_3) == -1)))){
                        _local_1 = equal(this._xmlConfigs[_local_3], this.m_configs[_local_3]);
                        if (!_local_1){
                            throw (new Error(((this.getConfItem(_local_3)) ? this.getConfItem(_local_3).name : _local_3), "   不相对"));
                        };
                        debug(((this.getConfItem(_local_3)) ? this.getConfItem(_local_3).name : _local_3), "   =ok");
                    };
                };
            };
        }

        private function rebuildForTest():void
        {
            this._rebuilded = true;
            this._xmlConfigs = this.m_configs;
            this.iniConfig();
            this.saveConfs();
            this.m_assetRefTable = new AssetRefTable();
            this._currentPaseIndex = 0;
            this.iniConfig();
            this.paseConfs();
        }

        public function saveConfs():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Dictionary;
            var _local_6:int;
            var _local_7:ConfDef;
            var _local_8:String;
            var _local_9:IConfig;
            var _local_10:ByteArray;
            var _local_11:int;
            var _local_12:String;
            if (this._currentPaseConfs != null){
                _local_3 = getTimer();
                _local_2 = _local_3;
                _local_1 = _local_2;
                _local_4 = this._currentPaseConfs.length;
                _local_5 = new Dictionary();
                _local_6 = 0;
                while (_local_6 < _local_4) {
                    _local_7 = this._currentPaseConfs[_local_6];
                    _local_8 = _local_7.key;
                    _local_9 = this.m_configs[_local_8];
                    if (((_local_9) && ((_local_9.getVersion() > 0)))){
                        _local_10 = _local_7.byteArray;
                        _local_11 = _local_10.length;
                        _local_10.position = 0;
                        _local_12 = _local_10.readUTFBytes(_local_10.length);
                        _local_9.clearConfig();
                        _local_9.parse(_local_12);
                        _local_10.clear();
                        _local_10 = new ByteArray();
                        _local_9.writeConfig(_local_10);
                        _local_7.byteArray = _local_10;
                        _local_2 = getTimer();
                        debug((((((("转Binary文件进度[" + _local_6) + "/") + _local_4) + "]    耗时：") + (_local_2 - _local_3)) + " ms."), "\t\txml size:", _local_11, ",binary size:", _local_10.length, "\t", _local_7.name);
                        if (_local_11 < _local_10.length){
                            debug("大小有问题", _local_7.name);
                        };
                        _local_5[_local_9] = _local_7;
                        _local_3 = _local_2;
                    } else {
                        debug((((("转Binary文件进度[" + _local_6) + "/") + _local_4) + "]    未实现>>>>"), "xml size:", _local_7.byteArray.length, "\t", _local_7.name);
                    };
                    _local_6++;
                };
            };
            _local_2 = getTimer();
            debug((("转Binary文件进度 总耗时：" + (_local_2 - _local_1)) + " ms."));
        }

        protected function setDEFINE(_arg_1:Vector.<AttrDef>):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:AttrDef;
            if (_arg_1 != null){
                _local_2 = _arg_1.length;
                _local_3 = 0;
                while (_local_3 < _local_2) {
                    _local_4 = _arg_1[_local_3];
                    DEFINE[_local_4.name] = _local_4.value;
                    _local_3++;
                };
            };
            DEFINE.DM = this;
        }

        public function get runtime():IRuntimeData
        {
            return (this.m_runtimeData);
        }

        public function get mainModel():IMainPlayerModel
        {
            var _local_1:IPlayerModelManager;
            if (this.m_mainModel == null){
                _local_1 = AICore.playerSystem.getPlayerModelManager();
                if (_local_1 != null){
                    this.m_mainModel = _local_1.getMainPlayerModel();
                };
            };
            return (this.m_mainModel);
        }

        public function get assetRefTable():IAssetRefTable
        {
            return (this.m_assetRefTable);
        }

        public function getConfItem(_arg_1:String):ConfDef
        {
            return (this.m_confsCache[_arg_1]);
        }

        public function getConfText(_arg_1:String):String
        {
            var _local_2:ConfDef = this.getConfItem(_arg_1);
            if (((_local_2) && (!(_local_2.text)))){
                _local_2.byteArray.position = 0;
                _local_2.text = _local_2.byteArray.readUTFBytes(_local_2.byteArray.length);
            };
            return ((((_local_2 == null)) ? null : _local_2.text));
        }

        public function getFlashVar(_arg_1:String):Object
        {
            if (this.m_flashVars == null){
                return (null);
            };
            return (this.m_flashVars[_arg_1]);
        }

        public function setConfig(_arg_1:String, _arg_2:IConfig):void
        {
            if (this.getConfig(_arg_1) == null){
                this.m_configs[_arg_1] = _arg_2;
            };
        }

        public function getConfigs():Dictionary
        {
            return (this.m_configs);
        }

        public function getConfig(_arg_1:String):IConfig
        {
            return (this.m_configs[_arg_1]);
        }

        public function getEquipStaticInfo(_arg_1:int):EquipStaticInfo
        {
            return ((this.m_equipStaticInfoConfig.find(_arg_1) as EquipStaticInfo));
        }

        public function getAllEquipStaticInfos():Vector.<EquipStaticInfo>
        {
            return ((this.m_equipStaticInfoConfig.findAll() as Vector.<EquipStaticInfo>));
        }

        public function getAllItemStaticInfos():Vector.<ItemStaticInfo>
        {
            return ((this.m_propStaticInfoConfig.findAll() as Vector.<ItemStaticInfo>));
        }

        public function getItemStaticInfo(_arg_1:int):ItemStaticInfo
        {
            var _local_2:ItemStaticInfo = (this.m_equipStaticInfoConfig.find(_arg_1) as ItemStaticInfo);
            if (_local_2 == null){
                _local_2 = (this.m_propStaticInfoConfig.find(_arg_1) as ItemStaticInfo);
            };
            return (_local_2);
        }

        public function getGemCombinStaticInfo(_arg_1:int):GemCombinStaticInfo
        {
            return ((this.m_gemCombinConfig.find(_arg_1) as GemCombinStaticInfo));
        }

        public function getAllGemCombinStaticInfo():Vector.<GemCombinStaticInfo>
        {
            return ((this.m_gemCombinConfig.findAll() as Vector.<GemCombinStaticInfo>));
        }

        public function getMissionStaticInfo(_arg_1:uint):MissionStaticInfo
        {
            return ((this.m_missionStaticInfoConfig.find(_arg_1) as MissionStaticInfo));
        }

        public function getAllMissionStaticInfo():Vector.<MissionStaticInfo>
        {
            return ((this.m_missionStaticInfoConfig.findAll() as Vector.<MissionStaticInfo>));
        }

        public function getSuitStaticInfo(_arg_1:int):SuitStaticInfo
        {
            return ((this.m_suitStaticInfoConfig.find(_arg_1) as SuitStaticInfo));
        }

        public function getCareerInfo(_arg_1:int):CareerInfo
        {
            var _local_2:Dictionary = CareerIDDef.getCareerInfos();
            var _local_3:CareerInfo = (_local_2[_arg_1] as CareerInfo);
            if (_local_3 == null){
                _local_3 = new CareerInfo(_arg_1, "莫名职业");
                _local_2[_arg_1] = _local_3;
            };
            return (_local_3);
        }

        public function getEthnicID(_arg_1:int):int
        {
            return (int((_arg_1 * Constants.CAREER_TO_ETHNIC)));
        }

        public function getEthnicInfo(_arg_1:int):EthnicInfo
        {
            return ((this.m_ethnicConfig.find(_arg_1) as EthnicInfo));
        }

        public function getNpcStaticInfo(_arg_1:int):NpcStaticInfo
        {
            return ((this.m_npcInfoConfig.find(_arg_1) as NpcStaticInfo));
        }

        public function getSpecialFuncInfo(_arg_1:int):SpecialFuncInfo
        {
            return ((this.m_sfInfoConfig.find(_arg_1) as SpecialFuncInfo));
        }

        public function getSpecialStatusInfo(_arg_1:int):SpecialStatusInfo
        {
            return ((this.m_ssInfoConfig.find(_arg_1) as SpecialStatusInfo));
        }

        public function getSSTypeInfo(_arg_1:int):SSTypeInfo
        {
            return ((this.m_ssTypeInfoConfig.find(_arg_1) as SSTypeInfo));
        }

        public function getAllEthnicInfos():Vector.<EthnicInfo>
        {
            return ((this.m_ethnicConfig.findAll() as Vector.<EthnicInfo>));
        }

        public function getEffectInfo(_arg_1:int):EffectStaticInfo
        {
            return ((this.m_equipEffectInfoConfig.find(_arg_1) as EffectStaticInfo));
        }

        public function getEffectStaticInfos():Array
        {
            return ((this.m_equipEffectInfoConfig.findAll() as Array));
        }

        public function getMonsterStaticInfo(_arg_1:int):MonsterStaticInfo
        {
            return ((this.m_monsterStaticInfos.find(_arg_1) as MonsterStaticInfo));
        }

        public function getAllMonsterStaticInfo():Array
        {
            return ((this.m_monsterStaticInfos.findAll() as Array));
        }

        public function getMonsterAIInfo(_arg_1:int):MonsterAIInfo
        {
            return ((this.m_monsterAIInfoConfig.find(_arg_1) as MonsterAIInfo));
        }

        public function getPetStaticInfo(_arg_1:int):PetStaticInfo
        {
            return ((this.m_petStaticInfos.find(_arg_1) as PetStaticInfo));
        }

        public function getAllPetStaticInfo():Array
        {
            return ((this.m_petStaticInfos.findAll() as Array));
        }

        public function getAllPetBattleSkillsBy(_arg_1:int, _arg_2:int):Dictionary
        {
            return (this.m_petStaticInfos.getAllBattleSkillsBy(_arg_1, _arg_2));
        }

        public function getPetAIInfo(_arg_1:int):PetAIInfo
        {
            return ((this.m_petAIInfoConfig.find(_arg_1) as PetAIInfo));
        }

        public function getInteractItemStaticInfo(_arg_1:int):InteractItemStaticInfo
        {
            return ((this.m_interactStaticInfos.find(_arg_1) as InteractItemStaticInfo));
        }

        public function getAllInteractItemStaticInfo():Dictionary
        {
            return ((this.m_interactStaticInfos.findAll() as Dictionary));
        }

        public function getFactoryInfos(_arg_1:String):Vector.<FactoryInfo>
        {
            return ((this.m_factoryInfosConfig.find(_arg_1) as Vector.<FactoryInfo>));
        }

        public function getBubbleDialogInfo(_arg_1:int):BubbleDialog
        {
            if (this.m_bubbleDialogInfoConfig.find(_arg_1) != null){
                return ((this.m_bubbleDialogInfoConfig.find(_arg_1) as BubbleDialog));
            };
            return (null);
        }

        public function getMapDataInfo(_arg_1:int):MapDataInfo
        {
            if (this.m_mapDataInfoConfig.find(_arg_1) != null){
                return ((this.m_mapDataInfoConfig.find(_arg_1) as MapDataInfo));
            };
            return (null);
        }

        public function getCityInfos():Dictionary
        {
            return ((this.m_cityInfoConfig.findAll() as Dictionary));
        }

        public function getCitySceneInfo(_arg_1:int):SceneInfo
        {
            return ((this.m_cityInfoConfig.find(_arg_1) as SceneInfo));
        }

        public function getDupPlanetInfos():Dictionary
        {
            return ((this.m_dupInfoConfig.findAll() as Dictionary));
        }

        public function getDupLoadingInfos():Array
        {
            return (this.m_dupLoadingInfoConfig.dupLoadingTips);
        }

        public function getLostFocusTips():Array
        {
            return (this.m_dupLoadingInfoConfig.lostFocusTips);
        }

        public function getDupPlanetInfo(_arg_1:int):DupPlanetInfo
        {
            return ((this.m_dupInfoConfig.find(_arg_1) as DupPlanetInfo));
        }

        public function getDupStaticInfo(_arg_1:int):DupStaticInfo
        {
            return (this.m_dupInfoConfig.findDupStaticInfo(_arg_1));
        }

        public function getSkillGroup(_arg_1:int):SkillGroup
        {
            return ((this.m_skillInfoConfig.find(_arg_1) as SkillGroup));
        }

        public function getSkillGroups():Vector.<SkillGroup>
        {
            return ((this.m_skillInfoConfig.findAll() as Vector.<SkillGroup>));
        }

        public function getSkillGroupsWTLevel(_arg_1:int):Vector.<SkillGroup>
        {
            return (this.m_skillInfoConfig.findWTLevel(_arg_1));
        }

        public function getScriptDescriptions(_arg_1:int=0):Array
        {
            return (this.m_sDesConfig.getScriptDescriptions(_arg_1));
        }

        public function getVKeyInfos():Array
        {
            return ((this.m_vkeyConfig.findAll() as Array));
        }

        public function getMotionInfos():Array
        {
            return ((this.m_motionInfoConfig.findAll() as Array));
        }

        public function getSoundPackageInfo(_arg_1:int):SoundPackageInfo
        {
            return ((this.m_soundInfoConfig.find(_arg_1) as SoundPackageInfo));
        }

        public function getAllSoundPackageInfos():Array
        {
            return ((this.m_soundInfoConfig.findAll() as Array));
        }

        public function getAllPlotInfos():Array
        {
            return ((this.m_plotInfoConfig.findAll() as Array));
        }

        public function getAllNpcInfos():Vector.<NpcStaticInfo>
        {
            var _local_2:NpcStaticInfo;
            var _local_1:Vector.<NpcStaticInfo> = new Vector.<NpcStaticInfo>();
            var _local_3:int;
            var _local_4:* = this.m_npcInfoConfig.findAll();
            for each (_local_2 in this.m_npcInfoConfig.findAll()) {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        public function getMaxXPValue(_arg_1:int):int
        {
            return ((this.m_xpConfig.find(_arg_1) as int));
        }

        public function getMissionAwardXP(_arg_1:int, _arg_2:int):int
        {
            return (this.m_msnAwardXPConfig.getValue(_arg_1, _arg_2));
        }

        public function getCasualGameStaticInfo(_arg_1:uint):CasualGameStaticInfo
        {
            return ((this.m_cgsiConfig.find(_arg_1) as CasualGameStaticInfo));
        }

        public function getAllCasualGameStaticInfo():Vector.<CasualGameStaticInfo>
        {
            return ((this.m_cgsiConfig.findAll() as Vector.<CasualGameStaticInfo>));
        }

        public function getProductStaticInfo(_arg_1:uint):ProductStaticInfo
        {
            return ((this.m_psiConfig.find(_arg_1) as ProductStaticInfo));
        }

        public function getAllProductStaticInfo():Vector.<ProductStaticInfo>
        {
            return ((this.m_psiConfig.findAll() as Vector.<ProductStaticInfo>));
        }

        public function getCareerWearStaticInfo(_arg_1:int, _arg_2:int, _arg_3:int):CareerWearStaticInfo
        {
            return (this.m_cwsiConfig.findCareerWear(_arg_1, _arg_2, _arg_3));
        }

        public function getDialogInfo(_arg_1:int):MultiDialogInfo
        {
            return ((this.m_dialogInfoConfig.find(_arg_1) as MultiDialogInfo));
        }

        public function getAllDialogInfos():Array
        {
            return ((this.m_dialogInfoConfig.findAll() as Array));
        }

        public function getSuperShadowInfo(_arg_1:int):SuperShadowInfo
        {
            return ((this.m_superShadowInfoConfig.find(_arg_1) as SuperShadowInfo));
        }

        public function getAllSuperShadowInfos():Array
        {
            return ((this.m_superShadowInfoConfig.findAll() as Array));
        }

        public function getMovieStaticInfo(_arg_1:int):MovieStaticInfo
        {
            return ((this.m_movieStaticInfoConfig.find(_arg_1) as MovieStaticInfo));
        }

        public function getAllMovieStaticInfos():Array
        {
            return ((this.m_movieStaticInfoConfig.findAll() as Array));
        }

        public function getShopInfo(_arg_1:int):ShopInfo
        {
            return ((this.m_shopListConfig.find(_arg_1) as ShopInfo));
        }

        public function getCommonCDInfo(_arg_1:int):CommonCDInfo
        {
            return ((this.m_commonCDInfoConfig.find(_arg_1) as CommonCDInfo));
        }

        public function getAllCommonCDInfos():Vector.<CommonCDInfo>
        {
            return ((this.m_commonCDInfoConfig.findAll() as Vector.<CommonCDInfo>));
        }

        public function getMailHandler(_arg_1:int):ScriptInfo
        {
            return ((this.m_mailHandlerInfoConfig.find(_arg_1) as ScriptInfo));
        }

        public function getAllMailHandler():Dictionary
        {
            return ((this.m_mailHandlerInfoConfig.findAll() as Dictionary));
        }

        public function getBadgeInfo(_arg_1:int):BadgeInfo
        {
            return ((this.m_badgeStaticInfoConfig.find(_arg_1) as BadgeInfo));
        }

        public function getAllBadgeInfoInBadge():Dictionary
        {
            return ((this.m_badgeStaticInfoConfig.findAll() as Dictionary));
        }

        public function getBadgeInfoByGroup(_arg_1:int):Vector.<BadgeInfo>
        {
            return (this.m_badgeStaticInfoConfig.getBadgeInfoByGroup(_arg_1));
        }

        public function getMilitaryRankInfo(_arg_1:int):MilitaryRankInfo
        {
            return ((this.m_militaryRankStaticInfoConfig.find(_arg_1) as MilitaryRankInfo));
        }

        public function getAllMilitaryRankInfos():Dictionary
        {
            return ((this.m_militaryRankStaticInfoConfig.findAll() as Dictionary));
        }

        public function getServerErrorCodeInfo(_arg_1:int):ServerErrorCodeInfo
        {
            return ((this.m_serverErrorCodeStaticInfoConfig.find(_arg_1) as ServerErrorCodeInfo));
        }

        public function getAllResDepandInfo():Dictionary
        {
            return ((this.m_resDepandInfoConfig.findAll() as Dictionary));
        }

        public function getPositiveSkills(_arg_1:int):Vector.<int>
        {
            return (this.m_skillTreeInfoConfig.getPositiveSkills(_arg_1));
        }

        public function getCostSkill(_arg_1:int):int
        {
            return (this.m_skillTreeInfoConfig.getCostSkill(_arg_1));
        }

        public function getAllCostSkillBy(_arg_1:int):Vector.<int>
        {
            return (this.m_skillTreeInfoConfig.getAllCostSkillBy(_arg_1));
        }

        public function getSublimeSkill(_arg_1:int):int
        {
            return (this.m_skillTreeInfoConfig.getSublimeSkill(_arg_1));
        }

        public function checkCostSkillNeedTrans(_arg_1:int):Boolean
        {
            return (this.m_skillTreeInfoConfig.checkCostSkillNeedTrans(_arg_1));
        }

        public function getNames(_arg_1:int):Vector.<String>
        {
            return (this.m_nameStaticInfoConfig.getNames(_arg_1));
        }

        public function getLoginRunScripts(_arg_1:int):Vector.<ScriptInfo>
        {
            return (this.m_autorunStaticInfoConfig.getLoginRunScripts(_arg_1));
        }

        public function getRunScripts(_arg_1:int):Vector.<ScriptInfo>
        {
            return (this.m_autorunStaticInfoConfig.getRunScripts(_arg_1));
        }

        public function getAllRunScripts():Dictionary
        {
            return ((this.m_autorunStaticInfoConfig.findAll() as Dictionary));
        }

        public function getRunInfoByEvent(_arg_1:String):Vector.<AutorunInfo>
        {
            return (this.m_autorunStaticInfoConfig.getRunInfoByEvent(_arg_1));
        }

        public function getEquipCombinInfo(_arg_1:int):EquipCombinInfo
        {
            return ((this.m_equipCombinInfoConfig.find(_arg_1) as EquipCombinInfo));
        }

        public function getEquipEnhanceLackInfo(_arg_1:String):int
        {
            return ((this.m_equipEnhanceLackInfoConfig.find(_arg_1) as int));
        }

        public function getEquipEnhanceLevelInfo(_arg_1:int):EquipEnhanceLevelInfo
        {
            return ((this.m_equipEnhanceLevelInfoConfig.find(_arg_1) as EquipEnhanceLevelInfo));
        }

        public function getEquipEnhanceTypeInfo(_arg_1:int):Vector.<EquipAttribExtend>
        {
            return ((this.m_equipEnhanceTypeInfoConfig.find(_arg_1) as Vector.<EquipAttribExtend>));
        }

        public function getCubeItemInfo(_arg_1:String, _arg_2:int):CubeItemInfo
        {
            return ((this.m_cubeItemConfig.findCubeItemInfo(_arg_1, _arg_2) as CubeItemInfo));
        }

        public function getCubeFormulaInfo(_arg_1:CubeFormulaInfo):Vector.<CubeFormulaInfo>
        {
            return ((this.m_cubeFormulaConfig.find(_arg_1) as Vector.<CubeFormulaInfo>));
        }

        public function getCubeFormulaInfoAll():Vector.<CubeFormulaInfo>
        {
            return ((this.m_cubeFormulaConfig.findAll() as Vector.<CubeFormulaInfo>));
        }

        public function isRunScriptOnce(_arg_1:int):Boolean
        {
            return (this.m_autorunStaticInfoConfig.isOnce(_arg_1));
        }

        public function getAllSOConfig():Dictionary
        {
            return ((this.m_soConfig.findAll() as Dictionary));
        }

        public function getPetServiceSkillGroup(_arg_1:int):PetServiceSkillGroup
        {
            return ((this.m_petServiceSkillInfoConfig.find(_arg_1) as PetServiceSkillGroup));
        }

        public function getPetSkillGroup(_arg_1:int):SkillGroup
        {
            return ((this.m_skillInfoConfig.find(_arg_1) as SkillGroup));
        }

        public function appendSkillGroup(_arg_1:Object, _arg_2:int=1):void
        {
            this.m_skillInfoConfig.append(_arg_1, _arg_2);
        }

        public function changeSkillGroupDataType(_arg_1:int, _arg_2:Boolean=false):void
        {
            this.m_skillInfoConfig.changeDataType(_arg_1, _arg_2);
        }

        public function getSkillGroupDataType():int
        {
            return (this.m_skillInfoConfig.getDataType());
        }

        public function getFakeAIInfo(_arg_1:int):MonsterAIInfo
        {
            var _local_2:MonsterAIInfoConfig = (this.getConfig(ConfKey.K_FAKE_PLAYER_AI_INFO) as MonsterAIInfoConfig);
            return ((_local_2.find(_arg_1) as MonsterAIInfo));
        }

        public function findMonsterBloodCount(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            return (this.m_monsterBlood.findBloodCount(_arg_1, _arg_2, _arg_3));
        }

        public function getEquipEffect(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):EquipEffect
        {
            return (this.m_equipEffectConfig.findEquipEffect(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function convertConfigXMLToBytes(_arg_1:String, _arg_2:Object, _arg_3:ByteArray):Boolean
        {
            var _local_4:IConfig = this.getConfig(_arg_1);
            if (_local_4 != null){
                if (_local_4.getVersion() != 0){
                    _local_4.clearConfig();
                    _local_4.parse(_arg_2);
                    _local_4.writeConfig(_arg_3);
                    return (true);
                };
            };
            return (false);
        }

        public function getWarSoulStaticInfo(_arg_1:int, _arg_2:int, _arg_3:int):WarSoulStaticInfo
        {
            return (this.m_warSoulStaticConfig.findWarSoul(_arg_1, _arg_2, _arg_3));
        }

        public function getConfigBytes(_arg_1:String, _arg_2:ByteArray):Boolean
        {
            var _local_3:IConfig = this.getConfig(_arg_1);
            if (_local_3 != null){
                if (_local_3.getVersion() != 0){
                    _local_3.writeConfig(_arg_2);
                    return (true);
                };
            };
            return (false);
        }

        public function setConfigBytes(_arg_1:String, _arg_2:ByteArray):Boolean
        {
            var _local_3:IConfig = this.getConfig(_arg_1);
            if (_local_3 != null){
                if (_local_3.getVersion() != 0){
                    _local_3.clearConfig();
                    _local_3.writeConfig(_arg_2);
                    return (true);
                };
            };
            return (false);
        }

        public /*  ©init. */ function _SafeStr_588()
        {
        }


    }
}//package com.tencent.ai.core.manager.data.impl

// _SafeStr_588 = " DataManager" (String#14087)


