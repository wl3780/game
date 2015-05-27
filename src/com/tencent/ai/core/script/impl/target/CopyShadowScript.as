// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.script.impl.target.CopyShadowScript

package com.tencent.ai.core.script.impl.target
{
    import com.tencent.ai.core.script.IScript;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.script.ITarget;
    import com.tencent.ai.core.data.EffectInfo;
    import flash.utils.Dictionary;
    import com.tencent.ai.core.data.arg.script.CopyShadowScriptArg;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.render.ILayerRender;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.data.arg.ImageEffectArg;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import  ©init._SafeStr_1216;

    public class CopyShadowScript implements IScript, IFrameListener 
    {

        protected var m_target:ITarget;
        protected var m_effectInfo:EffectInfo;
        protected var m_isWorking:Boolean;
        protected var m_copyShadowArgs:Dictionary;
        protected var m_startFrame:int;
        protected var m_currentInterval:int;
        protected var m_cDuration:int;
        protected var m_cInterval:int;
        protected var m_maxCounts:int;
        protected var m_scriptArg:CopyShadowScriptArg;
        protected var m_actor:BaseActor;
        protected var m_view:IActorView;
        protected var m_source:ILayerRender;
        protected var m_scene:IScene;

        public function CopyShadowScript()
        {
            this.m_effectInfo = new EffectInfo();
            this.m_effectInfo.effectType = EffectType.IMAGE_EFFECT;
            this.m_isWorking = false;
        }

        public function setTarget(_arg_1:Object):void
        {
            this.m_target = ITarget(_arg_1);
        }

        public function getTarget():Object
        {
            return (this.m_target);
        }

        protected function createOne():void
        {
            var _local_2:ImageEffectArg;
            var _local_1:String = ((this.m_view.getMotionID() + "_") + this.m_view.currentFrameIndex);
            _local_2 = this.m_copyShadowArgs[_local_1];
            if (_local_2 == null){
                _local_2 = new ImageEffectArg();
                _local_2.finishGC = false;
                _local_2.dAlpha = this.m_scriptArg.alpha;
                _local_2.duration = this.m_scriptArg.duration;
                _local_2.copyColor = this.m_scriptArg.colorTransform;
                _local_2.scale = this.m_scriptArg.scale;
                _local_2.copyingImg(this.m_source);
                _local_2.imgLocalX = this.m_source.x;
                _local_2.imgLocalY = this.m_source.y;
                this.m_copyShadowArgs[_local_1] = _local_2;
            };
            var _local_3:MapPosition = this.m_actor.getMapPosition();
            _local_3.z--;
            this.m_effectInfo.location = _local_3;
            this.m_effectInfo.direction = this.m_actor.getDirection();
            this.m_effectInfo.ref = this;
            this.m_effectInfo.maxCount = this.m_maxCounts;
            this.m_effectInfo.otherArg = _local_2;
            this.m_scene.createElement(ElementType.ET_EFFECT, this.m_effectInfo);
        }

        public function imgEffectsDisappear():void
        {
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_startFrame++;
            this.m_currentInterval--;
            if (this.m_startFrame >= this.m_cDuration){
                this.m_target.removeLastRs(this);
                this.stop();
            } else {
                if (this.m_currentInterval <= 0){
                    this.m_currentInterval = this.m_cInterval;
                    this.createOne();
                };
            };
        }

        public function exec(_arg_1:String, _arg_2:Object):void
        {
            if (!this.m_isWorking){
                this.m_isWorking = true;
                this.m_scriptArg = (_arg_2 as CopyShadowScriptArg);
                this.m_cDuration = this.m_scriptArg.cDuration;
                this.m_cInterval = this.m_scriptArg.cInterval;
                this.m_maxCounts = this.m_scriptArg.maxCounts;
                this.m_actor = (this.m_target.target as BaseActor);
                this.m_view = this.m_actor.getActorView();
                this.m_source = this.m_view.getBody().getMainLayer();
                this.m_scene = this.m_target.scene;
                this.m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
                this.m_startFrame = 0;
                this.m_currentInterval = this.m_cInterval;
                if (this.m_copyShadowArgs == null){
                    this.m_copyShadowArgs = new Dictionary();
                };
                this.createOne();
                this.m_target.addLastRS(this);
            };
        }

        public function stop():void
        {
            var _local_1:ImageEffectArg;
            this.m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
            if (this.m_copyShadowArgs != null){
                for each (_local_1 in this.m_copyShadowArgs) {
                    _local_1.finishGC = true;
                    _local_1.disposeImg(null);
                };
                this.m_copyShadowArgs = null;
            };
            this.m_isWorking = false;
            this.m_cDuration = 0;
            this.m_cInterval = 0;
            this.m_startFrame = 0;
            this.m_currentInterval = 0;
            this.m_maxCounts = 0;
            this.m_actor = null;
            this.m_view = null;
            this.m_source = null;
            this.m_scene = null;
        }

        public function getCmds():Object
        {
            return (ScriptCmdDef.SC_COPY_SHADOW);
        }

        public /*  ©init. */ function _SafeStr_1216()
        {
        }


    }
}//package com.tencent.ai.core.script.impl.target

// _SafeStr_1216 = " CopyShadowScript" (String#14600)


