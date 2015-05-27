// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.icon.impl.IconManager

package com.tencent.ai.core.manager.icon.impl
{
    import com.tencent.free.core.manager.Manager;
    import flash.display.Loader;
    import  ©init._SafeStr_662;

    public class IconManager extends Manager 
    {

        private static var g_Instance:IconManager;
        public static var g_Max_Simultaneous_Task_Number:int = 1000;

        public function IconManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():IconManager
        {
            if (g_Instance == null){
                g_Instance = new (IconManager)(Icon, g_Max_Simultaneous_Task_Number, Loader);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_662()
        {
        }


    }
}//package com.tencent.ai.core.manager.icon.impl

// _SafeStr_662 = " IconManager" (String#17078)


