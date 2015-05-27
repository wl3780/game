// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.SS_Rampage

package com.tencent.ai.core.status.impl
{
    import com.tencent.ai.core.render.ColorStyle;
    import  ©init._SafeStr_1285;

    public class SS_Rampage extends SS_SimpleSpecialStatus 
    {

        private static var _COLOR_STYLE:ColorStyle;

        public function SS_Rampage()
        {
            m_execute = this.__execute;
            m_unexecute = this.__unexecute;
        }

        protected function __unexecute():void
        {
            m_target.getView().setBodyColorStyle(_COLOR_STYLE, false);
        }

        protected function __execute():void
        {
            if (_COLOR_STYLE == null){
                _COLOR_STYLE = new ColorStyle(1000, 1, 1, 1, 1, 180);
            };
            m_target.getView().setBodyColorStyle(_COLOR_STYLE);
        }

        public /*  ©init. */ function _SafeStr_1285()
        {
        }


    }
}//package com.tencent.ai.core.status.impl

// _SafeStr_1285 = " SS_Rampage" (String#14078)


