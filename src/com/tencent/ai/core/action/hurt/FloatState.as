// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.hurt.FloatState

package com.tencent.ai.core.action.hurt
{
    import com.tencent.free.utils.CFunction;
    import com.tencent.ai.core.data.EffectInfo;
    import com.tencent.ai.core.events.ActorModelEvent;
    import com.tencent.ai.core.data.MapPosition;
    import com.tencent.ai.core.scene.IScene;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.enum.ElementType;
    import com.tencent.ai.core.enum.SoundDef;
    import com.tencent.ai.core.AICore;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.components.arg.PosArg;
    import com.tencent.ai.core.data.SkillInfo;
    import com.tencent.ai.core.data.AttackInfo;
    import  ©init._SafeStr_10;

    public class FloatState extends HurtState 
    {

        protected var m_downEndFunc:CFunction;
        protected var m_floatStep:int = 0;
        protected var m_landEffectInfo:EffectInfo;
        protected var m_floatEvent:ActorModelEvent;

        public function FloatState(_arg_1:IAcceptHurtAction)
        {
            this.m_downEndFunc = new CFunction(this.onBeatDownEnd, this);
            super(_arg_1);
            this.m_floatEvent = new ActorModelEvent(ActorModelEvent.ON_ACTIONSTATE_FLOAT);
        }

        protected function createDust(_arg_1:int):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:MapPosition;
            var _local_6:IScene;
            var _local_7:int;
            if (_arg_1 == 0){
                return;
            };
            var _local_2:int = m_environmentInfo.dustEffectID;
            if (_local_2 != 0){
                this.m_landEffectInfo.eid = _local_2;
                _local_3 = m_target.mapX;
                _local_4 = m_target.mapZ;
                _local_5 = this.m_landEffectInfo.location;
                _local_6 = m_action.scene;
                _local_7 = 0;
                while (_local_7 < _arg_1) {
                    _local_5.x = ((_local_3 + int((110 * DEFINE.RANDOM_FLOAT()))) - 55);
                    _local_5.z = ((_local_4 + int((4 * DEFINE.RANDOM_FLOAT()))) - 2);
                    _local_6.createElement(ElementType.ET_EFFECT, this.m_landEffectInfo);
                    _local_7++;
                };
            };
            if (SoundDef.LAND_SOUND_ID != 0){
                AICore.sound.play(SoundDef.LAND_SOUND_ID, -1, 0, 100, 0, m_target);
            };
        }

        protected function onBeatDownEnd():void
        {
            var _local_1:int;
            if (this.m_landEffectInfo == null){
                this.m_landEffectInfo = new EffectInfo();
                this.m_landEffectInfo.location = new MapPosition();
            };
            if (m_model.reboundFlag == 0){
                m_model.reboundFlag = 1;
                _local_1 = m_target.getGravityComponent().getLatestV();
                _local_1 = (0 - (_local_1 * DEFINE.RANDOM_REBOUND_Q()));
                this.floatTarget(_local_1, 0, 0, -1);
                this.createDust((1 + int((DEFINE.RANDOM_FLOAT() * 3))));
            } else {
                this.createDust(int((DEFINE.RANDOM_FLOAT() * 2)));
                this.m_floatStep = 0;
                m_action.onNextState(HurtState.LIE, null);
            };
        }

        protected function floatTarget(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):void
        {
            var _local_6:int;
            var _local_7:int;
            m_view.setMotionID(MotionDef.MT_BEHURT_DOWN);
            if (_arg_4 < 0){
                m_view.gotoAndPlay(3);
            } else {
                if ((((_arg_4 > 0)) || ((m_model.reboundFlag == 1)))){
                    m_view.gotoAndPlay(2);
                };
            };
            m_target.jump(_arg_1, this.m_downEndFunc);
            this.m_floatStep = (((_arg_1 > 0)) ? (1) : -1);
            var _local_5:int = (_arg_2 - (m_model.weight * DEFINE.G_WQX));
            if (_local_5 > 0){
                _local_6 = ((_local_5 * _arg_3) * -1);
                _local_7 = (m_action.environmentInfo.friction * _arg_3);
                m_target.slip(PosArg.DIR_X, _local_6, _local_7);
            } else {
                m_target.stopMove();
            };
        }

        override public function accept(_arg_1:AttackInfo):int
        {
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            if (this.m_floatStep == 0){
                initParams();
                if (m_model.firstFloatHP == -1){
                    _local_8 = m_model.hp;
                    m_model.firstFloatHP = (((_local_8 <= 0)) ? 1 : _local_8);
                };
                m_target.getModel().dispatchEvent(this.m_floatEvent);
            } else {
                if (((!((_arg_1 == null))) && (m_model.openProtected))){
                    _local_9 = _arg_1.dmgValue;
                    m_model.updateFloatProtected(_local_9);
                    if (m_model.reboundFlag == 1){
                        m_model.updateLandProtected(_local_9);
                    };
                };
            };
            var _local_2:int = m_target.mapY;
            var _local_3:SkillInfo;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            if (_arg_1 != null){
                _local_3 = _arg_1.skillInfo;
                _local_7 = _arg_1.dir;
                _local_5 = _local_3.randomDY;
                if (m_model.reboundFlag != 0){
                    _local_4 = ((_local_3.powerY + int((_local_5 * DEFINE.RANDOM_FLOAT()))) * DEFINE.RANDOM_REBOUND_Q());
                } else {
                    _local_4 = ((((_local_2 > 0)) ? _local_3.powerY2 : _local_3.powerY) + int((_local_5 * DEFINE.RANDOM_FLOAT())));
                };
            } else {
                _local_4 = m_target.getGravityComponent().getCurrentV();
            };
            if (_local_4 != 0){
                _local_10 = (m_model.weight * DEFINE.G_WQY);
                _local_6 = ((_local_4 * m_model.beHurtFloat) - _local_10);
                if ((((_local_10 > 1000)) && ((_local_6 < 1073736824)))){
                    _local_6 = 1073736824;
                };
            };
            if ((((_local_2 == 0)) && ((_local_6 <= 0)))){
                m_action.onNextState(HurtState.LIE, _arg_1);
            } else {
                _local_11 = (((_local_3)!=null) ? (((_local_2 > 0)) ? _local_3.powerX2 : _local_3.powerX) : 0);
                this.floatTarget(_local_6, _local_11, _local_7, _local_2);
                setFreezTimes(_local_3);
            };
            return (HurtState.NULL);
        }

        override public function end():void
        {
            if (this.m_floatStep != 0){
                m_target.stopMove();
                m_target.stopJump();
                this.m_floatStep = 0;
            };
            super.end();
        }

        public /*  ©init. */ function _SafeStr_10()
        {
        }


    }
}//package com.tencent.ai.core.action.hurt

// _SafeStr_10 = " FloatState" (String#14441)


