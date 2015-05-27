// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.data.EnvironmentInfo

package com.tencent.ai.core.data
{
    import com.tencent.ai.core.manager.data.DEFINE;
    import  ©init._SafeStr_243;

    public class EnvironmentInfo 
    {

        public var coordOffset:MapPosition;
        public var G:int;
        public var friction:int = 500;
        public var dustEffectID:int = 7001;

        public function EnvironmentInfo()
        {
            this.G = DEFINE.G_GRAVITY;
            super();
        }

        public /*  ©init. */ function _SafeStr_243()
        {
        }


    }
}//package com.tencent.ai.core.data

// _SafeStr_243 = " EnvironmentInfo" (String#16178)


