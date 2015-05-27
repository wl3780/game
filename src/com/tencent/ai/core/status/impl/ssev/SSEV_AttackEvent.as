// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssev.SSEV_AttackEvent

package com.tencent.ai.core.status.impl.ssev
{
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.events.ElementEvent;
    import com.tencent.ai.core.data.StatusEventInfo;
    import com.tencent.ai.core.actor.BaseActor;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.data.SkillInfo;
    import  ©init._SafeStr_1270;

    public class SSEV_AttackEvent extends SSEV_Base 
    {

        private var p:Number = 1;
        private var actionsStr:String;
        private var rtParam:Object;


        override public function initialize(_arg_1:StatusEventInfo):void
        {
            super.initialize(_arg_1);
            var _local_2:Array = _arg_1.triggerEventInfo.args;
            this.p = (((((_local_2 == null)) || ((_local_2.length == 0)))) ? 1 : DEFINE.CAST_FLOAT(int(_local_2[0])));
            this.actionsStr = (((((((_local_2 == null)) || ((_local_2.length < 2)))) || ((_local_2[1] == "")))) ? "" : (("," + _local_2[1]) + ","));
            m_target.addEventListener(ElementEvent.ON_BEFORE_ATTACK, this.onBeforeAttack);
        }

        private function onBeforeAttack(_arg_1:ElementEvent):void
        {
            var _local_3:BaseActor;
            var _local_4:AttackInfo;
            var _local_5:SkillInfo;
            if ((((this.p < 1)) && ((DEFINE.RANDOM_FLOAT() > this.p)))){
                return;
            };
            var _local_2:Object = _arg_1.data;
            if (_local_2 != null){
                _local_3 = _arg_1.data.hurtActor;
                _local_4 = _arg_1.data.attackInfo;
                if (this.actionsStr != ""){
                    _local_5 = _local_4.skillInfo;
                    if ((((_local_5 == null)) || ((this.actionsStr.indexOf((("," + _local_5.actionID) + ",")) == -1)))){
                        return;
                    };
                };
                if (this.rtParam == null){
                    this.rtParam = {};
                };
                this.rtParam.aimActor = _local_3;
                m_status.setRTParams(this.rtParam);
            } else {
                if (this.actionsStr != ""){
                    return;
                };
            };
            executeSSEffects();
        }

        override public function finalize():void
        {
            this.rtParam = null;
            m_target.removeEventListener(ElementEvent.ON_BEFORE_ATTACK, this.onBeforeAttack);
            super.finalize();
        }

        public /*  ©init. */ function _SafeStr_1270()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssev

// _SafeStr_1270 = " SSEV_AttackEvent" (String#14627)


