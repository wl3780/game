// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_SuperArmor

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.render.BorderStyle;
    import com.tencent.ai.core.actor.model.OpSetValue;
    import com.tencent.ai.core.actor.model.ActorModel;
    import com.tencent.ai.core.actor.model.AN;
    import com.tencent.ai.core.enum.HoldFlagDef;
    import com.tencent.ai.core.actor.model.OpAttribItem;
    import  ©init._SafeStr_1290;

    public class SS_SuperArmor extends SS_SimpleSpecialStatus 
    {

        private static var _BORDER_STYLE:BorderStyle;

        private var _setHoldFlag:OpSetValue;

        public function SS_SuperArmor()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function __unexecute():void
        {
            m_target.getView().setBodyBorderStyle(_BORDER_STYLE, false);
            var _local_1:ActorModel = m_target.getModel();
            _local_1.removeOpAttribItem(this._setHoldFlag);
        }

        protected function __execute():void
        {
            if (_BORDER_STYLE == null){
                _BORDER_STYLE = new BorderStyle(1000, 0xFFFF00, 2, 12);
            };
            m_target.getView().setBodyBorderStyle(_BORDER_STYLE, true);
            this._setHoldFlag = new OpSetValue(AN.H_FLAG, HoldFlagDef.HOLD_SUPERARMOR, 0, OpAttribItem.PRIORITY_MIDDLE);
            var _local_1:ActorModel = m_target.getModel();
            _local_1.addOpAttribItem(this._setHoldFlag);
        }

        public /*  ©init. */ function _SafeStr_1290()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1290 = " SS_SuperArmor" (String#14708)


