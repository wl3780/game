// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.sound.SoundFileLoader

package com.tencent.ai.core.manager.sound
{
    import com.tencent.free.core.manager.loader.BaseLoader;
    import com.tencent.ai.core.manager.data.DEFINE;
    import com.tencent.ai.core.manager.sound.impl.SoundFileManager;
    import  ©init._SafeStr_682;

    public class SoundFileLoader extends BaseLoader 
    {

        public function SoundFileLoader(_arg_1:String)
        {
            super((DEFINE.SOUND_RES_SRC + _arg_1), SoundFileManager.getInstance());
            this._expireTime = (1000 * 60);
        }

        public /*  ©init. */ function _SafeStr_682()
        {
        }


    }
}//package com.tencent.ai.core.manager.sound

// _SafeStr_682 = " SoundFileLoader" (String#14954)


