// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_Frozen

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.render.ColorStyle;
    import  ©init._SafeStr_1281;

    public class SS_Frozen extends SS_Captive 
    {

        private static var _COLOR_STYLE:ColorStyle;


        override protected function __unexecute():void
        {
            m_target.getView().setBodyColorStyle(_COLOR_STYLE, false);
            super.__unexecute();
        }

        override protected function __execute():void
        {
            super.__execute();
            if (_COLOR_STYLE == null){
                _COLOR_STYLE = new ColorStyle(1000, -1, -0.5, 1, 1, 0xFF, 0xFF, 0xFF, 0);
            };
            m_target.getView().setBodyColorStyle(_COLOR_STYLE);
        }

        public /*  ©init. */ function _SafeStr_1281()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1281 = " SS_Frozen" (String#17192)


