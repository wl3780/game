package com.tencent.ai.core
{
    import com.tencent.ai.core.bubble.IBubbleManager;
    import com.tencent.ai.core.combat.ICombatSystem;
    import com.tencent.ai.core.context.AIContext;
    import com.tencent.ai.core.crypto.ICryptoManager;
    import com.tencent.ai.core.dialog.IDialogManager;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.enum.AIContextType;
    import com.tencent.ai.core.events.EventDispatcher2;
    import com.tencent.ai.core.extension.IControlBar;
    import com.tencent.ai.core.guideSystem.IGuideSystemManager;
    import com.tencent.ai.core.interact.IInteractItemSystem;
    import com.tencent.ai.core.manager.data.IDataManager;
    import com.tencent.ai.core.mission.IMissionManager;
    import com.tencent.ai.core.monster.IMonsterSystem;
    import com.tencent.ai.core.movie.IMovieManager;
    import com.tencent.ai.core.net.INetwork;
    import com.tencent.ai.core.npc.INpcSystem;
    import com.tencent.ai.core.pet.IPetSystem;
    import com.tencent.ai.core.player.IPlayerSystem;
    import com.tencent.ai.core.plot.IPlotSystem;
    import com.tencent.ai.core.protect.IProtectModule;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.script.IScriptManager;
    import com.tencent.ai.core.sound.ISoundManager;
    import com.tencent.free.Free;
    import com.tencent.free.core.cmd.BaseCommand;
    import com.tencent.free.core.cmd.ICmdListener;
    
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.external.ExternalInterface;

    public class AICore extends EventDispatcher 
    {

        public static var controlBar:IControlBar;
        
		private static var _RUNTIME:AICore;

        protected var m_free:Free;
        protected var m_net:INetwork;
        protected var m_data:IDataManager;
        protected var m_player_sys:IPlayerSystem;
        protected var m_npc_sys:INpcSystem;
        protected var m_monster_sys:IMonsterSystem;
        protected var m_pet_sys:IPetSystem;
        protected var m_interactItem_sys:IInteractItemSystem;
        protected var m_combat_sys:ICombatSystem;
        protected var m_effect:IEffectManager;
        protected var m_bubble:IBubbleManager;
        protected var m_movie:IMovieManager;
        protected var m_dialog:IDialogManager;
        protected var m_script:IScriptManager;
        protected var m_sound:ISoundManager;
        protected var m_mission:IMissionManager;
        protected var m_plot:IPlotSystem;
        protected var m_guideSystem:IGuideSystemManager;
        protected var m_cryptoManager:ICryptoManager;
        protected var m_protectModule:IProtectModule;
        protected var m_actorDispatcher:IEventDispatcher;
        protected var m_root:Sprite;
        protected var m_context:AIContext;
        protected var m_current_scene:IScene;

        public function AICore()
        {
            super();
            this.m_actorDispatcher = new EventDispatcher2();
        }

        protected static function setRuntime(runtime:AICore):void
        {
            if (_RUNTIME == null) {
                _RUNTIME = runtime;
            }
        }

        public static function get net():INetwork
        {
            return _RUNTIME.m_net;
        }

        public static function get data():IDataManager
        {
            return _RUNTIME.m_data;
        }

        public static function get effect():IEffectManager
        {
            return _RUNTIME.m_effect;
        }

        public static function get bubble():IBubbleManager
        {
            return _RUNTIME.m_bubble;
        }

        public static function get movie():IMovieManager
        {
            return _RUNTIME.m_movie;
        }

        public static function get dialog():IDialogManager
        {
            return _RUNTIME.m_dialog;
        }

        public static function get sound():ISoundManager
        {
            return _RUNTIME.m_sound;
        }

        public static function get script():IScriptManager
        {
            return _RUNTIME.m_script;
        }

        public static function get mission():IMissionManager
        {
            return _RUNTIME.m_mission;
        }

        public static function get playerSystem():IPlayerSystem
        {
            return _RUNTIME.m_player_sys;
        }

        public static function get npcSystem():INpcSystem
        {
            return _RUNTIME.m_npc_sys;
        }

        public static function get monsterSystem():IMonsterSystem
        {
            return _RUNTIME.m_monster_sys;
        }

        public static function get petSystem():IPetSystem
        {
            return _RUNTIME.m_pet_sys;
        }

        public static function get actorDispatcher():IEventDispatcher
        {
            return _RUNTIME.m_actorDispatcher;
        }

        public static function get interactItemSystem():IInteractItemSystem
        {
            return _RUNTIME.m_interactItem_sys;
        }

        public static function get plotSystem():IPlotSystem
        {
            return _RUNTIME.m_plot;
        }

        public static function get combatSystem():ICombatSystem
        {
            return _RUNTIME.m_combat_sys;
        }

        public static function get guideSystem():IGuideSystemManager
        {
            return _RUNTIME.m_guideSystem;
        }

        public static function get cryptoManager():ICryptoManager
        {
            return _RUNTIME.m_cryptoManager;
        }

        public static function get protectModule():IProtectModule
        {
            return _RUNTIME.m_protectModule;
        }

        public static function get Runtime():AICore
        {
            return _RUNTIME;
        }

        public static function get free():Free
        {
            return _RUNTIME.m_free;
        }

        public static function dispatchAIEvent(evt:Event):void
        {
            _RUNTIME.dispatchEvent(evt);
        }

        public static function addAIEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
        {
            _RUNTIME.addEventListener(type, listener, useCapture, priority, useWeakReference);
        }

        public static function removeAIEventListener(type:String, listener:Function, useCapture:Boolean=false):void
        {
            _RUNTIME.removeEventListener(type, listener, useCapture);
        }

        public static function isCombatContext():Boolean
        {
            var _local_1:String = _RUNTIME.m_context.getType();
            return ((((((_local_1 == AIContextType.CT_DUPLICATE)) || ((_local_1 == AIContextType.CT_PVP)))) || ((_local_1 == AIContextType.CT_EXTDUP))));
        }

        public static function registerCmd(cmd:String, handler:ICmdListener):void
        {
            free.registerCmd(cmd, handler);
        }

        public static function hasCmd(cmd:String):Boolean
        {
            return free.hasCmd(cmd);
        }

        public static function unregisterCmd(cmd:String):void
        {
            free.unregisterCmd(cmd);
        }

        public static function cmdCall(cmd:String, args:Object=null):void
        {
            free.call(cmd, args);
        }

        public static function callCommand(command:BaseCommand):void
        {
            free.callCommand(command);
        }

        public static function callHtmlFunction(_arg_1:String, ... args)
        {
            var ret:*;
            args.unshift("swfCall." + _arg_1);
            if (ExternalInterface.available) {
                ret = ExternalInterface.call.apply(null, args);
            }
            return ret;
        }


        public function bindScene(scene:IScene):void
        {
            this.m_current_scene = scene;
            if (this.m_effect != null) {
                this.m_effect.bindScene(scene);
            }
            if (this.m_bubble != null) {
                this.m_bubble.bindScene(scene);
            }
        }

        public function unbind():void
        {
            if (this.m_effect != null) {
                this.m_effect.unbind();
            }
            if (this.m_bubble != null) {
                this.m_bubble.unbind();
            }
            this.m_current_scene = null;
        }

        public function setDefaultContext(context:AIContext):void
        {
        }

        public function get root():Sprite
        {
            return this.m_root;
        }

        public function get currentContext():AIContext
        {
            return this.m_context;
        }

        public function get currentScene():IScene
        {
            return this.m_current_scene;
        }

        public function isAtContext(type:String):Boolean
        {
            if (this.m_context == null) {
                return false;
            }
            return this.m_context.getType() == type;
        }

        public function activeContext(type:String):void
        {
        }

        public function getContextByName(pName:String):AIContext
        {
            return null;
        }

        public function refreshWeb():void
        {
        }

    }
}
