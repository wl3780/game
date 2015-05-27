// Decompiled by AS3 Sorcerer 3.16
// http://www.as3sorcerer.com/

//com.tencent.free.core.swf.impl.SwfManager

package com.tencent.free.core.swf.impl
{
    import com.tencent.free.core.manager.Manager;
    import  ©init._SafeStr_43;

    public class SwfManager extends Manager 
    {

        private static var g_Instance:SwfManager;
        public static var g_Max_Simultaneous_Task_Number:int = 4;

        public function SwfManager(_arg_1:Class, _arg_2:int=1, _arg_3:Class=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public static function getInstance():SwfManager
        {
            if (g_Instance == null){
                g_Instance = new (SwfManager)(SwfFile, g_Max_Simultaneous_Task_Number, SwfFileDecoder);
            };
            return (g_Instance);
        }


        public /*  ©init. */ function _SafeStr_43()
        {
        }


    }
}//package com.tencent.free.core.swf.impl

// _SafeStr_43 = " SwfManager" (String#1448)


