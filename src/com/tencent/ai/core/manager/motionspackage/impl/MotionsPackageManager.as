// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.motionspackage.impl.MotionsPackageManager

package com.tencent.ai.core.manager.motionspackage.impl
{
    import com.tencent.free.core.manager.Manager;
    import  ©init._SafeStr_675;

    public class MotionsPackageManager extends Manager 
    {

        private static var g_Instance:MotionsPackageManager;
        public static var g_Max_Simultaneous_Task_Number:int = 1000;

        public function MotionsPackageManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():MotionsPackageManager
        {
            if (g_Instance == null){
                g_Instance = new (MotionsPackageManager)(MotionsPackageFile, g_Max_Simultaneous_Task_Number, null);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_675()
        {
        }


    }
}//package com.tencent.ai.core.manager.motionspackage.impl

// _SafeStr_675 = " MotionsPackageManager" (String#16571)


