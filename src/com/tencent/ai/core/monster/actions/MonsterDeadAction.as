// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.actions.MonsterDeadAction

package com.tencent.ai.core.monster.actions
{
    import com.tencent.ai.core.action.DeadAction;
    import com.tencent.ai.core.render.IFrameListener;
    import com.tencent.ai.core.data.arg.script.CColorScriptArg;
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.monster.BaseMonster;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.enum.HurtColorStyle;
    import com.tencent.ai.core.enum.ScriptCmdDef;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.enum.MonsterDeadReason;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.data.arg.ParticleEffectArg;
    import com.tencent.ai.core.events.MonsterModelEvent;
    import com.tencent.ai.core.data.MonsterInfo;
    import com.tencent.ai.core.enum.CommonValueDef;
    import com.tencent.ai.core.enum.EffectType;
    import com.tencent.ai.core.enum.ElementType;
    import flash.events.Event;
    import com.tencent.ai.core.exec_behind_frame;
    import  ©init._SafeStr_687;

    public class MonsterDeadAction extends DeadAction implements IFrameListener 
    {

        public static var _WHITEArg:CColorScriptArg;

        protected var m_vanishHandler:CFunction;
        protected var m_whiteArg:CColorScriptArg;
        protected var m_lieTimes:int;
        protected var m_monster:BaseMonster;
        protected var m_seInfo:EffectInfo;

        public function MonsterDeadAction()
        {
            this.m_vanishHandler = new CFunction(this.vanishNow, this);
            if (_WHITEArg == null){
                _WHITEArg = new CColorScriptArg(HurtColorStyle.WHITE_3);
                _WHITEArg.addDefaultStyle();
                _WHITEArg.times = int.MAX_VALUE;
                _WHITEArg.itvTimes = 3;
            };
            this.m_whiteArg = _WHITEArg;
            this.m_seInfo = new EffectInfo();
        }

        override public function attach(_arg_1:Object):void
        {
            super.attach(_arg_1);
            this.m_monster = BaseMonster(m_target);
        }

        override protected function gotoHell():void
        {
            this.m_lieTimes = 9;
            m_target.onScript(ScriptCmdDef.SC_TARGET_CCOLOR, this.m_whiteArg);
            m_view.addFrameListener(MotionDef.L_ENTER_FRAME, this);
            m_target.sendServerDead(MonsterDeadReason.BEAT_MONSTER_KILL);
        }

        protected function vanishNow(_arg_1:Event=null):void
        {
            var _local_5:MapPosition;
            var _local_6:ParticleEffectArg;
            if (_arg_1 != null){
                m_model.removeEventListener(MonsterModelEvent.ON_SERVER_DEAD, this.vanishNow);
            };
            var _local_2:MonsterInfo = this.m_monster.getMonsterInfo();
            var _local_3:int = _local_2.staticInfo.deadEID;
            var _local_4:Object = CommonValueDef.DEF_EFFECT_ARGS[_local_3];
            if (_local_4 != null){
                _local_5 = m_target.getMapPosition();
                _local_6 = _local_4.arg;
                _local_5.y = 20;
                this.m_seInfo.eid = _local_6.iconEffectId;
                this.m_seInfo.effectType = _local_4.effectType;
                this.m_seInfo.tingeInfo = _local_4.tingeInfo;
                this.m_seInfo.adjustColorInfo = _local_4.adjustColorInfo;
                if (this.m_seInfo.effectType == EffectType.PARTICLE_EFFECT){
                    this.m_seInfo.otherArg = _local_6.clone();
                };
                this.m_seInfo.location = _local_5;
                scene.createElement(ElementType.ET_EFFECT, this.m_seInfo);
            };
            m_scene.destoryElement(m_target);
        }

        public function onFrameEvent(_arg_1:String):void
        {
            this.m_lieTimes--;
            if (this.m_lieTimes <= 0){
                m_view.removeFrameListener(MotionDef.L_ENTER_FRAME, this);
                if (this.m_monster.getIsServerDead()){
                    exec_behind_frame(this.m_vanishHandler);
                } else {
                    m_model.addEventListener(MonsterModelEvent.ON_SERVER_DEAD, this.vanishNow);
                };
            };
        }

        public /*  ©init. */ function _SafeStr_687()
        {
        }


    }
}//package com.tencent.ai.core.monster.actions

// _SafeStr_687 = " MonsterDeadAction" (String#14030)


