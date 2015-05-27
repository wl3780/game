// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.monster.actions.SimpleIDELAction

package com.tencent.ai.core.monster.actions
{
    import com.tencent.ai.core.action.DynamicAction;
    import com.tencent.ai.core.enum.BaseActionIDDef;
    import  ©init._SafeStr_688;

    public class SimpleIDELAction extends DynamicAction 
    {

        public function SimpleIDELAction()
        {
            super(BaseActionIDDef.IDLE);
        }

        override public function exec(_arg_1:int, _arg_2:Object=null):void
        {
            if (!m_flag){
                m_flag = true;
                super.exec(_arg_1, _arg_2);
                activeAction();
            };
            if (_arg_1 != -1){
                nextAction(_arg_1, _arg_2);
            };
        }

        public /*  ©init. */ function _SafeStr_688()
        {
        }


    }
}//package com.tencent.ai.core.monster.actions

// _SafeStr_688 = " SimpleIDELAction" (String#13730)


