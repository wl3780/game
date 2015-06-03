package com.tencent.ai
{
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.bubble.IBubbleManager;
    import com.tencent.ai.core.combat.impl.AICombatSystem;
    import com.tencent.ai.core.condition.initializeCondition;
    import com.tencent.ai.core.context.AIContext;
    import com.tencent.ai.core.crypto.ICryptoManager;
    import com.tencent.ai.core.data.AIInitClasses;
    import com.tencent.ai.core.data.arg.SystemMessagArg;
    import com.tencent.ai.core.debug.DebugHelp;
    import com.tencent.ai.core.dialog.IDialogManager;
    import com.tencent.ai.core.display.DisplaySystem;
    import com.tencent.ai.core.effect.impl.EffectManager;
    import com.tencent.ai.core.enum.ChannelIDs;
    import com.tencent.ai.core.enum.ConfKey;
    import com.tencent.ai.core.enum.ConnectionType;
    import com.tencent.ai.core.enum.Constants;
    import com.tencent.ai.core.enum.GameMode;
    import com.tencent.ai.core.enum.SystemMessagType;
    import com.tencent.ai.core.events.AIEvent;
    import com.tencent.ai.core.events.AssetLoadEvent;
    import com.tencent.ai.core.func.initializeSpecialFunc;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.interact.impl.InteractItemSystem;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.data.impl.DataManager;
    import com.tencent.ai.core.manager.key.GameKeyManager;
    import com.tencent.ai.core.mission.IMissionManager;
    import com.tencent.ai.core.monster.impl.MonsterSystem;
    import com.tencent.ai.core.movie.IMovieManager;
    import com.tencent.ai.core.net.impl.AINetwork;
    import com.tencent.ai.core.net.impl.AISecureTcpConnLinger;
    import com.tencent.ai.core.net.impl.AISecureTcpConnUNLinger;
    import com.tencent.ai.core.npc.impl.NpcSystem;
    import com.tencent.ai.core.pet.impl.PetSystem;
    import com.tencent.ai.core.player.IPlayerModelManager;
    import com.tencent.ai.core.player.impl.PlayerSystem;
    import com.tencent.ai.core.plot.IPlotSystem;
    import com.tencent.ai.core.scene.property.initializeProperty;
    import com.tencent.ai.core.script.ScriptManager;
    import com.tencent.ai.core.script.initializeScript;
    import com.tencent.ai.core.sound.SoundManager;
    import com.tencent.ai.core.status.initializeStatus;
    import com.tencent.ai.core.triggerEvent.initializeTriggerEvent;
    import com.tencent.free.Free;
    import com.tencent.free.core.events.FreeEvent;
    import com.tencent.free.core.lib.CLASS;
    import com.tencent.free.core.plugin.IPluginManager;
    import com.tencent.free.core.plugin.PluginConfig;
    import com.tencent.free.core.plugin.PluginLoadType;
    import com.tencent.free.core.plugin.PluginRequest;
    import com.tencent.free.logging.LoggingDefine;
    import com.tencent.free.logging.info;
    import com.tencent.free.logging.warning;
    import com.tencent.free.setup.GLOBAL_DEF;
    
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.system.Capabilities;
    import flash.utils.Dictionary;

    public class AIApplication extends AICore 
    {

        static const DEFAULT:String = "default";

        protected var m_contexts:Dictionary;
        protected var m_AssetLoader:AIAssetsLoader;
        protected var m_globalXML:Dictionary;
        protected var m_classes:AIInitClasses;

        public function AIApplication()
        {
            _initThis();
        }

        private function _initThis():void
        {
            AICore.setRuntime(this);
            LoggingDefine.value = LoggingDefine.LEVEL_WARNING;
            DebugHelp.REGISTER("AICoreInstance", this);
            DebugHelp.REGISTER("AICore", AICore);
            DebugHelp.REGISTER("DebugHelp", DebugHelp);
        }

        private function _initialize():void
        {
            addEventListener(AIEvent.ON_SYSTEM_MSG, this.onSystemMsg);
            m_free.addEventListener(FreeEvent.PLUGIN_INSTALL_ERROR, this.onPluginInstallFinished);
            m_free.addEventListener(FreeEvent.PLUGIN_INSTALL_COMPLETE, this.onPluginInstallFinished);
            m_free.addEventListener(FreeEvent.ON_BEFORE_PLUGIN_LOAD, this.onPluginInstallStart);
            m_free.addEventListener(FreeEvent.PLUGIN_INSTALL_PROGRESS, this.onPluginInstallProgress);
        }

        private function _checkChannel():void
        {
            var _local_1:Boolean = callHtmlFunction("isWeiduanIcon");
            var _local_2:Object = AICore.data.getFlashVar("channel");
            var _local_3:int = ((_local_2) ? int(_local_2) : 0);
            ChannelIDs.isMicroClient = ((((((_local_1) || ((_local_3 == ChannelIDs._3366_link)))) || ((_local_3 == ChannelIDs.web_link)))) || ((_local_3 == ChannelIDs.jjxf)));
        }

        protected function onPluginInstallFinished(_arg_1:FreeEvent):void
        {
            if (_arg_1.type == FreeEvent.PLUGIN_INSTALL_ERROR){
                UIManager.getInstance().alert(_arg_1.message, "插件加载错误");
            };
        }

        protected function onPluginInstallStart(_arg_1:FreeEvent):void
        {
            var _local_3:PluginConfig;
            var _local_2:PluginRequest = (_arg_1.data as PluginRequest);
        }

        protected function onPluginInstallProgress(_arg_1:FreeEvent):void
        {
            var _local_2:Object = _arg_1.data;
        }

        protected function onSystemMsg(_arg_1:AIEvent):void
        {
            var _local_2:SystemMessagArg = (_arg_1.data as SystemMessagArg);
            if (((!((_local_2 == null))) && ((_local_2.type == SystemMessagType.MSG_ALERT_ERROR)))){
                Alert.show(_local_2.text, "策划问题提示");
            };
        }

        protected function installPlugins(_arg_1:IPluginManager, _arg_2:Vector.<PluginConfig>):void
        {
            var _local_4:PluginConfig;
            var _local_3:int;
            while (_local_3 < _arg_2.length) {
                _local_4 = _arg_2[_local_3];
                _arg_1.install(_local_4);
                _local_3++;
            };
        }

        protected function addContexts(_arg_1:Vector.<Object>):void
        {
            var _local_4:Object;
            var _local_5:Object;
            var _local_6:String;
            if (this.m_contexts == null){
                this.m_contexts = new Dictionary();
            };
            if (_arg_1 == null){
                return;
            };
            var _local_2:int = _arg_1.length;
            var _local_3:int;
            while (_local_3 < _local_2) {
                _local_4 = _arg_1[_local_3];
                _local_5 = CLASS.current.newInstance(_local_4.className);
                this.m_contexts[_local_4.name] = _local_5;
                _local_6 = _local_4.label;
                if (_local_6 != ""){
                    this.m_contexts[_local_6] = _local_5;
                };
                _local_3++;
            };
        }

        protected function runApplication(_arg_1:AIEvent=null):void
        {
            info("[AIApplication] 登录成功 加载必备的资源文件集");
            this.m_AssetLoader = new AIAssetsLoader();
            this.m_AssetLoader.addEventListener(AssetLoadEvent.COMPLETE, this.onAssetLoaded);
            this.m_AssetLoader.start((DEFINE.GAME_MODE == GameMode.MODE_RELEASE));
        }

        protected function onAssetLoaded(_arg_1:AssetLoadEvent):void
        {
            if (data.runtime.isIntroduceLogin == false){
                this.activeContext(DEFAULT);
            } else {
                dispatchEvent(new AIEvent(AIEvent.ON_LOGIN_INTRODUCE));
            };
        }

        protected function initializeOthers(_arg_1:Event):void
        {
            var _local_2:DataManager = DataManager(m_data);
            var _local_3:AIInitClasses = this.m_classes;
            var _local_4:Dictionary = this.m_globalXML;
            _local_2.removeEventListener(Event.INIT, this.initializeOthers);
            UIManager.getInstance().initialize(m_root, m_root);
            var _local_5:ScriptManager = ScriptManager.getInstance();
            _local_5.initialize();
            m_script = _local_5;
            this.m_net = new AINetwork();
            m_cryptoManager = (_local_3.create(_local_3.CLASS_CryptoManager) as ICryptoManager);
            var _local_6:Object = {};
            _local_6.serverInfo = _local_2.runtime.serverInfo;
            _local_6.cryptoManager = m_cryptoManager;
            _local_6.connections = [{
                "type":ConnectionType.TCP_LINGER_SECURE,
                "cls":AISecureTcpConnLinger
            }, {
                "type":ConnectionType.TCP_UNLINGER_SECURE,
                "cls":AISecureTcpConnUNLinger
            }];
            this.m_net.initialize(_local_6);
            var _local_7:EffectManager = EffectManager.getInstance();
            _local_7.initialize();
            this.m_effect = _local_7;
            var _local_8:SoundManager = new SoundManager();
            _local_8.initialize();
            this.m_sound = _local_8;
            m_movie = (_local_3.create(_local_3.CLASS_MovieManager) as IMovieManager);
            if (m_movie != null){
                m_movie.initialize();
            };
            m_dialog = (_local_3.create(_local_3.CLASS_DialogManager) as IDialogManager);
            m_bubble = (_local_3.create(_local_3.CLASS_BubbleManager) as IBubbleManager);
            if (m_bubble != null){
                m_bubble.initialize();
            };
            GameKeyManager.initialize(root.stage);
            var _local_9:PlayerSystem = new PlayerSystem();
            _local_9.initialize(_local_2, net, _local_7, (_local_3.create(_local_3.CLASS_PlayerModelManager) as IPlayerModelManager));
            this.m_player_sys = _local_9;
            var _local_10:NpcSystem = new NpcSystem();
            _local_10.initialize();
            this.m_npc_sys = _local_10;
            var _local_11:MonsterSystem = new MonsterSystem(_local_2, _local_7);
            _local_11.initialize(_local_3);
            this.m_monster_sys = _local_11;
            var _local_12:PetSystem = new PetSystem(_local_2, _local_7);
            _local_12.initialize(_local_3);
            this.m_pet_sys = _local_12;
            var _local_13:InteractItemSystem = new InteractItemSystem(_local_2, _local_7);
            _local_13.initialize();
            this.m_interactItem_sys = _local_13;
            var _local_14:AICombatSystem = new AICombatSystem();
            _local_14.initialize();
            this.m_combat_sys = _local_14;
            m_mission = (_local_3.create(_local_3.CLASS_MissionManager) as IMissionManager);
            if (m_mission != null){
                m_mission.initialize();
            };
            m_plot = (_local_3.create(_local_3.CLASS_PlotSystem) as IPlotSystem);
            if (m_plot != null){
                m_plot.initialize();
            };
            m_guideSystem = (_local_3.create(_local_3.CLASS_GuideSystem) as IGuideSystemManager);
            if (m_guideSystem != null){
                m_guideSystem.initialize();
            };
            m_protectModule = new AIProtectModule();
            initializeExtAICore();
            m_free = Free.Default;
            m_free.initialize({"configString":data.getConfText(ConfKey.K_PLUGIN_INFO)});
            this._initialize();
            this.addContexts(_local_4[Constants.CONFIG_ADD_CONTEXTS]);
            var _local_15:IPluginManager = m_free.getPluginManager();
            var _local_16:Vector.<PluginConfig> = _local_15.getConfigManager().getConfigsByLoadType(PluginLoadType.LIBS_LOADED);
            this.installPlugins(_local_15, _local_16);
            if (DEFINE.GAME_MODE == GameMode.MODE_RELEASE){
                addEventListener(AIEvent.ON_AI_LOGINED, this.runApplication);
                dispatchEvent(new AIEvent(AIEvent.ON_AI_INIT));
            } else {
                this.runApplication();
            };
            dispatchEvent(new Event(Event.INIT));
        }

        public function initialize(_arg_1:Sprite, _arg_2:Dictionary):void
        {
            if (Capabilities.isDebugger){
                callHtmlFunction("debugflash");
            };
            this.m_root = _arg_1;
            this.m_globalXML = _arg_2;
            var _local_3:AIInitClasses = (_arg_2[GLOBAL_DEF.CONFIG_CLASSES] as AIInitClasses);
            if (_local_3 == null){
                _local_3 = new AIInitClasses();
            };
            this.m_classes = _local_3;
            DisplaySystem.initialize(_local_3);
            initializeScript();
            initializeStatus();
            initializeSpecialFunc();
            initializeProperty();
            initializeTriggerEvent();
            initializeCondition();
			
            initializeExtScript();
            initializeExtTriggerEvent();
			
            var manager:DataManager = new DataManager();
            this.m_data = manager;
            manager.addEventListener(Event.INIT, this.initializeOthers);
            manager.initialize(_arg_2);
            this._checkChannel();
        }

        override public function activeContext(_arg_1:String):void
        {
            var _local_2:AIContext = this.m_contexts[_arg_1];
            if (_local_2 == null){
                warning((("名字为[" + _arg_1) + "]的Context为空"));
                return;
            };
            if (m_context == _local_2){
                warning((("名字为[" + _arg_1) + "]已经激活!"));
                return;
            };
            if (m_context != null){
                m_context.inactive();
            };
            m_context = _local_2;
            m_context.activate();
            var _local_3:AIEvent = new AIEvent(AIEvent.ON_AICONTEXT_CHANGE);
            _local_3.data = _arg_1;
            dispatchEvent(_local_3);
        }

        override public function setDefaultContext(_arg_1:AIContext):void
        {
            this.m_contexts[DEFAULT] = _arg_1;
        }

        override public function getContextByName(_arg_1:String):AIContext
        {
            return (this.m_contexts[_arg_1]);
        }

        override public function refreshWeb():void
        {
            ExternalInterface.call("window.top.location.reload");
        }

        private function checkChannel():void
        {
            var _local_1:Boolean = callHtmlFunction("isWeiduanIcon");
            var _local_2:Object = AICore.data.getFlashVar("channel");
            var _local_3:int = ((_local_2) ? int(_local_2) : (0));
            ChannelIDs.isMicroClient = ((((_local_1) || ((_local_3 == ChannelIDs._3366_link)))) || ((_local_3 == ChannelIDs.web_link)));
        }

    }
}
