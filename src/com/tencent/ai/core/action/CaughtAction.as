// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.action.CaughtAction

package com.tencent.ai.core.action
{
    import com.tencent.ai.core.action.hurt.BaseHurtAction;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import com.tencent.ai.core.actor.IActorView;
    import com.tencent.ai.core.enum.VKeyDef;
    import com.tencent.ai.core.enum.MotionDef;
    import com.tencent.ai.core.data.AttackInfo;
    import com.tencent.ai.core.enum.AttackType;
    import com.tencent.ai.core.actor.IElementController;
    import  ©init._SafeStr_19;

    public class CaughtAction extends BaseHurtAction 
    {

        public function CaughtAction()
        {
            super(BaseActionIDDef.CAUGHT);
        }

        override protected function inactvieAction():void
        {
            if ((m_view is IActorView)){
                IActorView(m_view).setHeadVisible(true);
            };
            super.inactvieAction();
        }

        override protected function activeAction(_arg_1:int, _arg_2:Object):void
        {
            super.activeAction(_arg_1, _arg_2);
            m_target.stopMove();
            m_target.stopJump();
            if (m_target.getIsDead()){
                nextAction(VKeyDef.DEAD);
            } else {
                if ((m_view is IActorView)){
                    IActorView(m_view).setHeadVisible(false);
                };
                m_view.setMotionID(MotionDef.MT_CAUGHT);
                m_view.gotoAndStop(2);
            };
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            m_target.acceptDmg((_arg_2 as AttackInfo));
            super.exec(_arg_1, _arg_2);
        }

        override public function switchToDead():Boolean
        {
            return (false);
        }

        override public function handleHurt(_arg_1:IElementController, _arg_2:AttackInfo):Boolean
        {
            if (_arg_2.attackType == AttackType.ATTACK_THROW){
                if (m_model.isDead){
                    _arg_1.actHurtAction(BaseActionIDDef.DEAD, VKeyDef.DEAD, _arg_2);
                } else {
                    _arg_1.actHurtAction(BaseActionIDDef.BETHROWN, VKeyDef.BETHROWN, _arg_2);
                };
            } else {
                _arg_1.actHurtAction(BaseActionIDDef.CAUGHT, VKeyDef.CAUGHT, _arg_2);
            };
            return (true);
        }

        public /*  ©init. */ function _SafeStr_19()
        {
        }


    }
}//package com.tencent.ai.core.action

// _SafeStr_19 = " CaughtAction" (String#16511)


