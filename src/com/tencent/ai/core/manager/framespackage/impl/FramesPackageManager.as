﻿// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.framespackage.impl.FramesPackageManager

package com.tencent.ai.core.manager.framespackage.impl
{
    import com.tencent.free.core.manager.Manager;
    import  ©init._SafeStr_657;

    public class FramesPackageManager extends Manager 
    {

        private static var g_Instance:FramesPackageManager;
        public static var g_Max_Simultaneous_Task_Number:int = 4;

        public function FramesPackageManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():FramesPackageManager
        {
            if (g_Instance == null){
                g_Instance = new (FramesPackageManager)(FramesPackageFile, g_Max_Simultaneous_Task_Number, null);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_657()
        {
        }


    }
}//package com.tencent.ai.core.manager.framespackage.impl

// _SafeStr_657 = " FramesPackageManager" (String#13853)


