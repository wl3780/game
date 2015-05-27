// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_Petrifaction

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.render.AdjustColorStyle;
    import  ©init._SafeStr_1284;

    public class SS_Petrifaction extends SS_Captive 
    {

        private static var _ADJUST_STYLE:AdjustColorStyle;


        override protected function __unexecute():void
        {
            m_target.getView().setBodyAdjustColorStyle(_ADJUST_STYLE, false);
            super.__unexecute();
        }

        override protected function __execute():void
        {
            super.__execute();
            if (_ADJUST_STYLE == null){
                _ADJUST_STYLE = new AdjustColorStyle(1000, -25, 19, -100, 0);
            };
            m_target.getView().setBodyAdjustColorStyle(_ADJUST_STYLE);
        }

        public /*  ©init. */ function _SafeStr_1284()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1284 = " SS_Petrifaction" (String#15968)


