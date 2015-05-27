// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.status.impl.ssef.SSEF_SetBodyAlpha

package com.tencent.ai.core.status.impl.ssef
{
    import com.tencent.ai.core.display.IDisplay;
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_1268;

    public class SSEF_SetBodyAlpha extends SSEF_Base 
    {

        private var _display:IDisplay;


        override public function finalize():void
        {
            this._display.alpha = 1;
            super.finalize();
        }

        override public function execute():void
        {
            this._display = m_target.getActorView().getBody().getDisplay();
            if (this._display != null){
                this._display.alpha = DEFINE.CAST_FLOAT(m_info.data_1);
            };
        }

        public /*  ©init. */ function _SafeStr_1268()
        {
        }


    }
}//package com.tencent.ai.core.status.impl.ssef

// _SafeStr_1268 = " SSEF_SetBodyAlpha" (String#17174)


