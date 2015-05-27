// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.effect.impl.EffectManager

package com.tencent.ai.core.effect.impl
{
    import flash.events.EventDispatcher;
    import com.tencent.ai.core.effect.IEffectManager;
    import com.tencent.ai.core.manager.data.IDataManager;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.data.EffectStaticInfo;
    import com.tencent.ai.core.effect.EffectAsset;
    import com.tencent.free.core.manager.task.Priority;
    import com.tencent.ai.core.effect.IEffectElementManager;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.effect.EffectElement;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.element.BaseElement;
    import com.tencent.ai.core.enum.SceneLayerDef;

    public class EffectManager extends EventDispatcher implements IEffectManager 
    {

        private static var _INSTANCE:EffectManager;

        protected var m_data:IDataManager;
        protected var m_effectAssetsCache:Dictionary;
        protected var m_eElementManagers:Array;
        protected var m_current_scene:IScene;


        public static function getInstance():EffectManager
        {
            if (_INSTANCE == null){
                _INSTANCE = new (EffectManager)();
            };
            return (_INSTANCE);
        }


        public function initialize(_arg_1:Object=null):void
        {
            this.m_data = AICore.data;
            this.m_effectAssetsCache = new Dictionary();
            this.m_eElementManagers = [];
            this.m_eElementManagers[EffectType.RENDER_EFFECT] = new RenderElementManager(this);
            this.m_eElementManagers[EffectType.IMAGE_EFFECT] = new ImageEffectManager(this);
            this.m_eElementManagers[EffectType.PARTICLE_EFFECT] = new ParticleElementManager(this);
            this.m_eElementManagers[EffectType.PARTICLE_EMITTER] = new ParticleEmitterManager(this);
            this.m_eElementManagers[EffectType.PARTICLE_RENDER_EFFECT] = new RenderParticleEffertManager(this);
            this.m_eElementManagers[EffectType.PARTICLE_IMAGE_EFFECT] = new ImageParticleEffectManager(this);
            this.m_eElementManagers[EffectType.THUNDER_CHAIN_EFFECT] = new ThunderEffectManager(this);
        }

        public function getEffectAssets(_arg_1:int):Array
        {
            var _local_6:EffectStaticInfo;
            var _local_2:Array = this.m_data.getEffectStaticInfos();
            var _local_3:Array = [];
            var _local_4:int = _local_2.length;
            var _local_5:int;
            while (_local_5 < _local_4) {
                _local_6 = _local_2[_local_5];
                if (_local_6.loadType == _arg_1){
                    _local_3.push(this.getEffectAsset(_local_6.id, this));
                };
                _local_5++;
            };
            return (_local_3);
        }

        public function getEffectAsset(_arg_1:int, _arg_2:Object=null):EffectAsset
        {
            var _local_4:EffectStaticInfo;
            var _local_3:EffectAsset = this.m_effectAssetsCache[_arg_1];
            if (_local_3 == null){
                _local_4 = this.m_data.getEffectInfo(_arg_1);
                if (_local_4 == null){
                    return (null);
                };
                _local_3 = new EffectAsset(_local_4);
                _local_3.priority = Priority.PERIORITY_NORMAL_EFFECT;
                this.m_effectAssetsCache[_arg_1] = _local_3;
            };
            if (_arg_2 != null){
                _local_3.addRef(_arg_2);
            };
            return (_local_3);
        }

        public function returnEffectAsset(_arg_1:EffectAsset, _arg_2:Object=null):void
        {
            if (_arg_2 != null){
                _arg_1.removeRef(_arg_2);
                if (_arg_1.getRefsLen() == 0){
                    delete this.m_effectAssetsCache[_arg_1.id];
                    _arg_1.unload();
                };
            };
        }

        public function bindScene(_arg_1:IScene):void
        {
            this.m_current_scene = _arg_1;
            this.m_current_scene.registerFactory(this);
        }

        public function unbind():void
        {
            var _local_1:int;
            var _local_2:int;
            var _local_3:IEffectElementManager;
            if (this.m_eElementManagers){
                _local_1 = this.m_eElementManagers.length;
                _local_2 = 0;
                while (_local_2 < _local_1) {
                    _local_3 = this.m_eElementManagers[_local_2];
                    if (_local_3 != null){
                        _local_3.clear();
                    };
                    _local_2++;
                };
            };
            if (this.m_current_scene){
                this.m_current_scene.unRegisterFactory(this.getElementType());
                this.m_current_scene = null;
            };
        }

        public function getElementType():String
        {
            return (ElementType.ET_EFFECT);
        }

        public function createElement(_arg_1:Object=null):BaseElement
        {
            var _local_3:EffectElement;
            var _local_4:IEffectElementManager;
            var _local_2:EffectInfo = (_arg_1 as EffectInfo);
            if (_local_2 != null){
                _local_4 = this.m_eElementManagers[_local_2.effectType];
                _local_3 = _local_4.createElement(_local_2);
            };
            return (_local_3);
        }

        public function destoryElement(_arg_1:BaseElement):void
        {
            var _local_3:IEffectElementManager;
            var _local_2:EffectElement = (_arg_1 as EffectElement);
            if (_local_2 != null){
                _local_3 = this.m_eElementManagers[_local_2.effectType];
                _local_3.destoryElement(_local_2);
            };
        }

        public function getDefaultLayerID():int
        {
            return (SceneLayerDef.LAYER_GROUND);
        }


    }
}//package com.tencent.ai.core.effect.impl

