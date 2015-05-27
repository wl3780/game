// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.icon.IconLoader

package com.tencent.ai.core.manager.icon
{
    import com.tencent.free.core.manager.loader.BaseLoader;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.icon.impl.IconManager;
    import  ©init._SafeStr_663;

    public class IconLoader extends BaseLoader 
    {

        public function IconLoader(_arg_1:String="", _arg_2:String="")
        {
            if (_arg_1 != ""){
                _url = ((DEFINE.ICON_RES_SRC + _arg_1) + ".png");
            } else {
                _url = _arg_2;
            };
            super(_url, IconManager.getInstance());
        }

        public /*  ©init. */ function _SafeStr_663()
        {
        }


    }
}//package com.tencent.ai.core.manager.icon

// _SafeStr_663 = " IconLoader" (String#16436)


