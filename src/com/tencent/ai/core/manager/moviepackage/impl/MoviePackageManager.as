// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.moviepackage.impl.MoviePackageManager

package com.tencent.ai.core.manager.moviepackage.impl
{
    import com.tencent.free.core.manager.Manager;
    import  ©init._SafeStr_678;

    public class MoviePackageManager extends Manager 
    {

        private static var g_Instance:MoviePackageManager;
        public static var g_Max_Simultaneous_Task_Number:int = 4;

        public function MoviePackageManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():MoviePackageManager
        {
            if (g_Instance == null){
                g_Instance = new (MoviePackageManager)(MoviePackageFile, g_Max_Simultaneous_Task_Number, null);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_678()
        {
        }


    }
}//package com.tencent.ai.core.manager.moviepackage.impl

// _SafeStr_678 = " MoviePackageManager" (String#14771)


