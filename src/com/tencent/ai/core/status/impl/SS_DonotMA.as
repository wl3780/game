// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_DonotMA

package com.tencent.ai.core.status.impl
{
    import  ©init._SafeStr_1279;

    public class SS_DonotMA extends SS_DonotMove 
    {


        override protected function __unexecute():void
        {
            m_target.getController().setCanAct(true);
            super.__unexecute();
        }

        override protected function __execute():void
        {
            super.__execute();
            m_target.getController().setCanAct(false);
        }

        public /*  ©init. */ function _SafeStr_1279()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1279 = " SS_DonotMA" (String#14180)


