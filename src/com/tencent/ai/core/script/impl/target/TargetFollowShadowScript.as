// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.TargetFollowShadowScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.render.ILayerRender;
    import com.tencent.ai.core.scene.IScene;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.data.arg.ImageEffectArg;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.data.arg.script.FollowShadowArg;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1236;

    public class TargetFollowShadowScript implements IScript 
    {

        protected var m_target:ITarget;
        protected var m_actor:BaseActor;
        protected var m_view:IActorView;
        protected var m_source:ILayerRender;
        protected var m_scene:IScene;
        protected var m_followShadowArgs:Dictionary;
        protected var m_effectInfo:EffectInfo;
        protected var m_listenStop:Boolean;

        public function TargetFollowShadowScript()
        {
            this.m_effectInfo = new EffectInfo();
            this.m_effectInfo.effectType = EffectType.IMAGE_EFFECT;
            this.m_listenStop = false;
        }

        protected function createFollowShadow(_arg_1:FollowShadowArg):void
        {
            var _local_2:String;
            var _local_3:ImageEffectArg;
            _local_2 = ((this.m_view.getMotionID() + "_") + this.m_view.currentFrameIndex);
            _local_3 = this.m_followShadowArgs[_local_2];
            if (_local_3 == null){
                _local_3 = new ImageEffectArg();
                _local_3.finishGC = false;
                _local_3.scale = _arg_1.scale;
                _local_3.dAlpha = _arg_1.dAlpha;
                _local_3.dScale = _arg_1.dScale;
                _local_3.duration = _arg_1.duration;
                _local_3.copyColor = _arg_1.colorTransform;
                _local_3.copyingImg(this.m_source);
                _local_3.imgLocalX = this.m_source.x;
                _local_3.imgLocalY = this.m_source.y;
                this.m_followShadowArgs[_local_2] = _local_3;
            };
            this.m_effectInfo.location = new MapPosition(0, -1, 0, 0);
            this.m_effectInfo.direction = this.m_actor.getDirection();
            this.m_effectInfo.ref = this;
            this.m_effectInfo.otherArg = _local_3;
            this.m_view.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        public function imgEffectsDisappear():void
        {
            if (this.m_listenStop){
                this.m_target.removeLastRs(this);
                this.stop();
            };
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (this.m_scene == null){
                this.m_actor = (this.m_target.target as BaseActor);
                this.m_view = this.m_actor.getActorView();
                this.m_source = this.m_view.getBody().getMainLayer();
                this.m_scene = this.m_target.scene;
            };
            if (this.m_followShadowArgs == null){
                this.m_followShadowArgs = new Dictionary();
            };
            this.createFollowShadow((_arg_2 as FollowShadowArg));
            if (!this.m_listenStop){
                this.m_listenStop = true;
                this.m_target.addLastRS(this);
            };
        }

        public function stop():void
        {
            var _local_1:ImageEffectArg;
            this.m_listenStop = false;
            if (this.m_followShadowArgs != null){
                for each (_local_1 in this.m_followShadowArgs) {
                    _local_1.finishGC = true;
                    _local_1.disposeImg(null);
                };
                this.m_followShadowArgs = null;
            };
            this.m_actor = null;
            this.m_view = null;
            this.m_source = null;
            this.m_scene = null;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_TARGET_FOLLOW_SHADOW);
        }

        public /*  ©init. */ function _SafeStr_1236()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1236 = " TargetFollowShadowScript" (String#16547)


