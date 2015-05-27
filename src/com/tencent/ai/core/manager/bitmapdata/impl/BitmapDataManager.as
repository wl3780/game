// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.ai.core.manager.bitmapdata.impl.BitmapDataManager

package com.tencent.ai.core.manager.bitmapdata.impl
{
    import com.tencent.free.core.manager.Manager;
    import flash.display.Loader;
    import  ©init._SafeStr_585;

    public class BitmapDataManager extends Manager 
    {

        private static var g_Instance:BitmapDataManager;
        public static var g_Max_Simultaneous_Task_Number:int = 4;

        public function BitmapDataManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():BitmapDataManager
        {
            if (g_Instance == null){
                g_Instance = new (BitmapDataManager)(BitmapDataFile, g_Max_Simultaneous_Task_Number, Loader);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_585()
        {
        }


    }
}//package com.tencent.ai.core.manager.bitmapdata.impl

// _SafeStr_585 = " BitmapDataManager" (String#16160)


